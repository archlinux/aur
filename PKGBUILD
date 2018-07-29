# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgbase=libayatana-indicator
pkgname=("${pkgbase}-gtk"{2,3})
pkgver=0.6.2
pkgrel=1
pkgdesc='Ayatana Indicators Shared Library'
url='https://ayatana-indicators.org'
arch=('x86_64')
license=('LGPL2.1' 'LGPL3')
depends=('glib2' 'ayatana-ido')
makedepends=('gtk2' 'gtk3' 'mate-common' 'gtk-doc' 'pkg-config')
options=('!emptydirs')
source=("http://releases.ayatana-indicators.org/source/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha512sums=('fa7ecef06da459a1b6f4ce53832f2af9c53db6603d844f7fde61650752a5a58105714a0fd6183a95ba7d0caaeab16216712f9cdfe314631fbe565dc0332fe832')

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
