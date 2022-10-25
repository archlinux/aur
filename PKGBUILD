# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastian Bøe <sebastianbooe at gmail dot com>

pkgname=firrtl
pkgver=1.5.3
pkgrel=2
pkgdesc='Flexible Intermediate Representation for RTL'
arch=('any')
url='https://github.com/freechipsproject/firrtl'
license=('Apache')
provides=('firrtl')
conflicts=('firrtl')
depends=('java-environment' 'bash')
makedepends=('antlr4' 'protobuf' 'mill' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freechipsproject/firrtl/archive/v$pkgver.tar.gz"
        'firrtl.sh')
sha512sums=('12277eb2d43819fb5fde428a917e15c2da585162b02fc7d9f9ab6797aee32758328da246c5959b129111b906631a53be20d66c0e659457091bc1aa7011c7a4e8'
            '2e3ca5c5771bbbf4cfa1245e5bc6e1b65cc17f521ee62ca79e044d24be3c403f85ad8134734eed66132190c1d02e1295de4a0c7a46fd057d8040f1c8cb1865a2')

prepare() {
  cd firrtl-$pkgver
  # Force using system antlr4 and protoc
  _antlr4_version=$(antlr4 | head -n1 | grep -oP "(?<=Version ).+")
  _protoc_version=$(protoc --version | grep -oP "(?<=libprotoc ).+")
  sed -e "s/def antlr4Version = \"4.9.3\"/def antlr4Version = \"$_antlr4_version\"/" \
      -e "s/def protocVersion = \"3.15.6\"/def protocVersion = \"$_protoc_version\"/" \
      -i build.sc
}

build(){
  cd firrtl-$pkgver
  mill -i firrtl[2.13.7].assembly
}

package() {
  install -Dm755 firrtl.sh "$pkgdir"/usr/bin/firrtl

  cd firrtl-$pkgver
  install -Dm755 out/firrtl/2.13.7/assembly.dest/out.jar "$pkgdir"/usr/share/scala/$pkgname/firrtl.jar
}
