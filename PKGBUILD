# Maintainer: Marcin Bujar <marcin.bujar at gmail dot com>

pkgname=thunar-split
pkgver=1.6.10
pkgrel=1
pkgdesc="Modern file manager for Xfce - patched to include split pane and upstream bug fixes"
arch=(i686 x86_64)
url="http://thunar.xfce.org"
license=('GPL2' 'LGPL2.1')
groups=('xfce4')
conflicts=('thunar')
replaces=('thunar')
provides=('thunar=1.6.10')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify'
         'libgudev' 'gtk2' 'exo' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('intltool' 'xfce4-panel')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
            'xfce4-panel: for trash applet'
            'tumbler: for thumbnail previews'
            'thunar-volman: manages removable devices'
            'thunar-archive-plugin: create and deflate archives'
            'thunar-media-tags-plugin: view/edit id3/ogg tags')
options=('!libtool')
install=thunar.install
source=(http://archive.xfce.org/src/xfce/thunar/1.6/Thunar-${pkgver}.tar.bz2
        split_pane.patch
        20150702-Fix-crashes-when-reloading.patch
        20151113-Deactivate-SEND_MOVED-code-paths.patch
        20151130-Fix-missing-return.patch
)
sha256sums=('7e9d24067268900e5e44d3325e60a1a2b2f8f556ec238ec12574fbea15fdee8a'
            '535797e0c6e54cdf7b44c676e64e52185306497570ae00c62c8a9fef28b79181'
            '292e593492678b7e476d5da992bc9c008169b7e0f00048aee100195701842892'
            '2461773024336a94fd70d7f2276aec0f9fc819cb8af96c8689e42c429014ea7d'
            '3f4d8dfba3003f14d29d7b5f8e38debecb2aa3a7244949a564bd183e8ae3d2fe'
)

prepare() {
    cd "$srcdir/Thunar-$pkgver"
}

build() {
    cd "${srcdir}"/Thunar-${pkgver}

    patch -Np1 -i ../split_pane.patch
    patch -Np1 -i ../20150702-Fix-crashes-when-reloading.patch
    patch -Np1 -i ../20151113-Deactivate-SEND_MOVED-code-paths.patch
    patch -Np1 -i ../20151130-Fix-missing-return.patch

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-gio-unix \
        --enable-dbus \
        --enable-gudev \
        --enable-notifications \
        --enable-exif \
        --enable-pcre \
        --disable-debug
    make
}

package() {
    cd "${srcdir}"/Thunar-${pkgver}
    make DESTDIR="${pkgdir}" install
}

