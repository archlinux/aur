# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=xpiks
_gitname=xpiks
pkgver=1.5.2
pkgrel=1
pkgdesc='Cross-Platform Image Keywording Software'
arch=('x86_64')
url='https://xpiksapp.com/'
license=('MPL')
depends=('curl' 'zlib' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-svg' 'qt5-graphicaleffects' 'quazip' 'perl-image-exiftool')
optdepends=()
makedepends=('git')

source=(
	"${_gitname}::git+https://github.com/ribtoks/xpiks.git#tag=v1.5.2"
	"xpiks-build_with_system_libquazip5.diff"
	)
md5sums=('SKIP'
         '8d082ec0a08051aec943aa3c35486592')

prepare() {
	cd "${srcdir}/${_gitname}"
	
	git apply ../../xpiks-build_with_system_libquazip5.diff
	
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_gitname}"
	
	./scripts/build/build_vendors_linux.sh release
	
	# delete build dir if exists
	#[ -d "build" ] && rm -r build
	
	[ ! -d "build" ] && mkdir build
	cd build
	
	qmake ../src/xpiks-qt/xpiks-qt.pro "CONFIG+=release" \
		QMAKE_CFLAGS="${CFLAGS}" \
		QMAKE_CXXFLAGS="${CXXFLAGS}" \
		QMAKE_LFLAGS='${LDFLAGS}' \
		'QMAKE_RPATHDIR+=$ORIGIN'
	
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	
	install -Dm755 Xpiks "${pkgdir}/opt/Xpiks/xpiks-qt"
	install -d "${pkgdir}/opt/Xpiks/translations/"
	install -m644 translations/*.qm "${pkgdir}/opt/Xpiks/translations/"
	install -m644 whatsnew.txt "${pkgdir}/opt/Xpiks/"
	install -d "${pkgdir}/opt/Xpiks/dict/"
	install -m644 dict/* "${pkgdir}/opt/Xpiks/dict/"
	install -d "${pkgdir}/opt/Xpiks/ac_sources/"
	install -m644 ac_sources/* "${pkgdir}/opt/Xpiks/ac_sources/"
	
	# install vendor libs
	cd "${srcdir}/${_gitname}"
	install -Dm644 libs/release/libface.so.1 "${pkgdir}/opt/Xpiks/libface.so.1"
	install -Dm644 libs/release/libssdll.so.1 "${pkgdir}/opt/Xpiks/libssdll.so.1"
	
	# install .desktop file
	install -Dm644 src/xpiks-qt/debian/xpiks.desktop "${pkgdir}/usr/share/applications/xpiks.desktop"
	sed -i 's#xpiks-qt#/opt/Xpiks/xpiks-qt#g' "${pkgdir}/usr/share/applications/xpiks.desktop"
	
	# install icon
	install -Dm644 src/xpiks-qt/debian/xpiks.png "${pkgdir}/usr/share/icons/xpiks.png"
}

