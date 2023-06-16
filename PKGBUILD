# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
pkgdesc="A high performance semantic engine for the Ada programming language."
pkgver=24.0w
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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-164A3-src.tar.gz)
sha256sums=(87c64c60ee147a9ac27f997dcf071a7c143e85382202a18e5d8a0943fb87cc16)


build()
{
  cd $srcdir/$pkgname-$pkgver-20230428-16114-src

  ADA_FLAGS="$CFLAGS"
  ADA_FLAGS="${ADA_FLAGS//-Wformat}"
  ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

  python manage.py generate
  python manage.py build                          \
    --library-types=static,static-pic,relocatable \
    --build-mode=prod                             \
    --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

  make -C dev_manual html

  cd build/python
  python setup.py build
}


package()
{
  cd $srcdir/$pkgname-$pkgver-20230428-16114-src

  python manage.py                                \
    install                                       \
    --library-types=static,static-pic,relocatable \
    --build-mode=prod                             \
    $pkgdir/usr

  # Install the developers manual.
  #
  pushd dev_manual/_build/html

  for file in $(find . -type f); do
      install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done

  popd

  # Install the license.
  #
  install -D -m644  \
     LICENSE.txt    \
     $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

  # Install the Python binding
  #
  cd build/python
  python setup.py install --root=$pkgdir --optimize=1 --skip-build

  rm -fr $pkgdir/usr/python

  # Fix ocaml bindings location
  #
  mkdir -p $pkgdir/usr/lib/ocaml
  mv $pkgdir/usr/ocaml $pkgdir/usr/lib/ocaml/libadalang
}