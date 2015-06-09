# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Kyle Brady  <kyle at spark-gap dot com>
# Contributor: Patrick Hof <courts@offensivethinking.org>
# Contributor: Michael Fellinger <mf@rubyists.com>

pkgname=haxe
pkgver=3.2.0
_pkgver=${pkgver/rc?/}
pkgrel=1
pkgdesc="The Cross-Platform Toolkit"
arch=('i686' 'x86_64')
url=http://haxe.org/
license=('GPL2' 'MIT')
groups=('devel')
depends=('neko>=2.0.0')
optdepends=('python' 'php' 'java-environment' 'mono')
makedepends=('git' 'ocaml>=4.00.0' 'zlib' 'neko>=2.0.0' 'camlp4')
provides=('haxe')
options=('!strip' 'emptydirs' '!makeflags')
install=haxe.install
source=(
  "$pkgname-${_pkgver}::git+https://github.com/HaxeFoundation/haxe.git#tag=${pkgver/rc/-rc}"
  'git+https://github.com/HaxeFoundation/haxelib.git'
  'git+https://github.com/HaxeFoundation/ocamllibs.git'
  'haxeserver'
  'haxe.sh'
  'haxe.csh')
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '888e2aa9e2583bc9888cc9889b24e3e7'
  'acf2d50add2ccc19cf4e84d14b4bb5f8'
  'b4263f4b8a2ed3308cdff93d01b70227')

build() {
  cd "$srcdir/$pkgname-${_pkgver}"

  git submodule init
  git config submodule.extra/haxelib_src.url "$srcdir"/haxelib
  git config submodule.libs.url "$srcdir"/ocamllibs
  git submodule update

  make
  make tools
}

package() {
  install --directory "$pkgdir"{/usr/{bin,lib/haxe/lib},/etc/profile.d,/opt/haxe,/usr/share/"$pkgname"}
  install --mode=755 "$srcdir"/haxeserver "$pkgdir"/usr/bin/
  install --mode=755 "$srcdir"/haxe.{,c}sh "$pkgdir"/etc/profile.d/
  cp --recursive "$srcdir/$pkgname-${_pkgver}"/std "$pkgdir"/opt/haxe/
  install --mode=644 --target-directory "$pkgdir"/usr/share/"$pkgname" "$srcdir/$pkgname-${_pkgver}"/extra/{LICENSE,CHANGES}.txt 
  install --mode=755 "$srcdir/$pkgname-${_pkgver}"/{haxe,haxelib} "$pkgdir"/usr/bin/
}

# vim:set ts=2 sw=2 et:
