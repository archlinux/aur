# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
pkgver=1
pkgrel=3
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gcc-ada" "gnatcoll"
         "quex-for_libadalang" "python2-funcy" "python2-mako" "python-yaml" "python-sphinx" "python-coverage" "python2-enum34"
         "python-psutil" "python2-docutils" "autopep8" "yapf")

makedepends=("git")


source=(http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deed042
        http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deed044
        use_fpic_for_libadalang.patch)

sha1sums=('08a43b26a2f3469c1255c642db105aba023e9f78'
          '4b36153f8610dd7b62b41938d020eaed39e20842'
          '6d1f238567e1a8ec4aff81a7f62f10ef048a7b28')


build() 
{
  cd $srcdir/libadalang-gps-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  export PYTHONPATH=$srcdir/langkit-gps-src:$PYTHONPATH

  python2 ada/manage.py generate

  # Add -fPIC where needed.
  #
  patch -Np0 -i "$srcdir"/use_fpic_for_libadalang.patch

  python2 ada/manage.py build
}


package()
{
  cd $srcdir/libadalang-gps-src

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  python2 ada/manage.py install $pkgdir/usr

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages

  mv $pkgdir/usr/python/libadalang.py \
     $pkgdir/usr/lib/python2.7/site-packages

  rmdir $pkgdir/usr/python
}
