# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=cinnamon-settings-daemon-git
pkgver=4.0.3.r0.gd3ead09
pkgrel=1
pkgdesc="The Cinnamon Settings daemon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('cinnamon-desktop' 'colord' 'dbus-glib' 'libcanberra-pulse' 'libcups'
         'libgnomekbd' 'libgudev' 'libnotify' 'librsvg' 'libwacom' 'nss' 'polkit'
         'pulseaudio-alsa' 'upower')
optdepends=('cinnamon-translations: i18n')
makedepends=('git' 'autoconf-archive' 'intltool' 'python' 'xf86-input-wacom')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"/${pkgname%-git}

    autoreconf -fi
}

build() {
    cd "${srcdir}"/${pkgname%-git}

    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --libexecdir="/usr/lib/${pkgname%-git}" \
                --enable-systemd \
                --enable-polkit

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}"/${pkgname%-git}

    make DESTDIR="${pkgdir}" install
}
