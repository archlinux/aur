#!/bin/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Jonian Guveli <https://github.com/jonian/>

_pkgname=gnome-shell-extension-clipboard-indicator
_uuid=clipboard-indicator@tudmotu.com
pkgname="${_pkgname}-latest"
pkgver=71
pkgrel=2
pkgdesc="The most popular clipboard manager for GNOME - always up-to-date"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
makedepends=(
  jq
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
  gnome-shell-extension-clipboard-history
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  gnome-51-pr-641.patch
)
sha256sums=('31d6c3694889b0f1c257b113926643e6a37610495f501cbd810eb2c14b9ebd85'
            '4b790f67fad8458b1d1706f34e3f7edfc68d5f179193da5a16c457f22c6fb433')

prepare() {
  cd "${_pkgname}-${pkgver}"

  sed -i \
    -e 's/\bREADME\.rst\b//' \
    -e 's/^\(install:\) all$/\1/' \
    Makefile

  patch -p1 -i ../gnome-51-pr-641.patch
}

package() {
  depends=(
    "gnome-shell"
  )

  : "${pkgdir:?}"

  cd "${_pkgname}-${pkgver}"

  make "INSTALLPATH=${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" install

  install -d "$pkgdir/usr/share/glib-2.0" \
    && mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas" "$_"
  rm -f "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}" \
    && mv "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/LICENSE.rst" "$_"

  local depends_constraints shell_ver_min shell_ver_max
  read -r shell_ver_min shell_ver_max < <(
    jq \
      --raw-output \
      '.["shell-version"] | map(tonumber) | "\(min) \(max)"' \
      metadata.json
  )
  depends_constraints=(
    "gnome-shell>=1:${shell_ver_min}"
    "gnome-shell<1:$((shell_ver_max + 1))"
  )
  depends+=("${depends_constraints[@]}")
}

: "${arch[@]}"
: "${conflicts[@]}"
: "${depends[@]}"
: "${license[@]}"
: "${makedepends[@]}"
: "${pkgdesc}"
: "${pkgrel}"
: "${provides[@]}"
: "${sha256sums[@]}"
: "${source[@]}"
