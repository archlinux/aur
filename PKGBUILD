# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
pkgver=2018
pkgrel=2
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gnatcoll-iconv>=2018"
         "quex-for_libadalang" "python2-funcy" "python2-mako" "python-yaml" "python-sphinx"
         "python-coverage" "python2-enum34" "python-psutil" "python2-docutils" "autopep8" "yapf")

makedepends=("gprbuild>=2018")

conflicts=('libadalang-git')

source=('http://mirrors.cdn.adacore.com/art/5b0cf9adc7a4475263382c18'
        'http://mirrors.cdn.adacore.com/art/5b0cfbefc7a4475263382c2a')
sha1sums=('7e9f90eb9bcdd2877b7da1aca1c2f88ff90c3dcc'
          '0f6ea268a81371a880122cbdd3b2493ae91d0811')

build() 
{
  cd $srcdir/libadalang-gpl-2018-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  export PYTHONPATH=$srcdir/langkit-gpl-2018-src:$PYTHONPATH

  # Clang has trouble compiling the Quex-generated lexer, so make sure
  # GPRbuild chooses GCC.
  gprconfig -o config.cgpr --batch --config=c,,,,GCC --config=ada,,,,

  python2 ada/manage.py generate
  python2 ada/manage.py build --gargs="-R --config=$PWD/config.cgpr"
}


package()
{
  cd $srcdir/libadalang-gpl-2018-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  python2 ada/manage.py install $pkgdir/usr

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages

  mv $pkgdir/usr/python/libadalang.py \
     $pkgdir/usr/lib/python2.7/site-packages

  rmdir $pkgdir/usr/python
}
