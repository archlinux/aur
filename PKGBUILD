#!/hint/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Jonian Guveli <https://github.com/jonian/>

pkgname=gnome-shell-extension-clipboard-indicator
_uuid=clipboard-indicator@tudmotu.com
pkgver=73
pkgrel=1
pkgdesc="The most popular clipboard manager for GNOME"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("MIT")
makedepends=(
  jq
)
conflicts=("gnome-shell-extension-clipboard-history")
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('ec6765db8a94c4653cb82657e3576645bddec35b5b85658280a66e7d56c257c9')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i \
    -e 's/^\(install:\) all$/\1/' \
    Makefile
}

package() {
  depends=(
    "gnome-shell"
  )

  : "${pkgdir:?}"

  cd "${pkgname}-${pkgver}"

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
    "gnome-shell>=1:$((shell_ver_min))"
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
: "${sha256sums[@]}"
: "${source[@]}"
