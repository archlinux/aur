# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
pkgver=2022
pkgrel=2
pkgdesc="A complete embeddable web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=(openssl)
makedepends=(gprbuild texlive-bin texlive-core python-sphinx)

provides=(aws)

source=(aws.tar.gz::https://github.com/AdaCore/aws/archive/refs/tags/v22.0.0.tar.gz
        templates-parser.tar.gz::https://github.com/AdaCore/templates-parser/archive/refs/tags/v22.0.0.tar.gz
        patch-aws-client-http_utils.ads
        patch-templates_parser.adb
        patch-aws-dispatchers-callback.ads
        patch-aws-net-acceptors.ads
        patch-aws-net-websocket-registry.adb)

sha256sums=(52abc9aee16975840da7754767f3f27b6bfcc88e4437f9befed9cfe76504d10c
            1e217260bf3b26809fc5d09f9a0ec22c2b0ed412600c0fea2291f02c30328941
            1a32395e200e0518e64ec3584ad081a72ffda03d8bb97ed8060c29979fb60c0a
            419f17b9e037b582bedb67c76869a564b80f5a62f0269724d7d7da64be5b6c63
            9413fff6b28b57531b606a224115f3f6de21ebc5c5c7cf9703e1d29ee81d279d
            71e302a87fc1581c54e4246d38d8956e7bdcf3107fb9855300e676e59e68ab38
            8165dc74693ed40162d1426309cd4a304f1fd213ec35915ed21662ccaec39587)


prepare()
{
    cd $srcdir/aws-22.0.0

    rmdir templates_parser
    ln -s "$srcdir/templates-parser-22.0.0" templates_parser

    patch -p0 -i ../patch-aws-client-http_utils.ads
    patch -p0 -i ../patch-aws-dispatchers-callback.ads
    patch -p0 -i ../patch-aws-net-acceptors.ads
    patch -p0 -i ../patch-aws-net-websocket-registry.adb

    cd $srcdir/templates-parser-22.0.0
    patch -p0 -i ../patch-templates_parser.adb
}


build() 
{
    cd "$srcdir/aws-22.0.0/templates_parser"

    PRJ_BUILD=Release make DEBUG=false prefix=/usr setup 
    PRJ_BUILD=Release make DEBUG=false build

    cd docs
    mkdir -p build
    make -j1 html latexpdf


    cd $srcdir/aws-22.0.0

    PRJ_BUILD=Release DEBUG=false make -j1 prefix=/usr SOCKET=openssl setup
    PRJ_BUILD=Release DEBUG=false make -j1 build

    cd $srcdir/aws-22.0.0/docs
    make -j1 html latexpdf
}


package() 
{
    cd $srcdir/aws-22.0.0/templates_parser
    make -j1 DEBUG=false DESTDIR="$pkgdir" install

    cd $srcdir/aws-22.0.0
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