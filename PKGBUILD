# Maintainer: aksr <aksr at t-com dot me>
pkgname=regoth-git
pkgver=r533.e080948
pkgrel=1
epoch=
pkgdesc="Reimplementation of Gothic I and II using modern technologies."
arch=('i686' 'x86_64')
url="https://github.com/REGoth-project/REGoth-bs"
url="https://regoth-project.github.io/REGoth-bs"
license=('MIT')
categories=()
groups=()
depends=('gcc>=6')
depends=(physfs libx11 libxcursor libxi icu mesa freeglut libxrandr)
makedepends=('git' 'cmake')
optdepends=('doxygen: for documentation'
            'plantuml: for documentation')
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install="${pkgname%-*}".install
source=("$pkgname::git+https://github.com/REGoth-project/REGoth-bs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  cmake --build . --parallel $(nproc)
}

package() {
  cd "$srcdir/$pkgname/build/bin"
  mkdir -p $pkgdir/usr/{bin,lib}
  for i in *; do
    install -Dm755 $i "$pkgdir/usr/bin/$i"
  done
  cp -r ../lib/lib* $pkgdir/usr/lib
  install -Dm644 ../../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 ../../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

