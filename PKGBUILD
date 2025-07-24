# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
pkgdesc="A high performance semantic engine for the Ada programming language."
pkgver=26.0w
pkgrel=1
epoch=2

url=https://github.com/AdaCore/libadalang
arch=(i686 x86_64)
license=(Apache)

depends=(gnatcoll-gmp langkit)
makedepends=(gprbuild
             gpr
             python-setuptools
             python-mako
             python-funcy
             python-e3-core
             python-docutils
             python-sphinx)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/libadalang-26.0w-20250409-16393-src.tar.gz)
sha256sums=(35582ae22714fdbf0a8228dae2be2ca058568d550fec389a435873ce9ff64416)



build()
{
  cd $srcdir/libadalang-26.0w-20250417-16134-src

  ADA_FLAGS="$CFLAGS"
  ADA_FLAGS="${ADA_FLAGS//-Wformat}"
  ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"


  python -m langkit.scripts.lkm generate 

  python -m langkit.scripts.lkm build \
         --library-types=static,static-pic,relocatable

#  make -C user_manual newhtml
#  make -C dev_manual html
}



package()
{
  cd $srcdir/libadalang-26.0w-20250417-16134-src

  python -m langkit.scripts.lkm install \
            $pkgdir/usr --library-types=static,static-pic,relocatable
  
  
  # Install the developers manual.
  #
#  pushd dev_manual/_build/html

#  for file in $(find . -type f); do
#      install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
#  done

#  popd


  # Install the license.
  #
  install -D -m644  \
     LICENSE.txt    \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt


  # Install the Python binding.
  #
  cd build/python
  python setup.py install --root=$pkgdir --optimize=1 --skip-build

  mv $pkgdir/usr/python/libadalang \
     $pkgdir/usr/lib/python3.13/site-packages

  rm -fr $pkgdir/usr/python
  

  # Fix ocaml bindings location.
  #
  mkdir -p $pkgdir/usr/lib/ocaml
  mv $pkgdir/usr/ocaml $pkgdir/usr/lib/ocaml/libadalang
  
  
  # Rid Java files which are installed by langkit.
  #
  rm -fr  $pkgdir/usr/java
}