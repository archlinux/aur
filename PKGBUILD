# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
epoch=2
pkgver=23.0.0
pkgrel=1

pkgdesc="A high performance semantic engine for the Ada programming language."
url="https://github.com/AdaCore/libadalang"
arch=('i686' 'x86_64')
license=('Apache')

depends=('gnatcoll-gmp' 'langkit')
makedepends=('gprbuild' 'python-setuptools' 'python-mako' 'python-funcy' 
             'python-e3-core' 'python-docutils' 'python-sphinx')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("0655d2eb755b9789ebf2b1ecfe5189bd64a5a80471d008a2e7ad0e58b9b35350")


build()
{
  cd "$srcdir/$pkgname-$pkgver"

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
  cd "$srcdir/$pkgname-$pkgver"

  python manage.py                                \
    install                                       \
    --library-types=static,static-pic,relocatable \
    --build-mode=prod                             \
    "$pkgdir/usr"

  # Install the developers manual
  pushd dev_manual/_build/html

  for file in $(find . -type f); do
      install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done

  popd

  # Install the license.
  install -D -m644     \
     "LICENSE"        \
     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install the Python binding
  cd build/python
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm -fr "$pkgdir/usr/python"

  # Fix ocaml bindings location
  mkdir -p "$pkgdir/usr/lib/ocaml/"
  mv "$pkgdir/usr/ocaml" "$pkgdir/usr/lib/ocaml/libadalang"
}