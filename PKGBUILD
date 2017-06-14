# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=glsl-debugger-git
pkgver=r390.06cb427
pkgrel=1
epoch=1
pkgdesc="GLSL source level debugger. This is the Open Source public release of the project originally known as glslDevil."
arch=('i686' 'x86_64')
url="http://glsl-debugger.github.io/"
license=('custom')
depends=('qt4' 'glew' 'freeglut')
makedepends=('git' 'cmake')
source=("$pkgname::git://github.com/GLSL-Debugger/GLSL-Debugger.git"
        "perl5.26.patch::https://github.com/GLSL-Debugger/GLSL-Debugger/commit/1a7d86d5161871beb8c6dff58a288baa09ad9633.patch")
md5sums=('SKIP'
         '57858a4276634f19f6fdad6d3fda66a5')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  git apply  "$srcdir/perl5.26.patch"
}
 
build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "../$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}
 
package() {
  cd "$srcdir/build"

  #install files manually
  install -dm755 "$pkgdir"/usr/{lib,bin}
  cp -a lib/* "$pkgdir/usr/lib"
  cp -a bin/* "$pkgdir/usr/bin"

  # install license file
  install -Dm644 "$srcdir/$pkgname/LICENSE.TXT" \
	    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
