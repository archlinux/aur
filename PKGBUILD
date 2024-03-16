# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=aarnt
_githubrepo=octopi
_gitcommit=69e85dddd2384bdc532f0860e4d550acfac8ea83

pkgname=octopi-dev
pkgver=0.16.0.r6.69e85dd
pkgrel=2
pkgdesc='This is Octopi, a powerful Pacman frontend using Qt libs'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('alpm_octopi_utils' 'qtermwidget' 'qt-sudo')
makedepends=('git' 'qt5-tools')
optdepends=('octopi-notifier-qt5: Notifier for Octopi using Qt5 libs'
            'octopi-notifier-frameworks: Notifier for Octopi with Knotifications support'
            'pacaur: for AUR support'
            'paru: for AUR support'
            'pikaur: for AUR support'
            'trizen: for AUR support'
            'yay: for AUR support'
            'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-repoeditor' 'octopi-cachecleaner')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

_subdirs=(helper repoeditor cachecleaner)

prepare() {
	cd "${_githubrepo}"
	cp resources/images/octopi_green.png resources/images/octopi.png
}

build() {
	cd "${_githubrepo}"
	echo "Starting build..."
	qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi.pro
	make
	for _subdir in ${_subdirs[@]}; do
		pushd $_subdir
		echo "Building octopi-$_subdir..."
		qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" "octopi-$_subdir.pro"
		make
		popd
	done
}

package() {
	cd "${_githubrepo}"
	make INSTALL_ROOT="${pkgdir}" install
	for _subdir in ${_subdirs[@]}; do
		pushd $_subdir
		make INSTALL_ROOT="${pkgdir}" install
		popd
	done
}
