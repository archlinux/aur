# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
epoch=1
pkgver=25.1.0
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
        templates-parser.tar.gz::https://github.com/AdaCore/templates-parser/archive/refs/tags/v25.0.0.tar.gz)

sha256sums=(1fa8ba1128506f5b5ff8722a7fb0df8cb804147324e04c3d63c74954200d4735
            03cd620c658aee3c2d69be0a8369e45666dc51d25d3cb580b77c4ad471446041)


prepare()
{
    cd $srcdir/aws-$pkgver

    rmdir templates_parser
    ln -s $srcdir/templates-parser-25.0.0 templates_parser
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
    
    make -j1 html latexpdf        \
       1> build_docs-warnings.log \
       2> build_docs-errors.log
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