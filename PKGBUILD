# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=deluge-git
pkgver=2.1.1.dev61.g800111062
pkgrel=1
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=('python-twisted' 'python-pyopenssl' 'python-rencode' 'python-pyxdg'
         'python-six' 'python-zope-interface' 'python-chardet'
         'python-setproctitle' 'python-pillow' 'python-pyasn1' 'python-mako'
         'python-service-identity' 'python-setuptools' 'xdg-utils'
         'libtorrent-rasterbar' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('python-geoip: for displaying peer locations'
            'gtk3: for GTK user interface'
            'python-gobject: for GTK user interface and desktop popup notifications plugin'
            'python-cairo: for GTK user interface'
            'librsvg: for GTK user interface'
            'libappindicator-gtk3: for appindicator notifications'
            'python-dbus: for showing item location in filemanager'
            'python-pygame: for sound notifications plugin'
            'python-distro: for OS platform information'
            'libnotify: for dektop popup notifications plugin')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'intltool' 'python-rjsmin' 'gtk3' 'python-gobject' 'python-cairo' 'librsvg'
             'xdg-utils' 'libappindicator-gtk3' 'python-pygame' 'libnotify')
provides=('deluge' 'deluge-gtk')
conflicts=('deluge' 'deluge-gtk')
source=('git://deluge-torrent.org/deluge.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
    cd deluge
    printf '%s.g%s' "$(python version.py)" "$(git rev-parse --short HEAD)"
}

build() {
    cd deluge
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" deluge/dist/*.whl
    install -D -m644 deluge/packaging/systemd/*.service -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 deluge/packaging/systemd/user/*.service -t "${pkgdir}/usr/lib/systemd/user"
    install -D -m644 deluge/packaging/systemd/user.conf -t "${pkgdir}/usr/lib/systemd/system/deluged.service.d"
    install -D -m644 deluge/packaging/systemd/user.conf -t "${pkgdir}/usr/lib/systemd/system/deluge-web.service.d"
    ln -s deluge.png "${pkgdir}/usr/share/pixmaps/deluge-panel.png"
    printf '%s\n' 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/deluge.conf"
    printf '%s\n' 'd /srv/deluge 0770 deluge deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/deluge.conf"
}
