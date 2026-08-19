# Maintainer: czyt <czytcn@gmail.com>

pkgname=orbien-desktop-bin
pkgver=3.1.0
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
sha256sums_x86_64=('9ed44c9c41cdabe5e13d22ab0a2c9fe4009571045eb28e8aac8776042327918b')
sha256sums_aarch64=('98c5cce8ce58e92dca7b114fc59e8cb9cb8a21ac339e8e8d5ef52a2d1e346478')

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
