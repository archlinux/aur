# Maintainer: yjmthu <yjmthu@gmail.com>

pkgname=neobox-git
pkgver=2.4.3
pkgrel=1
pkgdesc="采用 C++ 20 编写的一个插件管理工具，可以安装网速悬浮窗等插件。"
arch=('x86_64')
url="https://github.com/yjmthu/Neobox"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(curl
        qt6-base)
makedepends=(cmake
            git
            ninja)
backup=()
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}/"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}/"
  cmake -S . \
      -D CMAKE_BUILD_TYPE=None \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_INSTALL_LIBDIR=lib \
      -D CMAKE_INSTALL_LIBEXECDIR=lib \
      -B build \
      -G Ninja

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/$pkgname/build install
}

