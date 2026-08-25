# Maintainer: czyt <czytcn@gmail.com>

pkgname=orbien-desktop-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight, high-performance intranet tunneling tool with a native desktop client"
arch=('x86_64' 'aarch64')
url="https://github.com/orbien-org/orbien"
license=('Apache-2.0')

depends=(
  'fontconfig'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrender'
  'wayland'
)
makedepends=('libarchive')
provides=("orbien-desktop=${pkgver}")
conflicts=('orbien-desktop')
options=('!debug' '!strip')

_deb_x86_64="orbien-desktop_${pkgver}_linux_amd64.deb"
_deb_aarch64="orbien-desktop_${pkgver}_linux_arm64.deb"
source_x86_64=(
  "${_deb_x86_64}::https://github.com/orbien-org/orbien/releases/download/v${pkgver}/${_deb_x86_64}"
)
source_aarch64=(
  "${_deb_aarch64}::https://github.com/orbien-org/orbien/releases/download/v${pkgver}/${_deb_aarch64}"
)
noextract=("${_deb_x86_64}" "${_deb_aarch64}")
sha256sums_x86_64=('cb895972a1c8d79dab4845290b511416e9bb18963d512e3893c03f4f3f878dd1')
sha256sums_aarch64=('c8b0e85f591975d6ba7582cf1eecbaa07b77f8866642a26b5f1d4f242292109b')

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | awk '/^data\.tar\./ { print; exit }')"
  [[ -n "${data_archive}" ]] || {
    printf 'Could not find data.tar.* in %s\n' "${deb}" >&2
    return 1
  }

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/doc/orbien-desktop/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/share/doc"
  chmod -R u=rwX,go=rX "${pkgdir}"
}
