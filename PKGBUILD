# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=('rom-properties' 'rom-properties-gtk' 'rom-properties-kde')
pkgbase=rom-properties
pkgdesc="Shell extension for displaying ROM and disc image metadata in file managers"
pkgver=2.8
pkgrel=1
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL-2.0-or-later')
makedepends=(
    'cairo'
    'cmake'
    'extra-cmake-modules'
    'fmt'
    'gdk-pixbuf2'
    'gettext'
    'glib2-devel'
    'gsound'
    'gtk3'
    'gtk4'
    'kcrash'
    'kio'
    'kfilemetadata'
    'kwidgetsaddons'
    'libnautilus-extension'
    'pkgconf'
    'pugixml'
    'python'
    'qt5-base'
    'qt6-base'
    'qt6-tools'
)
source=(
    "$pkgbase-$pkgver.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v$pkgver.tar.gz"
)
sha256sums=(
    'c9eccc8d57751878c115073cd3b61ae6b7a0380bf5a07e229bc4d8683675aa71'
)
options=(!debug)


build() {
    cd "$pkgbase-$pkgver"

    mkdir -p build && cd build

    cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DSPLIT_DEBUG=OFF \
    -DBUILD_KDE4=OFF \
    -DBUILD_KF5=OFF \
    -DBUILD_KF6=ON \
    -DBUILD_GTK3=ON \
    -DBUILD_GTK4=ON \
    -DENABLE_ZSTD=ON \
    -DENABLE_LZ4=ON \
    -DENABLE_LZO=ON \
    -DENABLE_XML=ON \
    -DUSE_INTERNAL_ZSTD=OFF \
    -DUSE_INTERNAL_LZ4=OFF \
    -DUSE_INTERNAL_LZO=OFF \
    -DUSE_INTERNAL_XML=OFF \
    -DUSE_INTERNAL_FMT=OFF \
    -Wno-dev

    make
}


package_rom-properties() {
    depends=(
        'curl'
        'fmt'
        'glibc'
        'libgcc'
        'libgomp'
        'libjpeg-turbo'
        'libpng'
        'libseccomp'
        'libstdc++'
        'nettle'
        'pugixml'
        'zlib'
        'zstd'
    )
    optdepends=(
        'libwebp: WebP image decoding support (for Android APK packages)'
        'lz4: For PSP CISOv2 and ZISO compressed disc decompression'
        'lzo: For PSP JISO compressed disc decompression'
        'rom-properties-gtk: GTK extensions for file managers (Nautilus, Desktop Search, Caja, Nemo, Thunar)'
        'rom-properties-kde: Qt6/KF6 plugins for Dolphin and KFileMetaData'
    )

    cd "$pkgbase-$pkgver/build"

    DESTDIR="$pkgdir" make install

    rm $pkgdir/usr/bin/rp-thumbnailer-dbus
    rm -rf $pkgdir/usr/lib/caja
    rm -rf $pkgdir/usr/lib/nautilus
    rm -rf $pkgdir/usr/lib/nemo
    rm -rf $pkgdir/usr/lib/qt6
    rm -rf $pkgdir/usr/lib/thunarx-3
    rm -rf $pkgdir/usr/lib/localsearch-3.0
    rm -rf $pkgdir/usr/share/caja
    rm -rf $pkgdir/usr/share/dbus-1
    rm -rf $pkgdir/usr/share/kio
    rm -rf $pkgdir/usr/share/thumbnailers
    rm -rf $pkgdir/usr/share/localsearch3
}


package_rom-properties-gtk() {
    pkgdesc="Nautilus and other GTK-based file manager extensions for rom-properties"
    depends=(
        'cairo'
        'fmt'
        'glib2'
        'glibc'
        'gsound'
        'gtk3'
        'gtk4'
        'libgcc'
        'libstdc++'
        'pango'
        'rom-properties'
    )

    cd "$pkgbase-$pkgver/build/src/gtk"

    DESTDIR="$pkgdir" make install
}

package_rom-properties-kde() {
    pkgdesc="Dolphin, KFileMetaData, and KF6 plugins for rom-properties"
    depends=(
        'fmt'
        'glibc'
        'kcoreaddons'
        'kfilemetadata'
        'kio'
        'kwidgetsaddons'
        'libgcc'
        'libstdc++'
        'qt6-base'
        'rom-properties'
    )

    cd "$pkgbase-$pkgver/build/src/kde"

    DESTDIR="$pkgdir" make install
}
