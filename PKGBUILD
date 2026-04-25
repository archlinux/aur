# Maintainer: Amenatsu <rainsummertse@outlook.com>
pkgname=kmymoney-git-l10n-zh_cn
pkgver=5.1.95.r572.gcc9596c
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken,machine-translated for zh_cn"
arch=('x86_64')
url="https://kmymoney.org/"
license=('GPL-2.0-or-later')
depends=(
	'glibc' 'gcc-libs' 'gmp' 'libalkimia' 'sqlcipher' 'qt6-base' 'gpgmepp'
	'karchive' 'kcoreaddons' 'kconfig' 'kwidgetsaddons' 'ki18n'
	'kcompletion' 'kcmutils' 'kitemmodels' 'kitemviews' 'kxmlgui'
	'ktextwidgets' 'kio' 'kholidays' 'kjobwidgets' 'sonnet' 'kcolorscheme'
	'kconfigwidgets' 'kdiagram' 'libical' 'libofx' 'qtkeychain-qt6'
	'kidentitymanagement' 'libakonadi' 'kcontacts' 'aqbanking' 'gwenhywfar'
	'qt6-declarative' 'hicolor-icon-theme' 'kcrash'
)
makedepends=('cmake' 'extra-cmake-modules' 'kdoctools' 'doxygen' 'qgpgme' 'git')
optdepends=(
	'perl: for financequote.pl'
	'python: for the woob plugin'
)
provides=('kmymoney')
conflicts=('kmymoney')
source=('git+https://invent.kde.org/office/kmymoney.git')
sha256sums=('SKIP')

pkgver() {
	cd kmymoney
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd kmymoney
	git apply ../l10n-zh_cn.patch
}

build() {
	local cmake_options=(
		-B build
		-S kmymoney
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D BUILD_WITH_QT6=ON
		-D CMAKE_SKIP_RPATH=YES
		-D BUILD_TESTING=OFF
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
