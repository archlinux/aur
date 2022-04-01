# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: jordz <jordz@archlinux.us>

pkgname=nemiver
pkgver=0.9.6
pkgrel=9
pkgdesc='C/C++ debugger for GNOME'
arch=(x86_64)
license=(GPL)
url='https://projects.gnome.org/nemiver'
depends=(gdb gdlmm ghex gsettings-desktop-schemas gtksourceviewmm libgtop vte3)
makedepends=(boost gnome-common intltool yelp-tools)
source=("https://download.gnome.org/sources/nemiver/${pkgver%.*}/nemiver-$pkgver.tar.xz"
         0001-Fix-compiliation-warnings-errors.patch
         0001-Use-RefPtr-bool-operator-in-the-conditions.patch)
options=(!emptydirs)
b2sums=('c7b9aeb7914498af540f664f435cb2e9c07f8b2845f8bc6f5bdc3ee2b2173346d964d44ce4a588665180670cca61581397f33bfc5ac8dd2b3501e8d951d8dec5'
        '72db3dc25466434359ecf90d4917d783affda7daba145ea29f2116599b0519bd6450092a88998c48dfe41df732cdd981641c89b9886a946c121b64f9dfd39961'
        '41dbf5fdac1c109d11544de13754e63ac17c733220572864943a592ae747d5d1d192d511619540da20d279e924278fd9e1d0b98cd8440bd1829bfe112c6449ec')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../0001-Fix-compiliation-warnings-errors.patch
  patch -p1 -i ../0001-Use-RefPtr-bool-operator-in-the-conditions.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --disable-schemas-compile \
    --disable-static \
    --enable-gsettings=yes \
    --enable-memoryview=yes \
    --enable-symsvis=yes \
    --localstatedir=/var \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-boost
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
