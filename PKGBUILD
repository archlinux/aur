# Maintainer: czyt <czytcn@gmail.com>

pkgname=orbien-desktop-bin
pkgver=3.4.0
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
sha256sums_x86_64=('ee21436ceb15e617c463b262d207539bc923370051a40661da0a0215838249f9')
sha256sums_aarch64=('ab124f1ff9d4541719abfdc6478c10878a71b75e90cf665af4de1da4ea39e699')

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
