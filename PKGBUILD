# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=deluge-git
pkgver=2.0.4.dev23.g2f1c008a2
pkgrel=1
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=('python-twisted' 'python-pyopenssl' 'python-rencode' 'python-xdg'
         'python-six' 'python-zope-interface' 'python-chardet'
         'python-setproctitle' 'python-pillow' 'python-pyasn1' 'python-mako'
         'python-service-identity' 'python-setuptools' 'xdg-utils'
         'libtorrent-rasterbar' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('geoip: for displaying peer locations'
            'gtk3: for GTK user interface'
            'python-gobject: for GTK user interface and desktop popup notifications plugin'
            'python-cairo: for GTK user interface'
            'librsvg: for GTK user interface'
            'python-dbus: for showing item location in filemanager'
            'python-pygame: for sound notifications plugin'
            'python-distro: for OS platform information'
            'libnotify: for dektop popup notifications plugin')
makedepends=('git' 'intltool' 'librsvg' 'python-gobject' 'slimit')
checkdepends=('python-pytest-twisted' 'python-pytest-cov' 'python-hypothesis'
              'python-mock' 'python-cairo' 'xorg-server-xvfb' 'gtk3')
provides=('deluge')
conflicts=('deluge')
BUILDENV=('!check')
source=('git://deluge-torrent.org/deluge.git#branch=develop'               # official repository
        #'git+https://github.com/deluge-torrent/deluge.git#branch=develop' # mirror
        'deluged.service'
        'deluge-web.service')
sha256sums=('SKIP'
            '58a451bb6cf4fe6ff78a4fb71d51c5910340a2de032ff435c3c7365015ab538f'
            '26e4d01003804afb197c570175d44ed4dddd443cc1b88ab2d0230ceacfac90c5')

pkgver() {
    cd deluge
    local _internalver
    local _shorthash
    _internalver="$(python version.py)"
    _shorthash="$(git rev-parse --short HEAD)"
    printf '%s.g%s' "$_internalver" "$_shorthash"
}

build() {
    cd deluge
    python setup.py build
}

check() {
    cd deluge
    xvfb-run python setup.py test
}

package() {
    cd deluge
    python setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 "${srcdir}/deluged.service"    "${pkgdir}/usr/lib/systemd/system/deluged.service"
    install -D -m644 "${srcdir}/deluge-web.service" "${pkgdir}/usr/lib/systemd/system/deluge-web.service"
    ln -s deluge.png "${pkgdir}/usr/share/pixmaps/deluge-panel.png"
    printf '%s\n' 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/deluge.conf"
    printf '%s\n' 'd /srv/deluge 0775 deluge deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/deluge.conf"
}
