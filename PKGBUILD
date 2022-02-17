# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=tuxedo-touchpad-switch
pkgver=1.0.3
pkgrel=2
pkgdesc="A Linux userspace driver to enable and disable the touchpads on TongFang/Uniwill laptops"
url="https://github.com/tuxedocomputers/tuxedo-touchpad-switch"
arch=(x86_64)
license=(GPL3)

depends=("glib2")
makedepends=("git" "cmake" "ninja")

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

_commit="88c8e4561087a3c7e8bf60bdd72a1f0005864eb0"
#https://github.com/tuxedocomputers/tuxedo-touchpad-switch/archive/v$pkgver/${pkgname}-${pkgver}.tar.gz
source=(
  git+https://github.com/tuxedocomputers/tuxedo-touchpad-switch.git#commit=$_commit
  0001-plasma_5-24.patch
)
sha256sums=(
  SKIP
  5f9f5e02c2913ea16936961c4bd02ad444123d0a6cc441fa8f5cab9b5f905b7b
)
#sha256sums=('dd4fa6871735fed3e094f177f0a2d0861fd3411ef4e6fbf1fbba5405a01ae219')

prepare() {
  cd "${pkgname}"

  patch -p1 -i "${srcdir}/0001-plasma_5-24.patch"
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
