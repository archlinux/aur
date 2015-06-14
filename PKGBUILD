# Maintainer: Jefferson González <jgmdev@gmail.com>

pkgname=php-wxwidgets-git
_gitname=wxphp
pkgver=v3.0.2.0.r5.gb1ea750
_pkgver=3.0.2
pkgrel=1
pkgdesc="PHP bindings to the cross-platform wxWidgets GUI Toolkit library."
arch=('i686' 'x86_64')
url="http://wxphp.org"
install=php-wxwidgets-git.install
license=('PHP')
depends=('gtk3' 'libgl' 'libxxf86vm' 'libsm' 'sdl' 'sdl_sound' 'gstreamer' 'php' 'webkitgtk')
makedepends=('mesa' 'glu' 'libxt' 'gstreamer' 'sdl' 'sdl_sound' 'php' 'webkitgtk')
source=(
	"http://downloads.sourceforge.net/wxwindows/wxWidgets-${_pkgver}.tar.bz2"
	"git://github.com/wxphp/${_gitname}.git"
)
sha1sums=(
	'6461eab4428c0a8b9e41781b8787510484dea800'
	'SKIP'
)

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	phpize
}

build() {
	if [ ! -e "${srcdir}/wxWidgets-${_pkgver}-static" ]; then
		cd "${srcdir}/wxWidgets-${_pkgver}"
		
		CFLAGS="-fPIC -O2 -Wall -W" CXXFLAGS="-fPIC -O2" \
		./configure --prefix="${srcdir}/wxWidgets-${_pkgver}-static" \
			--with-{gtk=3,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,opengl,regex=builtin,sdl} \
			--enable-{graphics_ctx,unicode,monolithic} \
			--disable-shared
			
		make
		make -C locale allmo
		make install
	fi
  
	cd "${srcdir}/${_gitname}"
	
	php tools/reference_generator.php
	
	./configure \
		--with-wxwidgets="${srcdir}/wxWidgets-${_pkgver}-static" \
		--enable-wxwidgets-monolithic \
		--enable-wxwidgets-static
		
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/wxphp"
	mkdir -p "${pkgdir}/usr/share/applications/"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
	
	# Add documentation to package
	cd "${srcdir}/${_gitname}"
	cp -rf doc/* "${pkgdir}/usr/share/doc/${pkgname}/"
	
	# Add wxphp shell script to package
 	echo "#!/bin/sh" > "${pkgdir}/usr/bin/wxphp"
 	echo "exec /usr/bin/php -d extension=wxwidgets.so \"\$@\"" >> "${pkgdir}/usr/bin/wxphp"
 	chmod 0755 "${pkgdir}/usr/bin/wxphp"
 	
 	# Add desktop file
 	echo "[Desktop Entry]" > "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Name=wxPHP Shell" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "GenericName=wxPHP Shell" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Comment=Shell for launching wxphp scripts." >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Exec=/usr/lib/wxphp/launcher.sh" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Icon=wxphp" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Categories=Development;" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Version=1.0" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Type=Application" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	echo "Terminal=false" >> "${pkgdir}/usr/share/applications/wxphp.desktop"
	
	# Copy wxphp shell launcher scripts
 	cp -rf tools/linux_shell/* "${pkgdir}/usr/lib/wxphp/"
 	chmod -R 0755 $pkgdir/usr/lib/wxphp/*
 	chmod 0644 "${pkgdir}/usr/lib/wxphp/README"
 	
 	# Copy icons
 	cp artwork/icon.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/wxphp.png"
 	cp artwork/icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wxphp.svg"
 	
 	# Copy wxwidgets php module
	EXTENSIONS_DIR=`php-config --extension-dir`
	CHROOT_EXTENSION_DIR="${pkgdir}${EXTENSIONS_DIR}"
	
	mkdir -p "${CHROOT_EXTENSION_DIR}"
	strip -s modules/wxwidgets.so
	cp -rf modules/wxwidgets.so "${CHROOT_EXTENSION_DIR}"
}
