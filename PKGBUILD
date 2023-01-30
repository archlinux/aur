# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
epoch=1
pkgver=23.0.0
pkgrel=1
pkgdesc="A complete embeddable web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=(gnatcoll-core openssl python)
makedepends=(gprbuild texlive-bin texlive-core texlive-latexextra python-sphinx)

provides=(aws)

source=(aws.tar.gz::https://github.com/AdaCore/aws/archive/refs/tags/v$pkgver.tar.gz
        templates-parser.tar.gz::https://github.com/AdaCore/templates-parser/archive/refs/tags/v$pkgver.tar.gz)

sha256sums=(c63cec91ddf6ac55382f27e31ccd2dc17aabd7c713a70e39e2dab257a77d832c
            0fb0094fba45bd28bf2093394207e9f312d99a9d27a741b7ffd1b1a21c2c0285)


prepare()
{
    cd $srcdir/aws-$pkgver

    rmdir templates_parser
    ln -s "$srcdir/templates-parser-$pkgver" templates_parser
}


build() 
{
    cd "$srcdir/aws-$pkgver/templates_parser"

    PRJ_BUILD=Release make DEBUG=false prefix=/usr setup 
    PRJ_BUILD=Release make DEBUG=false build

    cd docs
    mkdir -p build
    make -j1 html latexpdf

    cd $srcdir/aws-$pkgver
    PRJ_BUILD=Release DEBUG=false make -j1 prefix=/usr SOCKET=openssl setup
    PRJ_BUILD=Release DEBUG=false make -j1 build

    cd $srcdir/aws-$pkgver/docs
    make -j1 html latexpdf
}


package() 
{
    cd $srcdir/aws-$pkgver/templates_parser
    make -j1 DEBUG=false DESTDIR="$pkgdir" install

    cd $srcdir/aws-$pkgver
    make -j1 DESTDIR="$pkgdir" install


    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"


   # Install the templates-parser license.
   install -D -m644     \
      "COPYING3"        \
      "$pkgdir/usr/share/licenses/templates-parser/COPYING3"

   # Install the templates-parser custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/templates-parser/COPYING.RUNTIME"
}