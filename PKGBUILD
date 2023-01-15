# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxslt
pkgname=(lib32-libxslt)
pkgver=1.1.37
pkgrel=2
pkgdesc="XML stylesheet transformation library (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
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
_commit=5eca7fb65b7337409a02f9f94fde608edf7d1b0a  # tags/v1.1.37^0
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git#commit=$_commit"
        0001-Make-generate-id-deterministic.patch)
sha256sums=('SKIP'
            '605e0a0b2ca385a90226bc5b141d3f6bfeade13e43ab39f8dea863505d7cbf18')

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

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --without-python \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  make check
}

package_lib32-libxslt() {
  provides=(lib{,e}xslt.so)

  cd libxslt

  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/{include,share,bin}

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
