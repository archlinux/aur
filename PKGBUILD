# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=ada-web-server
pkgver=2021
pkgrel=1
pkgdesc="A complete embeddable web application framework for Ada."

arch=(i686 x86_64)
url=http://libre.adacore.com/tools/aws
license=(GPL)
groups=(gcc-ada)

depends=(gcc-ada)
makedepends=(git gprbuild texlive-bin python-sphinx)

provides=(aws)

source=('git+https://github.com/AdaCore/aws#commit=5ddd74408d86363411714957baad72be76012b35'
        'git+https://github.com/AdaCore/templates-parser#commit=2ed90c02deb53d5e453e62a4105354a9497c9ecd')
sha1sums=('SKIP'
          'SKIP')


prepare()
{
    cd $srcdir/aws

    rmdir templates_parser
    ln -s "$srcdir/templates-parser" templates_parser
}


build() 
{
    cd $srcdir/aws/templates_parser

    make DEBUG=false prefix=/usr setup 
    make -j1 DEBUG=false build

    cd docs
    mkdir -p build
    make -j1 html latexpdf


    cd $srcdir/aws

    make prefix=/usr setup
    make -j1 build

    cd $srcdir/aws/docs
    make -j1 html latexpdf
}


package() 
{
    cd $srcdir/aws/templates_parser
    make -j1 DEBUG=false DESTDIR="$pkgdir" install

    cd $srcdir/aws
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