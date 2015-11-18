# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: Andy Li <andy@onthewings.net>
# Contributor: Kyle Brady  <kyle at spark-gap dot com>
# Contributor: Patrick Hof <courts@offensivethinking.org>
# Contributor: Michael Fellinger <mf@rubyists.com>

pkgname=haxe
pkgver=3.2.1
_pkgver=${pkgver/rc?/}
pkgrel=2
pkgdesc="The Cross-Platform Toolkit"
arch=('i686' 'x86_64')
url='http://haxe.org/'
# http://haxe.org/foundation/open-source.html
license=('GPL' 'MIT' 'LGPL')
groups=('devel')
depends=('neko>=2.0.0')
optdepends=('python' 'php' 'java-environment' 'mono')
makedepends=('git' 'ocaml>=4.00.0' 'zlib' 'neko>=2.0.0' 'camlp4')
provides=('haxe' 'haxelib')
options=('!strip' '!makeflags')
source=(
  "$pkgname-${_pkgver}::git+https://github.com/HaxeFoundation/haxe.git#tag=${pkgver/rc/-rc}"
  'git+https://github.com/HaxeFoundation/haxelib.git'
  'git+https://github.com/HaxeFoundation/ocamllibs.git'
)
md5sums=('SKIP'
         'SKIP'
         'SKIP')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"

  git submodule init
  git config submodule.extra/haxelib_src.url "$srcdir"/haxelib
  git config submodule.libs.url "$srcdir"/ocamllibs
  git submodule update

  make
  make tools
}

check() {
  cd "$srcdir/$pkgname-${_pkgver}"

  echo "haxe version:"
  ./haxe -version
  echo "haxelib version:"
  ./haxelib version
}

package() {
  install -d "$pkgdir"/usr/bin/ "$pkgdir"/usr/share/haxe/
  install -m=755 "$srcdir/$pkgname-${_pkgver}"/{haxe,haxelib} "$pkgdir"/usr/bin/
  cp -rf "$srcdir/$pkgname-${_pkgver}"/std "$pkgdir"/usr/share/$pkgname/
  install -D -m=644 "$srcdir/$pkgname-${_pkgver}"/extra/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
