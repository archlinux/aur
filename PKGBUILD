# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgbase=libayatana-appindicator
pkgname=("${pkgbase}-gtk"{2,3} "${pkgbase}-sharp" "python2-${pkgbase}")
pkgver=0.5.3
pkgrel=3
pkgdesc='Ayatana Application Indicators Shared Library'
url='https://ayatana-indicators.org'
arch=('x86_64')
license=('LGPL2.1' 'LGPL3')
makedepends=('mate-common' 'gtk-doc' 'dbus-glib' 'gobject-introspection' 'gtk-sharp-2'
             'libayatana-indicator-gtk'{2,3} 'libdbusmenu-gtk'{2,3} 'mono' 'pygtk' 'vala' 'python2')
options=('!emptydirs')
source=(http://releases.ayatana-indicators.org/source/${pkgbase}/${pkgbase}-${pkgver}.tar.gz)
sha512sums=('2061582cf16954de1ad4df888acc3972126e642357adcf017d71b742ad600b970089cca91e5fe2c0dac3c35660efb22bb07cd1b3a7559a8d6adc15eba062eec7')

prepare() {
  cp -ra ${pkgbase}-${pkgver}{,-py2}
  cp -ra ${pkgbase}-${pkgver}{,-gtk2}
}

build() {
  export CFLAGS="${CFLAGS} -Wno-deprecated-declarations"
  export CSC='/usr/bin/mcs'

  msg2 'Building gtk3…'
  (cd ${pkgbase}-${pkgver}
    ./autogen.sh --prefix=/usr \
      --enable-introspection \
      --enable-gtk-doc=no \
      --disable-{scrollkeeper,tests,mono-test} \
      --with-gtk=3
    make
  )

  msg2 'Building gtk2…'
  (cd ${pkgbase}-${pkgver}-gtk2
    ./autogen.sh --prefix=/usr \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-{scrollkeeper,tests,mono-test} \
      --with-gtk=2
    make
  )

  msg2 'Building python2…'
  (cd ${pkgbase}-${pkgver}-py2
    ./autogen.sh --prefix=/usr \
      --enable-introspection \
      --enable-gtk-doc \
      --disable-{scrollkeeper,tests,mono-test} \
      --with-gtk=2
    make
  )
}

package_libayatana-appindicator-gtk2() {
  pkgdesc+=' (GTK+ 2 library)'
  depends=('libdbusmenu-gtk2' 'libayatana-indicator-gtk2')
  provides=("${pkgbase}")
  conflicts=("${pkgbase}")

  cd ${pkgbase}-${pkgver}-gtk2
  make DESTDIR="${pkgdir}" install
  make -C bindings/mono DESTDIR="${pkgdir}" uninstall
  make -C bindings/python DESTDIR="${pkgdir}" uninstall
}

package_libayatana-appindicator-gtk3() {
  pkgdesc+=' (GTK+ 3 library)'
  depends=('libdbusmenu-gtk3' 'libayatana-indicator-gtk3')
  provides=("${pkgbase}3")
  conflicts=("${pkgbase}3")

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  make -C bindings/mono DESTDIR="${pkgdir}" uninstall
  make -C bindings/python DESTDIR="${pkgdir}" uninstall
}

package_libayatana-appindicator-sharp() {
  depends=("${pkgbase}-gtk2" 'gtk-sharp-2')

  cd ${pkgbase}-${pkgver}-gtk2
  make -C bindings/mono DESTDIR="${pkgdir}" install
}

package_python2-libayatana-appindicator() {
  depends=("${pkgbase}-gtk2" 'python2')

  cd ${pkgbase}-${pkgver}-py2
  make -C bindings/python DESTDIR="${pkgdir}" install
}

