# Mantainer: Sergio Tridente <tioduke (at) gmail (dot) com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=kftpgrabber
pkgname=kftpgrabber-svn
pkgver=r1445187    
pkgrel=1
pkgdesc="A graphical FTP client for KDE"
url="http://kftp.org"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('kftpgrabber')
provides=('kftpgrabber')
depends=('kdelibs' 'libssh2')
makedepends=('subversion' 'cmake' 'automoc4')
source=('svn://anonsvn.kde.org/home/kde/trunk/extragear/network/kftpgrabber'
        'FindLibSSH2.patch')
sha256sums=('SKIP'
            '0cca5a3fd92633210fa4ae297be437db7a6ebd6e58b9f01af553a761fa49cace')


pkgver() {
	cd "${_pkgname}"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "${srcdir}/${_pkgname}"

	patch -Np1 -i ${srcdir}/FindLibSSH2.patch
	cmake . \
		-DQT_QMAKE_EXECUTABLE=qmake-qt4 \
		-DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR=$pkgdir install
}
