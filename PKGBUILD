# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=('rom-properties' 'rom-properties-gtk' 'rom-properties-kde')
pkgbase=rom-properties
pkgdesc="Shell extension for displaying ROM and disc image metadata in file managers"
pkgver=2.4.1
pkgrel=2
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL-2.0-or-later')
makedepends=(
    'cairo'
    'cmake'
    'extra-cmake-modules'
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
    'python'
    'qt6-base'
    'qt6-tools'
    'tinyxml2'
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/GerbilSoft/rom-properties/archive/v$pkgver.tar.gz")
sha256sums=('a8db64378484560ebc935608d6ef0db78a0c81586a6967c1433d2043f2f24e34')
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
    -Wno-dev

    make
}


package_rom-properties() {
    depends=(
        'curl'
        'gcc-libs'
        'glibc'
        'libjpeg-turbo'
        'libpng'
        'libseccomp'
        'lz4'
        'lzo'
        'nettle'
        'tinyxml2'
        'zlib'
    )
    optdepends=(
        'zstd: Zstandard decompression'
        'rom-properties-gtk: for GTK file explores (Caja, Nautilus, Nemo and Thunar)'
        'rom-properties-kde: for Dolphin file explorer'
    )

    cd "$pkgbase-$pkgver/build"

    DESTDIR="$pkgdir" make install

    rm $pkgdir/usr/bin/rp-thumbnailer-dbus
    rm -rf $pkgdir/usr/lib/caja
    rm -rf $pkgdir/usr/lib/nautilus
    rm -rf $pkgdir/usr/lib/nemo
    rm -rf $pkgdir/usr/lib/qt6
    rm -rf $pkgdir/usr/lib/thunarx-3
    rm -rf $pkgdir/usr/lib/tracker-miners-3.0
    rm -rf $pkgdir/usr/share/caja
    rm -rf $pkgdir/usr/share/dbus-1
    rm -rf $pkgdir/usr/share/kio
    rm -rf $pkgdir/usr/share/thumbnailers
    rm -rf $pkgdir/usr/share/tracker3-miners
}


package_rom-properties-gtk() {
    pkgdesc="Shell extension for displaying ROM and disc image metadata in file managers (GTK)"
    depends=(
        'cairo'
        'gcc-libs'
        'glib2'
        'glibc'
        'gsound'
        'gtk3'
        'gtk4'
        'pango'
        'rom-properties'
    )

    cd "$pkgbase-$pkgver/build/src/gtk"

    DESTDIR="$pkgdir" make install
}

package_rom-properties-kde() {
    pkgdesc="Shell extension for displaying ROM and disc image metadata in file managers (KDE)"
    depends=(
        'gcc-libs'
        'glibc'
        'kcoreaddons'
        'kfilemetadata'
        'kio'
        'kwidgetsaddons'
        'qt6-base'
        'rom-properties'
    )

    cd "$pkgbase-$pkgver/build/src/kde"

    DESTDIR="$pkgdir" make install
}
