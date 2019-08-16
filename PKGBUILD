# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=indicator-sensors-git
pkgver=0.9.r13.gab4487f
pkgrel=1
pkgdesc="Small application to provide hardware sensor readings using the AppIndicator framework (git version)"
arch=('i686' 'x86_64')
url="https://github.com/alexmurray/indicator-sensors"
license=('GPL3')
provides=('indicator-sensors')
conflicts=('indicator-sensors')
depends=('libappindicator-gtk3' 'libnotify' 'libpeas' 'udisks2')
optdepends=('libxnvctrl: NVIDIA GPU support'
            'libatasmart: ATA SMART support'
            'lm_sensors: Various sensor support')
makedepends=('git' 'gnome-common' 'gobject-introspection' 'intltool')
install=indicator-sensors.install
source=("git+https://github.com/alexmurray/indicator-sensors"
        'menu-cleanup.patch'
        'is-udisks2.rules')
md5sums=('SKIP'
         '7f41886142704131faba29ce87ae07ed'
         '73468b5a1034ed57cb94c48ba26d2300')

pkgver() {
  cd "indicator-sensors"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "indicator-sensors"

  #Cleanup indicator menu (remove "about" and "quit")
  patch -Np2 < ../menu-cleanup.patch

  ./autogen.sh
}

build() {
  cd "indicator-sensors"
  ./configure --disable-schemas-compile --prefix=/usr
  make
}

package() {
  cd "indicator-sensors"
  make DESTDIR="$pkgdir" install
  mkdir -p -m 750 "$pkgdir"/etc/polkit-1/rules.d/
  install -m 644 ../is-udisks2.rules "$pkgdir"/etc/polkit-1/rules.d/
}

