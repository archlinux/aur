# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
epoch=1
pkgver=25.2.0
pkgrel=1
pkgdesc='A complete embeddable web application framework for Ada.'

arch=(x86_64 aarch64)
url='https://github.com/AdaCore/aws'
license=(GPL-3.0 custom)

depends=(gnatcoll-core
         openssl
         python)

makedepends=(gprbuild
             texlive-meta
             python-sphinx)

provides=(aws)


_templates_parser_ver=25.0.0

source=(aws.tar.gz::https://github.com/AdaCore/aws/archive/refs/tags/v$pkgver.tar.gz
        templates-parser.tar.gz::https://github.com/AdaCore/templates-parser/archive/refs/tags/v$_templates_parser_ver.tar.gz
        set_debug_to_false_in_makefile_conf.patch)

sha256sums=(0d78b31f396952ee134babb83c4be6ae0b1ae795c430f0655bd0cda466cfd7f3
            03cd620c658aee3c2d69be0a8369e45666dc51d25d3cb580b77c4ad471446041
            1dbf3251e9c3e40c9e958bf44669fb46248e5f18fe774eda1beec243fe01e17d)


prepare()
{
   cd $srcdir/aws-$pkgver

   rmdir templates_parser
   ln -s $srcdir/templates-parser-$_templates_parser_ver templates_parser

   patch -Np0 -i $srcdir/set_debug_to_false_in_makefile_conf.patch
}


build()
{
   cd $srcdir/aws-$pkgver/templates_parser

   PRJ_BUILD=Release DEBUG=false make prefix=/usr setup
   PRJ_BUILD=Release DEBUG=false make build


   cd $srcdir/aws-$pkgver

   PRJ_BUILD=Release DEBUG=false make -j1 prefix=/usr SOCKET=openssl setup
   PRJ_BUILD=Release DEBUG=false make -j1 build

   cd $srcdir/aws-$pkgver/docs

   make -j1 html latexpdf          \
        1> build_docs-warnings.log \
        2> build_docs-errors.log
}


package()
{
   cd $srcdir/aws-$pkgver

   make -j1 DESTDIR=$pkgdir install

   rm $pkgdir/usr/bin/{templates2ada,templatespp}

   # Install the license.
   #
   install -D -m644 \
      COPYING3      \
      $pkgdir/usr/share/licenses/$pkgname/COPYING3

   # Install the custom license.
   #
   install -D -m644   \
      COPYING.RUNTIME \
      $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}
