pkgname=belle-sip-git
_basename=belle-sip
pkgver=1.3.3.r62.gfe20a9e
pkgrel=1
pkgdesc="A Voice-over-IP phone (git version)"
arch=('i686' 'x86_64')
url="http://www.linphone.org/index.php/eng"
license=('GPL')
depends=('libantlr3c' 'gcc-libs' 'polarssl')
makedepends=('java-runtime')
options=('!emptydirs')
source=("git://git.linphone.org/$_basename.git" \
         "antlr.jar::https://github.com/antlr/website-antlr3/blob/gh-pages/download/antlr-3.4-complete.jar?raw=true")

provides=("${_basename}")
conflicts=("${_basename}")

prepare() {
  cd $_basename
  ./autogen.sh
  sed -i "s#antlr_java_prefixes=.*#antlr_java_prefixes=$srcdir#" configure{,.ac}
  sed -i "s#-Werror##" configure{,.ac}

}

build() {
  cd $_basename
  ./configure --prefix=/usr  --libexecdir=/usr/lib/$pkgname \
    --disable-tests --disable-static --enable-tls
  CFLAGS="$CFLAGS -Wno-error=cpp"  make
}

package() {
  cd $_basename
  make DESTDIR="$pkgdir" install
}

pkgver() {
 cd "$_basename"
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
sha256sums=('SKIP'
            '9d3e866b610460664522520f73b81777b5626fb0a282a5952b9800b751550bf7')
