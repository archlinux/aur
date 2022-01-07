pkgname=awlib-git
pkgver=0.0.2.r1900.g70d01569
pkgrel=1
pkgdesc="C++ helper library"
arch=('i686' 'x86_64')
depends=()
makedepends=('git')
url="https://git.absurdworlds.org/awlib.git"
license=('LGPLv3')
source=('git+https://github.com/absurdworlds/awlib.git')
provides=('awlib')
conflicts=('awlib')
sha256sums=('SKIP')
options+=('!strip' 'debug')

pkgver() {
  cd ${pkgname%-git}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
 cd "${srcdir}"/${pkgname%-git}
 cp Config.mk{.in,}
}

build() {
 cd "${srcdir}"/${pkgname%-git}
 make target="release install"
}

package() {
  install -d -m755 "${pkgdir}/usr/include"
  install -d -m755 "${pkgdir}/usr/lib"
  cp -r "${srcdir}/${pkgname%-git}/include/aw" "${pkgdir}/usr/include"
  cp -a "${srcdir}/${pkgname%-git}/lib/."      "${pkgdir}/usr/lib"
}
