# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Florian pritz <bluewind@xinu.at>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Lauri JÃ¤ntti <janttilauri@gmail.com>

pkgname=openbox-git
pkgver=3.6.1
pkgrel=1
pkgdesc='Highly configurable and lightweight X11 window manager'
arch=('x86_64' 'i686')
url='http://openbox.org'
license=('GPL')
provides=(${pkgname%-*}=$pkgver libobrender.so)
conflicts=(${pkgname%-*})
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr'
         'libxcursor' 'pango' 'imlib2' 'librsvg' 'libsm')
optdepends=('plasma-workspace: for the KDE/Openbox xsession'
            'python-pyxdg: for the openbox-xdg-autostart script')
groups=('lxde' 'lxde-gtk3' 'lxqt')
backup=('etc/xdg/openbox/menu.xml' 'etc/xdg/openbox/rc.xml'
        'etc/xdg/openbox/autostart' 'etc/xdg/openbox/environment')
makedepends=(docbook-to-man git)
#source=($pkgname::git://git.openbox.org/dana/${pkgname%-*}.git)
source=($pkgname::git+https://github.com/Mikachu/${pkgname%-*}.git)
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe | sed 's/^release-//;s/-/./g'
}

prepare() {
    cd $pkgname

    autoreconf -fi
}

build() {
    cd $pkgname
    ./configure --prefix=/usr \
        --with-x \
        --enable-startup-notification \
        --sysconfdir=/etc \
    --libexecdir=/usr/lib/openbox
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install

  # GNOME Panel is no longer available in the official repositories
  rm -r "$pkgdir"/usr/bin/{gdm-control,gnome-panel-control,openbox-gnome-session} \
    "$pkgdir"/usr/share/gnome{,-session} \
    "$pkgdir"/usr/share/man/man1/openbox-gnome-session.1 \
    "$pkgdir"/usr/share/xsessions/openbox-gnome.desktop

  sed -i 's:startkde:/usr/bin/\0:' \
    "$pkgdir"/usr/share/xsessions/openbox-kde.desktop
}
