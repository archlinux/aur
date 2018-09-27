pkgname=obs-glcapture-git
_pkgname=${pkgname%-git}
pkgver=r5.79c9ca0
pkgrel=1
pkgdesc="GL capturing for OBS using SSR-GLinject"
arch=("any")
url="https://github.com/therealfarfetchd/obs-glcapture"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("obs-studio" "simplescreenrecorder")
makedepends=("git" "cmake")
source=("${_pkgname}::git+https://github.com/therealfarfetchd/obs-glcapture.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cmake .
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  install -Dm644  "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"

  install -Dm644  "${srcdir}/${_pkgname}/libobs-glcapture.so" "${pkgdir}/usr/lib/obs-plugins/libobs-glcapture.so"
}
