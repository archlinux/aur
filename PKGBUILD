# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
pkgname=(pasystray-git pasystray-gtk2-git)
_pkgname=pasystray
pkgver=0.6.0.r3.gf621be9
pkgrel=2
pkgdesc="PulseAudio system tray (a replacement for padevchooser)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
depends=('libpulse' 'libnotify' 'avahi' 'libx11' 'gnome-icon-theme'
    'gtk-update-icon-cache')
makedepends=('git' 'pkg-config' 'gtk2' 'gtk3')
optdepends=(
    'pulseaudio: To control a local pulseaudio instance'
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)
provides=('pasystray')
conflicts=('pasystray')
source=(git+https://github.com/christophgysin/pasystray.git)
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed -r "s/^${_pkgname%-git}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
    cp -r $srcdir/$_pkgname{,-gtk2}

    for gtk in "" 2; do
        cd $srcdir/$_pkgname${gtk:+-gtk$gtk}

        autoreconf -is
        ./configure \
            --prefix=/usr \
            --sysconfdir=/etc \
            ${gtk:+--with-gtk=$gtk}
        make
    done
}

package_pasystray-gtk2-git() {
    depends+=(gtk2)
    cd $srcdir/$_pkgname-gtk2
    make DESTDIR="$pkgdir/" install
}

package_pasystray-git() {
    depends+=(gtk3)
    cd $srcdir/$_pkgname
    make DESTDIR="$pkgdir/" install
}
