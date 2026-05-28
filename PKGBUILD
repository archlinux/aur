# Maintainer: sfs <sfslinux@gmail.com>

pkgname=labhotkey
_pkgname=lxhotkey
pkgver=0.1.2
pkgrel=28
pkgdesc='LabWC Keyboard shortcuts configurator'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://github.com/lxde/lxhotkey'
depends=(
  glib2
  glibc
  gtk3
  libxml2
  libx11
)
makedepends=(
  git
  intltool
)
conflicts=('lxhotkey-gtk3' 'lxhotkey')
source=(
  "git+https://github.com/lxde/lxhotkey.git#tag=$pkgver"
  lxhotkey-notshowin.patch
  lxhotkey-labwc.patch
)
b2sums=(
  aea9a58096f46bd24eeae1e9cf592d37e929d36fac7b61a7aecaf47be3f7934e008d7b9ad467c5dc74c46593f64add84eb84774f8729f3a5e6252e849b1d303e
  9b7781504cea4c7e3af4c52da979a6b206e3678423670c70f2a3a46e74262c9ba0679cbd76534ae9039ed220885b704748665c722ad5c6feae60d30ca3415b28
  a4e1c872ef6e12e8befb3f172423e01e5e870d59f80399ef538b772285e97c6365d870077186f14b61a24d36a7e317187f113452d227fc33e913d0c4cf43507e
)

prepare() {
  cd $_pkgname

  # https://github.com/lxde/lxhotkey/pull/16
  git apply -3 ../lxhotkey-notshowin.patch
  git apply -3 ../lxhotkey-labwc.patch

  autoreconf -fi
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-gtk=3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
