# Contributor: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
pkgver=1
pkgrel=1
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gcc-ada" "gnatcoll"
         "quex-for_libadalang" "python2-mako" "python-yaml" "python-sphinx" "python-coverage" "python2-enum34"
         "python-psutil" "python2-funcy" "python2-docutils" "autopep8" "yapf")

makedepends=("git")


source=(git+https://github.com/AdaCore/libadalang.git#branch=stable-gps
        git+https://github.com/AdaCore/langkit.git#branch=stable-gps
        use_fpic_for_libadalang.patch)

md5sums=('SKIP'
         'SKIP'
         'SKIP')


prepare()
{
  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  cd $srcdir/$pkgname

  # Install langkit
  #
  rm -fr langkit
  mv ../langkit .
  
  ## Force use of pyhon2
  #
  rm -fr temp_bin
  mkdir  temp_bin
  ln -s /usr/bin/python2        temp_bin/python
  ln -s /usr/bin/python2-config temp_bin/python-config
}


build() 
{
  cd $srcdir/$pkgname

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  export PATH=$srcdir/$pkgname/temp_bin:$PATH
  python ada/manage.py generate

  # Add -fPIC where needed.
  #
  patch -Np0 -i "$srcdir"/use_fpic_for_libadalang.patch

  python ada/manage.py build
}


package()
{
  cd $srcdir/$pkgname

  # Ensure that QUEX_PATH is set.
  #
  source /etc/profile.d/quex.sh

  python ada/manage.py install $pkgdir/usr

  mkdir -p $pkgdir/usr/lib/python2.7/site-packages

  mv $pkgdir/usr/python/libadalang.py \
     $pkgdir/usr/lib/python2.7/site-packages

  rmdir $pkgdir/usr/python
}
