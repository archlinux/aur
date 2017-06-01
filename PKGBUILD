# Maintainer: André Miranda <andre42m@gmail.com>

pkgname=thunar-gtk3
pkgver=1.6.90
pkgrel=1
pkgdesc='Modern file manager for Xfce - GTK3 Version'
arch=('i686' 'x86_64')
license=('GPL')
url=https://github.com/andreldm/thunar
depends=('desktop-file-utils' 'exo' 'gtk2' 'hicolor-icon-theme' 'libexif' 'libnotify' 'libpng'
        'libxfce4ui' 'libxfce4util')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('gvfs: trash support, mounting with udisks, and remote filesystems'
            'xfce4-panel: trash applet')
provides=(thunar="${pkgver%%.r*}")
conflicts=(thunar{,-extended})
options=(!libtool)
install=$pkgname.install
source=("$pkgname::git://github.com/andreldm/thunar")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    git fetch origin pull/20/head:missingIcons2
    git merge missingIcons2 --no-commit --no-ff
    git stash && git stash pop
    git fetch origin pull/22/head:fix-dbus-name
    git merge fix-dbus-name --no-commit --no-ff
    git stash && git stash pop

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
