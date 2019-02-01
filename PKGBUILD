# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=kazan-git
pkgver=20190201
pkgrel=1
pkgdesc="Software-rendering Vulkan implementation"
arch=('x86_64')
url="http://kazan-3d.org"
license=('MIT')
makedepends=('git' 'sdl2' 'cargo' 'python' 'clang' 'cmake' 'ninja')
optdepends=('sdl2: for demo program')
provides=('kazan')
conflicts=('kazan')
source=('git+https://salsa.debian.org/Kazan-team/kazan.git')
md5sums=('SKIP')

prepare() {
  cd "${srcdir}/kazan"

  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/kazan"

  cargo build --release
}

package() {
  cd "${srcdir}/kazan/target/release"

  install -Dm755 libkazan_driver.so "${pkgdir}/usr/lib/libkazan_driver.so"
  mkdir -p "${pkgdir}"/usr/share/vulkan/icd.d/
  sed 's/"library_path": ".*"/"library_path": "libkazan_driver.so"/' $(find . -name kazan_driver.json) > "${pkgdir}"/usr/share/vulkan/icd.d/kazan_icd.json
}

check() {
  cd "${srcdir}/kazan"

  cargo test
}

# vim:set ts=2 sw=2 et:
