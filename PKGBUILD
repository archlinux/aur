# Maintainer: Evgeny Shvits <tony.darko@gmail.com>

pkgname=xpiks-git
pkgver=r3949.1f581c6f
_gitname=xpiks
pkgrel=1
pkgdesc='Cross-Platform Image Keywording Software'
arch=('x86_64')
url='https://xpiksapp.com/'
license=('MPL')
depends=('curl' 'zlib' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-svg' 'qt5-graphicaleffects' 'quazip' 'perl-image-exiftool')
optdepends=()
makedepends=('git')
conflicts=('xpiks')

source=(
	"${_gitname}::git+https://github.com/ribtoks/xpiks.git"
	"xpiks-build_with_system_libquazip5.patch"
	"xpiks-libxpks_stub.patch"
	"xpiks.desktop"
	)
md5sums=('SKIP'
         'c7b93172c88154f6d3834b7dccabd3e5'
         'c3b93f3c3410f76fc50b94a55b551e6b'
         '4112f7181afe7e45eb878b8eccc91eaf')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"
	
	git apply ../xpiks-build_with_system_libquazip5.patch
	git apply ../xpiks-libxpks_stub.patch
	
	git submodule update --init --recursive
}

build() {
	cd "${srcdir}/${_gitname}"
	
	# delete build dir if exists
	#[ -d "build" ] && rm -r build
	
	./scripts/build/build_vendors_linux.sh release
	
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
	
	install -Dm755 Xpiks "${pkgdir}/opt/Xpiks/Xpiks"
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
		
	# install icon
	install -Dm644 src/xpiks-qt/debian/xpiks.png "${pkgdir}/usr/share/pixmaps/Xpiks.png"
	
	# install .desktop file
	cd "${srcdir}"
	install -Dm644 xpiks.desktop "${pkgdir}/usr/share/applications/xpiks.desktop"
}

