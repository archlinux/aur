# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=libadalang
epoch=1
pkgver=21.0.0
pkgrel=2
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL3' 'custom')

depends=("gnatcoll-iconv" "gnatcoll-gmp")
makedepends=('gprbuild' 'python-setuptools' 'python-mako' 'python-funcy' 'python-e3-core' 'python-docutils')

source=("libadalang-$pkgver.tar.gz::https://github.com/AdaCore/libadalang/archive/v$pkgver.tar.gz"
        "langkit-$pkgver.tar.gz::https://github.com/AdaCore/langkit/archive/v$pkgver.tar.gz")

noextract=()
sha256sums=('afc4b54619d5ee003ba2828969071fa38ced4f68319cc5aeee4736981258b935'
            '534d1e56f03961a6f28d248956b040b31429e602640c07f1b5ff89f76e9fcf5f')

build()
{
  cd "$srcdir/libadalang-$pkgver"

  export PYTHONPATH="$srcdir/langkit-$pkgver:$PYTHONPATH"
  python ada/manage.py generate
  python ada/manage.py build --build-mode=prod --gargs="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"

  make -C dev_manual html
}

package()
{
  cd "$srcdir/libadalang-$pkgver"

  python ada/manage.py install --build-mode=prod "$pkgdir/usr"

  # Install the developers manual
  cd dev_manual/_build/html
    
  for file in $(find . -type f); do
    install -m 644 -D ${file} "$pkgdir/usr/share/doc/$pkgname"/${file#source/}
  done

  cd "$srcdir/libadalang-$pkgver"

  # Install the license.
  install -D -m644     \
     "COPYING3"        \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

  # Install the custom license.
  install -D -m644     \
     "COPYING.RUNTIME" \
     "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"

  # Install the Python binding
  cd build/python
  python setup.py install --root="$pkgdir"

  rm -fr "$pkgdir/usr/python"

  # Fix ocaml bindings location
  mkdir -p "$pkgdir/usr/lib/ocaml/"
  mv "$pkgdir/usr/ocaml" "$pkgdir/usr/lib/ocaml/libadalang"
}
