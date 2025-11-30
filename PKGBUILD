# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxslt
pkgname=(
  lib32-libxslt
)
pkgver=1.1.45
pkgrel=1
pkgdesc="XML stylesheet transformation library (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  lib32-gcc-libs
  lib32-glibc
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
source=(
  "git+https://gitlab.gnome.org/GNOME/libxslt.git#tag=v$pkgver"
  0001-runtest-Print-output-causing-failure.patch
)
b2sums=('5370da9c8febd177b3a19e7b2e443674277b5b8e6c88a7563b789fba1c1dbc1ddcfaab5732d42cd8145a57665ee00968e8a3a7e704b4d2f9dcd6eab0791480b3'
        '23c696c4201d0227c71ec12fc19ed23e5997d235b5d001a52e41a3cc2da0f4ddf62f54652927fde460ccda82eaff23a4f23b2cece491c5b58cfd78ee3d93ce3f')

prepare() {
  cd libxslt

  # Make test failures easier to fix
  git apply -3 ../0001-runtest-Print-output-causing-failure.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --build="$CHOST"
    --host=i686-pc-linux-gnu
    --prefix=/usr
    --libdir=/usr/lib32
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --without-python
  )

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  cd libxslt
  ./configure "${configure_options[@]}"
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
