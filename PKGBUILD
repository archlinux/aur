# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
pkgver=2019
pkgrel=1
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gnatcoll-iconv"
         "quex-for_libadalang" "python2-mako" "python-yaml" "python-sphinx"
         "python-coverage" "python2-enum34" "python-psutil" "python2-docutils" "autopep8" "yapf")

makedepends=("gprbuild")

conflicts=('libadalang-git')

source=('http://mirrors.cdn.adacore.com/art/5cdf8f3331e87a8f1c967d27'
        'http://mirrors.cdn.adacore.com/art/5cdf8f8a31e87a8f1c967d31')
sha1sums=('d9ecaed902d34eb3162f3c255da2d5763b495170'
          '30c1718fc91e7da1c8a359e5862a44c814daf592')


build() 
{
  cd $srcdir/libadalang-2019-20190510-19916-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  export PYTHONPATH=$srcdir/langkit-2019-20190510-19B8C-src:$PYTHONPATH

  # Clang has trouble compiling the Quex-generated lexer, so make sure
  # GPRbuild chooses GCC.
  gprconfig -o config.cgpr --batch --config=c,,,,GCC --config=ada,,,,

  python2 ada/manage.py generate
  python2 ada/manage.py build --gargs="-XBUILD_MODE=prod -R --config=$PWD/config.cgpr"
}


package()
{
  cd $srcdir/libadalang-2019-20190510-19916-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  python2 ada/manage.py install $pkgdir/usr

  # Install the Python binding
  #
#  cd build/python
#  python2 setup.py install --root="$pkgdir"


  rm -fr $pkgdir/usr/python


#  mkdir -p $pkgdir/usr/lib/python2.7/site-packages

#  mv $pkgdir/usr/python/libadalang.py \
#     $pkgdir/usr/lib/python2.7/site-packages

#  rmdir $pkgdir/usr/python
}
