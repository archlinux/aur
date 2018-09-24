# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Michael Healy <horsemanoffaith@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

pkgname=gnome-settings-daemon-elementary
pkgver=3.28.1+0ubuntu1+r3.6975d1c25
pkgrel=1
pkgdesc="GNOME Settings Daemon (with elementary OS patches)"
url="https://gitlab.gnome.org/GNOME/gnome-settings-daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=(dconf geoclue2 geocode-glib gnome-desktop 'gsettings-desktop-schemas-ubuntu>=3.24.0'
	gtk3-print-backends libcanberra-pulse libgudev libgweather libnotify librsvg 
	libsystemd libwacom nss pulseaudio pulseaudio-alsa upower)
makedepends=(docbook-xsl git gnome-common intltool libxslt libnm python xf86-input-wacom meson)
groups=(gnome unity pantheon-qq)
provides=(gnome-settings-daemon{,-ubuntu}="${pkgver}")
conflicts=(gnome-settings-daemon{,-ubuntu})
source=("git+https://github.com/elementary/os-patches.git#branch=gnome-settings-daemon-bionic-patched"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git/")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
    cd "os-patches"
    printf "3.28.1+0ubuntu1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "os-patches"

    git submodule init
    git config --local submodule."subprojects/gvc".url "${srcdir}/libgnome-volume-control"
    git submodule update
}

build() {
    cd "os-patches"

    meson \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/gnome-settings-daemon \
        -Dstatic-false=true \
        builddir

    ninja -C builddir
}

package() {
    cd "os-patches"

    DESTDIR="${pkgdir}" ninja -C builddir install
}
