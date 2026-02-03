# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='fet-timetabling'
_module='fet'
pkgver=7.7.4
pkgrel=2
pkgdesc="A software for automatically scheduling the timetable of a school, high-school or university."
arch=('x86_64' 'i686')
url="https://lalescu.ro/liviu/fet/"
license=('AGPL3')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('qt6-tools')
source=("https://lalescu.ro/liviu/fet/download/fet-${pkgver}.tar.xz")
sha256sums=('2f5737c6c240afad2ae1134143737c1a4fd7b94e18d786e0a31c47e82041f048')

build() {
	cd "$srcdir/$_module-$pkgver"
	qmake6 fet.pro "DEFINES+=USE_SYSTEM_LOCALE"
	make
}

package() {
	cd "$srcdir/$_module-$pkgver"
	# Process deployment files to avoid conflicts as suggested in AUR comments
	if [ -d build ]; then
		cd build
		# Truncate deployment files to prevent conflicts with system Qt plugins
		find .qt/ -name "deploy_fet_*.cmake" -exec truncate -s 0 {} + 2>/dev/null || true
		cd ..
	fi
	make INSTALL_ROOT="${pkgdir}/" install
}