# Maintainer: Nikolay Bogoychev <nheart@gmail.com>
# Improved by yochananmarqos https://aur.archlinux.org/packages/translatelocally-git
pkgname=translatelocally-git
pkgver=r512.1d0d382
pkgrel=1
pkgdesc="Fast and secure translation on your local machine, powered by marian and Bergamot."
arch=('x86_64')
url="https://translatelocally.com"
license=('MIT')
depends=('libarchive' 'qt6-base' 'qt6-svg' 'pcre2')
makedepends=('cmake' 'git' 'intel-oneapi-mkl' 'qt6-tools' 'gcc14')
source=('git+https://github.com/XapaJIaMnu/translateLocally.git')
sha256sums=('SKIP')

pkgver() {
  cd translateLocally
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd translateLocally

  # There are many submodules that may change occasionally
  git submodule update --init --recursive
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S translateLocally \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_C_COMPILER='gcc-14' \
    -DCMAKE_CXX_COMPILER='g++-14' \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd translateLocally

  # Yes, they spelled it wrong...
  install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
