# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-settings-daemon
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=1
pkgdesc="The MATE Settings daemon (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dbus-glib' 'libcanberra' 'libmatekbd-gtk2' 'libmatemixer' 'libnotify'
         'mate-desktop-gtk2' 'nss' 'polkit')
makedepends=('intltool')
optdepends=('libcanberra-pulse: PulseAudio support'
            'pulseaudio-alsa: PulseAudio support')
groups=('mate-gtk2')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
options=('!emptydirs')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('8fcb4ae0571e9bd507b47a67e0e4245e6558693e')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-gtk=2.0 \
        --enable-polkit \
        --enable-pulse

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
