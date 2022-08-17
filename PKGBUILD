# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=lib32-libxslt
pkgver=1.1.36
pkgrel=1
pkgdesc="XML stylesheet transformation library (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis"
arch=(x86_64)
license=(custom:MIT)
depends=(
  lib32-libgcrypt
  lib32-libxml2
  lib32-xz
  libxslt
)
makedepends=(
  git
)
checkdepends=(
  docbook-xml
  python
)
optdepends=()
provides=(lib{,e}xslt.so)
options=(debug)
_commit=bcd17763a9f371ec5c9bdce0ffa2f2eb3ef74c43  # tags/v1.1.36^0
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git#commit=$_commit"
        0001-Make-generate-id-deterministic.patch)
sha256sums=('SKIP'
            'e83c20f9a4f0c95716410c127ad10d6cde814c25d183de0d319f5dda529b7a6e')

pkgver() {
  cd libxslt
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libxslt

  # Make xsltproc output reproducible for packages which use it to generate documentation
  git apply -3 ../0001-Make-generate-id-deterministic.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libxslt
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --without-python \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  make check
}

package() {
  cd libxslt
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share,bin}
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 Copyright
}

# vim:set sw=2 sts=-1 et:
