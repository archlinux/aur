# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=deluge-git
pkgver=2.0.0b2.dev360.gbe74d96c6
pkgrel=1
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar'
         'python-twisted' 'python-pyasn1' 'python-rencode' 'python-pyopenssl'
         'python-xdg' 'python-pillow' 'python-mako' 'python-chardet' 'python-six'
         'python-setproctitle' 'python-zope-interface' 'python-service-identity'
         'python-setuptools' 'xdg-utils')
optdepends=('librsvg: for GTK user interface'
            'gtk3: for GTK user interface'
            'pygtk: for GTK user interface'
            'python-cairo: for GTK user interface'
            'python-gobject: for GTK user interface and desktop popup notifications plugin'
            'libnotify: for dektop popup notifications plugin'
            'python-pygame: for sound notifications plugin'
            'python-dbus: for showing item location in filemanager'
            'geoip: for displaying peer locations'
            'python-distro: for OS platform information')
makedepends=('git' 'intltool' 'librsvg' 'pygtk' 'slimit-git')
checkdepends=('python-pytest-twisted' 'python-pytest-cov' 'python-hypothesis'
              'python-mock' 'python-gobject' 'python-cairo' 'xorg-server-xvfb'
              'gtk3')
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
