# Maintainer: Dominic Meiser <aur@msrd0.de>

pkgname=libtoml-git
pkgver=r90.03e8a3a
pkgrel=2
pkgdesc="Fast C parser using Ragel to generate the state machine."
arch=('x86_64')
url="https://github.com/ajwans/libtoml"
license=('BSD')
depends=('icu')
makedepends=('cmake' 'cunit' 'git' 'pkgconf' 'ragel')
source=('libtoml::git+https://github.com/ajwans/libtoml' 'libtoml-cmake-install.patch')
sha256sums=('SKIP' '29554fb7c3c01cc8a37b3f03225a97aa6d8d15ff0a489bea83bd6530c563c0a5')

pkgver()
{
  cd "$srcdir/libtoml"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "$srcdir/libtoml"
  patch -Np1 -i "$srcdir/libtoml-cmake-install.patch"
  
  mkdir -p "$srcdir/build"
  ln -s "$srcdir/"{libtoml,build}"/toml_parse.rl"
}

build()
{
  cd "$srcdir/build"

  cmake "$srcdir/libtoml" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  
  make
}

package()
{
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/libtoml/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
