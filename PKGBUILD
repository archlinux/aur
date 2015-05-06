# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_pkgname=pasystray
pkgname=${_pkgname}-git
pkgver=0.5.2.r0.g6709fc1
pkgrel=1
pkgdesc="PulseAudio system tray (a replacement for padevchooser)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/pasystray"
license=('LGPL')
groups=('multimedia')
depends=('libpulse' 'gtk3' 'libnotify' 'avahi' 'libx11' 'gnome-icon-theme'
    'gtk-update-icon-cache')
makedepends=('git' 'pkg-config' )
optdepends=(
    'paman: Launch PulseAudio manager from tray icon'
    'pavucontrol: Launch PulseAudio mixer from tray icon'
    'pavumeter: Launch PulseAudio volume meter from tray icon'
    'paprefs: Launch PulseAudio preferences from tray icon'
)
provides=('pasystray')
conflicts=('pasystray')
backup=()
options=()
install='pasystray.install'
source=(git+https://github.com/christophgysin/pasystray.git)
noextract=()
md5sums=('SKIP')

_gitroot=git://github.com/christophgysin/${pkgname%-git}.git
_gitname=${pkgname%-git}

pkgver() {
    cd $_pkgname
    git describe --long | sed -r "s/^${pkgname%-git}-//;s/([^-]*-g)/r\\1/;s/-/./g"
}

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."
    if [[ -d $_gitname ]]; then
        cd $_gitname
        git fetch
        git reset --hard origin/master
        msg "The local files are updated."
    else
        git clone --depth=1 $_gitroot $_gitname
    fi
    msg "GIT checkout done or server timeout"
    cd "$srcdir/$_gitname"

    aclocal
    autoconf
    autoheader
    automake --add-missing
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc
}

package() {
    cd "$srcdir/$_gitname"
    make DESTDIR="$pkgdir/" install
}
