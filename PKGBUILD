# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgbase=libayatana-indicator
pkgname=("${pkgbase}-gtk"{2,3})
pkgver=0.6.2
pkgrel=2
pkgdesc='Ayatana Indicators Shared Library'
url='https://github.com/AyatanaIndicators/libayatana-indicator'
arch=('x86_64')
license=('LGPL2.1' 'LGPL3')
depends=('glib2' 'ayatana-ido')
makedepends=('gtk2' 'gtk3' 'mate-common' 'gtk-doc' 'pkg-config')
options=('!emptydirs')
source=("https://github.com/AyatanaIndicators/$pkgbase/archive/$pkgver.tar.gz")
sha512sums=('47a89a4f59d547e4aeeeba245ec7df360e18dc9f8a8c256cbeaf2a95e335f2734873457b2b0fdef8c2fdeaf780dda38cfe020c335a3447a2175914d580aeb8de')

prepare() {
  cp -ra ${pkgbase}-${pkgver}{,-gtk2}
}

build() {
  msg2 "Building gtk3…"
  (cd ${pkgbase}-${pkgver}
  ./autogen.sh --prefix=/usr --with-gtk=3 --disable-tests
  make
  )

  msg2 "Building gtk2…"
  (cd ${pkgbase}-${pkgver}-gtk2
  ./autogen.sh --prefix=/usr --with-gtk=2 --disable-tests
  make
  )
}

package_libayatana-indicator-gtk2() {
  pkgdesc+=' (GTK+ 2 library)'
  depends=('gtk2')
  provides=("${pkgbase}")
  conflicts=("${pkgbase}")

  cd ${pkgbase}-${pkgver}-gtk2
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/usr/share/libayatana-indicator/80indicator-debugging
  rm -f "${pkgdir}"/usr/lib/systemd/user/ayatana-indicators-pre.target
}

package_libayatana-indicator-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=('gtk3')
  provides=("${pkgbase}3")
  conflicts=("${pkgbase}3")

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
