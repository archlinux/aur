# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=tilix
pkgver=1.7.1
pkgrel=2
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64' 'i686')
url="http://github.com/gnunn1/tilix"
license=('MPL')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
optdepends=('python2-nautilus: for "Open Tilix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
			'vte3-tilix: for notifications, triggers and badges support'
			'libsecret: for the password manager')
makedepends=('git' 'ldc' 'po4a')
provides=('terminix' 'tilix')
conflicts=('terminix' 'tilix')
source=('git+https://github.com/gnunn1/tilix')
sha512sums=('SKIP')

prepare() {
  cd ${pkgname}

  # Merge commit that fixes building with GtkD 3.7.1
  git checkout ${pkgver}
  git cherry-pick --no-commit 3a9efb7209a6df73117b1756b1f394f1143949a6

  chmod u+x autogen.sh
  ./autogen.sh
}

build() {
  cd ${pkgname}
  # in many cases po4a-translate is not in the PATH
  ./configure --prefix=/usr PO4A_TRANS=/usr/bin/vendor_perl/po4a-translate
  make DC='ldmd' DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${pkgname}
  make DESTDIR=${pkgdir} install
}

