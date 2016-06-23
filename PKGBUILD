# Maintainer: Alad Wenter <nynq@nepuyvahk.vasb> (rot13)
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar-git
pkgver=1.6.10.r140.g6b51ff3
pkgrel=1
pkgdesc='file manager for xfce'
arch=('i686' 'x86_64')
license=('GPL')
url=http://thunar.xfce.org
groups=('xfce4-git')
depends=('desktop-file-utils' 'exo' 'gtk2' 'hicolor-icon-theme' 'libexif' 'libnotify' 'libpng'
        'libxfce4ui' 'libxfce4util')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
            'xfce4-panel: trash applet')
provides=(thunar="${pkgver%%.r*}")
conflicts=(thunar{,-extended})
options=(!libtool)
install=$pkgname.install
source=("$pkgname::git://git.xfce.org/xfce/thunar"
        '0001-Deactivate-SEND_MOVED-code-paths.patch::http://bug-attachment.xfce.org/attachment.cgi?id=6530')
sha256sums=('SKIP'
            '2461773024336a94fd70d7f2276aec0f9fc819cb8af96c8689e42c429014ea7d')

prepare() {
    cd "$pkgname"
    # https://bugzilla.xfce.org/show_bug.cgi?id=12264
    patch -p1 < "$srcdir"/0001-Deactivate-SEND_MOVED-code-paths.patch
}

pkgver() {
    cd "$pkgname"
    git describe --long | sed -e 's/^thunar.//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}

build() {
    cd "$pkgname"
    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-dbus \
        --enable-startup-notification \
        --enable-gudev \
        --enable-exif \
        --enable-pcre \
        --enable-gtk-doc \
        --disable-debug
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    sed -i ':x-directory/gnome-default-handler;:d' "$pkgdir"/usr/share/applications/Thunar-folder-handler.desktop
}
