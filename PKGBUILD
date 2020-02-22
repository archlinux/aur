# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
pkgver=2019
pkgrel=2
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gnatcoll-iconv" "gnatcoll-gmp"
         "quex-for_libadalang" "python2-mako" "python-yaml" "python-sphinx"
         "python-coverage" "python2-enum34" "python-psutil" "python2-docutils" "python2-funcy"
         "autopep8" "yapf")

makedepends=("gprbuild")

conflicts=('libadalang-git')

source=('https://community.download.adacore.com/v1/d9ecaed902d34eb3162f3c255da2d5763b495170?filename=libadalang-2019-20190510-19916-src.tar.gz'
        'https://community.download.adacore.com/v1/30c1718fc91e7da1c8a359e5862a44c814daf592?filename=langkit-2019-20190510-19B8C-src.tar.gz')
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
  cd build/python
  python2 setup.py install --root="$pkgdir"

  rm -fr $pkgdir/usr/python
}
