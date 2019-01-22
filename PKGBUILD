# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on extra\deluge's PKGBUILD, adapted for -git version by Berseker

pkgname=deluge-git
_srcname=deluge
pkgver=2.0.0b2.dev313.gb2e19561e
pkgrel=2
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar'
        'python2-twisted' 'python2-pyasn1' 'python2-pyopenssl' 'python2-xdg'
        'python2-chardet' 'python2-six' 'python2-setproctitle'
        'python2-zope-interface' 'python2-service-identity'
        'python2-rencode' 'python2-setuptools' 'xdg-utils')
makedepends=(
    # binary repositories:
        'git' 'intltool' 'librsvg' 'pygtk' 'python2-mako'
    # AUR:
        'slimit2'
)
optdepends=('librsvg: gtk ui'
            'pygtk: gtk ui'
            'python2-gobject: gtk ui'
            'python2-mako: web ui'
            'python2-notify: libnotify notifications'
            'python2-pygame: audible notifications'
            'python2-pillow: .ico support'
            'python2-rencode: encoding library'
            'python2-dbus: show item location in filemanager'
            'geoip: display peer locations')
provides=('deluge')
conflicts=('deluge')
source=('git://deluge-torrent.org/deluge.git#branch=develop'               # official repository
        #'git+https://github.com/deluge-torrent/deluge.git#branch=develop' # mirror
        'deluged.service'
        'deluge-web.service')
sha256sums=('SKIP'
            '58a451bb6cf4fe6ff78a4fb71d51c5910340a2de032ff435c3c7365015ab538f'
            '26e4d01003804afb197c570175d44ed4dddd443cc1b88ab2d0230ceacfac90c5')

pkgver() {
    cd "$_srcname"
    
    local _internalver
    local _shorthash
    
    _internalver="$(python2 version.py)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.g%s' "$_internalver" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    python2 setup.py build
}

package() {
    cd "$_srcname"
    
    python2 setup.py install --prefix='/usr' --root="$pkgdir" --skip-build --optimize='1'
    
    install -D -m644 "${srcdir}/deluged.service"    "${pkgdir}/usr/lib/systemd/system/deluged.service"
    install -D -m644 "${srcdir}/deluge-web.service" "${pkgdir}/usr/lib/systemd/system/deluge-web.service"
    
    ln -s deluge.png "${pkgdir}/usr/share/pixmaps/deluge-panel.png"
    
    printf '%s\n' 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/deluge.conf"
    
    printf '%s\n' 'd /srv/deluge 0775 deluge deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/deluge.conf"
}
