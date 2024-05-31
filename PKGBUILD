# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
epoch=1
pkgver=24.0.0
pkgrel=1
pkgdesc='A complete embeddable web application framework for Ada.'

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=(gnatcoll-core
         openssl
         python)
makedepends=(gprbuild
             texlive-meta
             python-sphinx)

provides=(aws)

source=(aws.tar.gz::https://github.com/AdaCore/aws/archive/refs/tags/v$pkgver.tar.gz
        templates-parser.tar.gz::https://github.com/AdaCore/templates-parser/archive/refs/tags/v$pkgver.tar.gz
        Makefile.patch)

sha256sums=(SKIP
            28caf00cfd7039f91055c726c91c45483fefae20eafaef3a91cb026e4343ee97
            SKIP)


prepare()
{
    cd $srcdir/aws-$pkgver

    patch -Np0 -i $srcdir/Makefile.patch

    rmdir templates_parser
    ln -s $srcdir/templates-parser-24.0.0 templates_parser
}


build() 
{
    cd $srcdir/aws-$pkgver/templates_parser

    PRJ_BUILD=Release make DEBUG=false prefix=/usr setup 
    PRJ_BUILD=Release make DEBUG=false build

    cd $srcdir/aws-$pkgver
    PRJ_BUILD=Release DEBUG=false make -j1 prefix=/usr SOCKET=openssl setup
    PRJ_BUILD=Release DEBUG=false make -j1 build

    cd $srcdir/aws-$pkgver/docs
    make -j1 html latexpdf    \
    1> build_docs-1.log       \
    2> build_docs-2.log       \
    
}


package() 
{
    cd $srcdir/aws-$pkgver
    make -j1 DESTDIR="$pkgdir" install

    rm $pkgdir/usr/bin/templates2ada
    rm $pkgdir/usr/bin/templatespp

    # Install the license.
    #
    install -D -m644     \
       COPYING3          \
       $pkgdir/usr/share/licenses/$pkgname/COPYING3

    # Install the custom license.
    #
    install -D -m644     \
       COPYING.RUNTIME   \
       $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
