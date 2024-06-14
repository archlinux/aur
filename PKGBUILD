# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=lib32-libxslt
pkgname=(
  lib32-libxslt
)
pkgver=1.1.40
pkgrel=2
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
  0002-tests-Fix-tests-for-libxml2-fix.patch
)
b2sums=('12737793c1b71c2336f4010dcd2b7c340c1b392962bc1cbf0211dd6bd19559d33db0a654177bad96530628fff286bb08c2fbb4ce8056543f008e118419b8b4ab'
        'db7e235868a4e605cd2d73ab7d24bed5d3944e85c04fae6978dd48449f64af5c38e28fe88c843bbfa24a6cbcab54fd79a8ee2cd024717d0f84a0c464b90dc286'
        '900909d96405d41fe424fce5641e9ef0f4d8291ddb4afbebc8fee7a3d40f7f2ca81b99fd46e38b53d2ece26d8f5ecac506683013ecdc357f4efa2142377d252c')

prepare() {
  cd libxslt

  # https://gitlab.archlinux.org/archlinux/packaging/packages/openconnect/-/issues/1
  # https://gitlab.gnome.org/GNOME/libxslt/-/issues/109
  git cherry-pick -n 16f3d7c4954da41788a46e0b14baff2c5785d314

  # Make test failures easier to fix
  git apply -3 ../0001-runtest-Print-output-causing-failure.patch

  # Fix for recent libxml2 change
  # https://gitlab.gnome.org/GNOME/libxml2/-/commit/aa90cb0c578bd189089cd1fe195faf85040ac98b
  git apply -3 ../0002-tests-Fix-tests-for-libxml2-fix.patch

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
