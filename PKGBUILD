# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="xf86-input-libinput"
_pkgname="${_basename//xf86/xlibre}"
pkgname="${_pkgname}-git"
pkgver=1.5.0.1.r3.83adc38
pkgrel=1
pkgdesc="Generic input driver for the Xlibre server based on libinput"
arch=('aarch64' 'x86_64')
url="https://github.com/X11Libre/${_basename}"
license=('MIT')
depends=('glibc' 'libinput>=1.11')
makedepends=('git' 'libx11' 'libxi' 'meson>=0.50' 'xlibre-server-devel' 'xorgproto' 'X-ABI-XINPUT_VERSION=26.0')
provides=("${_pkgname}=${pkgver%%.r*}") # "${_basename}=${pkgver%%.r*}"
conflicts=("${_pkgname}=${pkgver%%.r*}" "${_basename}=${pkgver%%.r*}" 'xorg-server<1.19.0' 'X-ABI-XINPUT_VERSION<26' 'X-ABI-XINPUT_VERSION>=27')
groups=('xlibre-drivers-git')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  local tag ver rev hash
  tag="$(git tag -l "xlibre-${_basename}-*" --sort=-v:refname | head -n1)"
  ver="${tag#"xlibre-${_basename}"-}"
  rev="$(git rev-list --count "$tag"..HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf "%s.r%s.%s" "$ver" "$rev" "$hash"
}

build() {
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
  )
  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
