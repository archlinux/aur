# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_base="p11"
_pkgbase="${_base}-kit"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
  "lib${pkgbase}")
pkgver=0.25.0+1+g76be1cf
pkgrel=1
pkgdesc="Loads and enumerates PKCS#11 modules"
_ns="${_base}-glue"
url="https://${_ns}.freedesktop.org"
arch=(x86_64)
license=(BSD)
makedepends=(
  gtk-doc
  meson
  libtasn1
  libffi
  systemd
  bash-completion)
_repo_url="https://github.com/${_ns}/${_pkgbase}"
source=(
  "git+${_repo_url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgbase}"
}

build() {
  local _etc_ts="/etc/ca-certificates/trust-source"
  local _share_ts="/usr/share/ca-certificates/trust-source"

  arch-meson "${_pkgbase}" build \
    -D gtk_doc=true \
    -D man=true \
    -D trust_paths="${_etc_tp}:${_share_tp}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_p11-kit-git() {
  depends=("lib${_pkgbase}=${pkgver}-${pkgrel}"
           coreutils
           "lib${_pkgbase}.so"
           libsystemd.so)
  conflicts=("${_pkgbase}")
  provides=("${_pkgbase}=${pkgver}")
  install="${_pkgbase}.install"

  meson install -C build --destdir "${pkgdir}"
  ln -srf "${pkgdir}/usr/bin/update-ca-trust" \
          "${pkgdir}/usr/lib/${_pkgbase}/trust-extract-compat"

  # Split libp11-kit
  _pick lib "$pkgdir"/usr/include
  _pick lib "$pkgdir"/usr/lib/{"${_pkgbase}-proxy.so","lib${_pkgbase}."*}
  _pick lib "$pkgdir"/usr/lib/{pkcs11,pkgconfig}
  _pick lib "$pkgdir"/usr/share/{locale,"${_pkgbase}"}

  install -Dt "$pkgdir/usr/share/licenses/${_pkgbase}" \
          -m644 "${_pkgbase}/COPYING"
}

package_libp11-kit-git() {
  pkgdesc+=" (library)"
  depends=(glibc libtasn1 libffi)
  conflicts=("lib${_pkgbase}")
  provides=("lib${_pkgbase}.so=${pkgver}"
            "lib${_pkgbase}")

  mv lib/* "${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" \
          -m644 "${_pkgbase}/COPYING"
}

# vim:set sw=2 et:
