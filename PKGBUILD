# Maintainer: Jefferson González <jgmdev@gmail.com>

pkgname=php-wxwidgets-git
_gitname=wxphp
pkgver=v3.0.2.0.r208.g0560d4f
_pkgver=3.0.2
pkgrel=2
pkgdesc="PHP bindings to the cross-platform wxWidgets GUI Toolkit library."
arch=('i686' 'x86_64')
url="http://wxphp.org"
install=php-wxwidgets-git.install
license=('PHP')
depends=('gtk2' 'libgl' 'libxxf86vm' 'libsm' 'sdl' 'sdl_sound' 'gstreamer' 'php56' 'webkitgtk2')
makedepends=('mesa' 'glu' 'libxt' 'gstreamer' 'sdl' 'sdl_sound' 'php56' 'webkitgtk2' 'gstreamer0.10-base-plugins')
source=(
    "http://downloads.sourceforge.net/wxwindows/wxWidgets-${_pkgver}.tar.bz2"
    "git://github.com/wxphp/${_gitname}.git"
    "make-abicheck-non-fatal.patch"
    "wxgtk-gcc6.patch"
)
sha1sums=(
    '6461eab4428c0a8b9e41781b8787510484dea800'
    'SKIP'
    'dfe38650c655395b90bf082b5734c4093508bfa3'
    '498202334c69d49c1ebbc9d36ad382cfa237f3f8'
)

pkgver() {
  cd "${_gitname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_gitname}"
    phpize56
}

build() {
    if [ ! -e "${srcdir}/wxWidgets-${_pkgver}-static" ]; then
        cd "${srcdir}/wxWidgets-${_pkgver}"

        # C++ ABI check is too strict and breaks with GCC 5.1
        # https://bugzilla.redhat.com/show_bug.cgi?id=1200611
        patch -Np1 -i "${srcdir}/../make-abicheck-non-fatal.patch"

        # Fix build with GCC 6
        patch -p1 -i "${srcdir}/../wxgtk-gcc6.patch"

        CFLAGS="-fPIC -O2 -Wall -W" CXXFLAGS="-fPIC -O2" \
        ./configure --prefix="${srcdir}/wxWidgets-${_pkgver}-static" \
            --with-{gtk=2,libjpeg=sys,libpng=sys,libtiff=sys,libxpm=sys,opengl,regex=builtin,sdl} \
            --enable-{graphics_ctx,unicode,monolithic} \
            --disable-shared

        make
        make -C locale allmo
        make install
    fi

    cd "${srcdir}/${_gitname}"

    php56 tools/reference_generator.php

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
    echo "exec /usr/bin/php56 -d extension=wxwidgets.so \"\$@\"" >> "${pkgdir}/usr/bin/wxphp"
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
    EXTENSIONS_DIR=`php-config56 --extension-dir`
    CHROOT_EXTENSION_DIR="${pkgdir}${EXTENSIONS_DIR}"

    mkdir -p "${CHROOT_EXTENSION_DIR}"
    strip -s modules/wxwidgets.so
    cp -rf modules/wxwidgets.so "${CHROOT_EXTENSION_DIR}"
}
