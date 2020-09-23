#
# specfile for the obs build of notekit
#
# Copyright (c) 2020 github.com/blackhole89 (Developer) & github.com/sp1ritCS (OBS Package Maintainer)
# Based on the work of AUR user atemu (notekit-git, https://aur.archlinux.org/packages/notekit-git/)
#

pkgname=notekit-clatexmath-git
basename=${pkgname%-clatexmath-git}
pkgver=r116.4f5374a
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=('x86_64')
url="https://github.com/blackhole89/notekit"
license=('GPL3')
depends=('gtkmm3>=3.2' 'gtksourceviewmm>=3.18' 'jsoncpp' 'zlib')
makedepends=('gcc' 'make' 'cmake')
provides=("${basename}")
conflicts=("${basename}" "${basename}-git")
source=('git+https://github.com/blackhole89/notekit.git'
	'git+https://github.com/NanoMichael/cLaTeXMath.git')
sha256sums=('SKIP'
	    'SKIP')

pkgver() {
	cd "$srcdir/$basename"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	#workaround for "sub-command STRIP requires two arguments" error
	sed -i 's/${CL_TMP_VAR}/"${CL_TMP_VAR}"/g' "$srcdir"/notekit/CMakeLists.txt
	
	ln -sf $srcdir/cLaTeXMath $srcdir/$basename
	echo 'add_library(clatexmath STATIC ${SRC})' >> $srcdir/$basename/cLaTeXMath/CMakeLists.txt
}

build() {
	cd "$srcdir/$basename"

	cd cLaTeXMath
	cmake -DCMAKE_BUILD_TYPE=Release -DHAVE_LOG=OFF -DGRAPHICS_DEBUG=OFF .
	make
	cp -r res $srcdir/$basename/data/latex
	cd ..
		
	cmake -DHAVE_CLATEXMATH=ON -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	#install binary
	install -Dm755 "$srcdir"/notekit/cmake-build-Release/output/notekit -t "$pkgdir"/usr/bin/
	
	#install doc
	install -Dm644 "$srcdir"/notekit/README.md -t "$pkgdir"/usr/share/doc/notekit/

	#install license
	install -Dm644 "$srcdir"/notekit/LICENSE -t "$pkgdir"/usr/share/licenses/notekit/

	#install "data" and "sourceview"
	mkdir -p "$pkgdir"/usr/share/notekit/
	cp -r "$srcdir"/notekit/data "$srcdir"/notekit/sourceview "$pkgdir"/usr/share/notekit/

	#install application icons
	install -Dm644 "$srcdir/notekit/freedesktop/notekit.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
	install -Dm644 "$srcdir/notekit/freedesktop/notekit.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	#install desktop shortcut
	install -Dm644 "$srcdir/notekit/freedesktop/notekit.desktop" -t "$pkgdir/usr/share/applications/"
}
