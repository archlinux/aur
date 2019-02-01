# Maintainer: aksr <aksr at t-com dot me>
pkgname=regoth-git
pkgver=0.4.357.r1599.65c72f0
pkgrel=1
epoch=
pkgdesc="OpenSource-Reimplementation of the zEngine, used by the game 'Gothic'"
arch=('i686' 'x86_64')
url="https://github.com/REGoth-project/REGoth"
license=('GPLv3')
categories=()
groups=()
depends=('gcc>=6')
makedepends=('git' 'cmake')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install="${pkgname%-*}".install
source=("$pkgname::git+https://github.com/REGoth-project/REGoth.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.r%s.%s" "$(git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^nightly.//')" \
                     "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j$(grep -c ^processor /proc/cpuinfo)
}

package() {
  cd "$srcdir/$pkgname/build/bin"
  mkdir -p $pkgdir/usr/{bin,share/${pkgname%-*}/}
  for i in altonegen makehrtf openal-info REGoth write_sf2; do
    install -Dm755 $i "$pkgdir/usr/share/${pkgname%-*}/$i"
  done
  ln -rs $pkgdir/usr/share/${pkgname%-*}/REGoth $pkgdir/usr/bin/REGoth
  cp -r shaders $pkgdir/usr/share/${pkgname%-*}/
  install -Dm644 ../../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 ../../LICENSE.md $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

