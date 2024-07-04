# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxslt
pkgname=(
  lib32-libxslt
)
pkgver=1.1.42
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
b2sums=('70549d4ad6784c41bc8f947db0f689399a0c6b4a1d91e1a8e67772f942192a391eebc58b64069500dd76b4c06bc4bd682b66945112298c7bc3f1af90e41ce804'
        'b63a1f2bf704d4561cc30734cee980534fb0586234b7b593d57d9c70fe59abd72610b6d825ab136d4d1dd7540bbfb6b8a6edc95618c15cc79e5a4bbd8f6341ee')

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
