# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.0.7
pkgrel=2
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL3)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_commit="78f47d6c21429c188a4742f5d39e09767b54f3ae" # tag v1.0.7
#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#commit=$_commit
  0001-use_kded6_instead_of_kded5.patch
)
sha256sums=('21cb0dfe08a74585f0729f0db29dd7a20e3f7f8045265d7c28c5743e8f30d940'
            '68fb24f5ac87613458d438d5993e1a397f102d5db2e6dc12fef1635ad090351f')

prepare() {
  cd "${pkgname}"
  patch -Np1 < "${srcdir}"/0001-use_kded6_instead_of_kded5.patch
}

build() {
  cd "${pkgname}"

  cmake -B builddir -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  ninja -C builddir
}

package() {
  cd "${pkgname}"

  DESTDIR="${pkgdir}" ninja -C builddir install
}
