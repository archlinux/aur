# Maintainer: adrien Prost-Boucle <adrien.prost-boucle.@laposte.net>

pkgname=qoobar-git
pkgver=1.7.0.r205.gf6d53d6
pkgrel=1
pkgdesc="Qoobar - Audio Tagger for Classical Music"

arch=('i686' 'x86_64')
url="http://qoobar.sourceforge.net"
license=('GPL')

depends=('qt6-base' 'qt6-5compat' 'ffmpeg4.4' 'libebur128' 'taglib' 'libdiscid' 'enca' 'shntool')

source=("git+https://github.com/alexnovichkov/qoobar.git")
#source=("git+https://github.com/alexnovichkov/qoobar.git#tag=v1.7.0")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/qoobar"

	# Qoobar version
	local _distver=`sed -nE -e 's/^.*Current version.* ([^ ]*).*$/\1/p' debian1/README`

	# Date of the last git commit
	#local _gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`
	# Revision number
	local _gitrev=`git rev-list --count HEAD`
	# Short hash of latest commit
	local _githash=`git rev-parse --short HEAD`

	#echo $_distver.git$_gitver;
	echo $_distver.r$_gitrev.g$_githash;
}

build() {
	cd "${srcdir}/qoobar"

	qmake6 \
		PREFIX=/usr \
		QMAKE_INCDIR=/usr/include/ffmpeg4.4 \
		QMAKE_LIBDIR=/usr/lib/ffmpeg4.4

	make
}

package() {
	cd "${srcdir}/qoobar"
	make INSTALL_ROOT=${pkgdir}/usr install
	install -Dt "${pkgdir}/usr/share/licenses/qoobar" -m644 "${srcdir}/qoobar/LICENSE"
}
