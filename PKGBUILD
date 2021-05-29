# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
epoch=1
pkgver=21.0.0
pkgrel=2
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gnatcoll-core" "gnatcoll-iconv" "gnatcoll-gmp")
makedepends=('gprbuild' 'python-setuptools' 'python-mako' 'python-funcy' 'python-e3-core' 'python-docutils')

source=(
	"libadalang-$pkgver.tar.gz::https://github.com/AdaCore/libadalang/archive/v$pkgver.tar.gz"
	"langkit-$pkgver.tar.gz::https://github.com/AdaCore/langkit/archive/v$pkgver.tar.gz"
)
noextract=()
sha256sums=('afc4b54619d5ee003ba2828969071fa38ced4f68319cc5aeee4736981258b935'
            '534d1e56f03961a6f28d248956b040b31429e602640c07f1b5ff89f76e9fcf5f')

prepare()
{
  cd "$srcdir/libadalang-$pkgver"
}

build()
{
  cd "$srcdir/libadalang-$pkgver"

  export PYTHONPATH="$srcdir/langkit-$pkgver:$PYTHONPATH"
  python ada/manage.py generate
  python ada/manage.py build --build-mode=prod --gargs="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
}


package()
{
  cd "$srcdir/libadalang-$pkgver"

  python ada/manage.py install --build-mode=prod "$pkgdir/usr"

  # Install the Python binding
  cd build/python
  python setup.py install --root="$pkgdir"

  rm -fr "$pkgdir/usr/python"

  # Fix ocaml bindings location
  mkdir -p "$pkgdir/usr/lib/ocaml/"
  mv "$pkgdir/usr/ocaml" "$pkgdir/usr/lib/ocaml/libadalang"
}
