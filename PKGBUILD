# Maintainer: Tim Jester-Pfadt <t.jp@gmx.de>

pkgname=apitest-git
_pkgname=apitest
pkgver=145.a3f38b1
pkgrel=1
pkgdesc="Simple comparison framework for graphics APIs"
arch=('i686' 'x86_64')
url="https://github.com/nvMcJohn/apitest"
license=('Unlicense')
makedepends=('cmake' 'git')
depends=('sdl2')
source=('git+https://github.com/nvMcJohn/apitest.git'
sdl2.patch)
sha256sums=('SKIP'
            '53abb72973bdab839cf973a220c71ee9bb8285f247fca89363953b2ffa19cda2')

provides=(${_pkgname})
pkgver() {
  cd "$srcdir"/apitest
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
prepare(){
  cd $srcdir/apitest
  patch --strip=1 < ../sdl2.patch
}

build() {
  cd "$srcdir"/apitest
  test -d _out && rm -rf _out 
  mkdir _out
  cd _out
  cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ..
  make
}

package() {
  cd "$srcdir"/apitest/
  install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/apitest/LICENSE
  
  cd bin
  install -Dm755 ${_pkgname} -t ${pkgdir}/usr/bin
  install -d "$pkgdir"/usr/share/${_pkgname}
  cp -rf Media Shaders "$pkgdir"/usr/share/${_pkgname}
}


