# Contributor: Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on deluge-git in the AUR adapted for python3

pkgname=deluge-python3-git
_srcname=deluge
pkgver=2.0.0b2.dev313.gb2e19561e
pkgrel=1
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar'
        'python-twisted' 'python-pyasn1' 'python-pyopenssl' 'python-xdg'
        'python-chardet' 'python-six' 'python-setproctitle'
        'python-zope-interface' 'python-service-identity'
        'python-rencode' 'python-setuptools' 'xdg-utils' 'python-pillow')
makedepends=(
    # binary repositories:
        'git' 'intltool' 'librsvg' 'pygtk' 'python-mako'
#    # AUR:
#        'slimit2'
)
optdepends=('librsvg: gtk ui'
            'pygtk: gtk ui'
            'python-mako: web ui'
            'python-notify: libnotify notifications'
            'python-pygame: audible notifications'
            'python-pillow: .ico support'
            'python-rencode: encoding library'
            'python-dbus: show item location in filemanager'
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
    
    python setup.py build
}

package() {
    cd "$_srcname"
    
    python setup.py install --prefix='/usr' --root="$pkgdir" --optimize='1'
    
    install -D -m644 "${srcdir}/deluged.service"    "${pkgdir}/usr/lib/systemd/system/deluged.service"
    install -D -m644 "${srcdir}/deluge-web.service" "${pkgdir}/usr/lib/systemd/system/deluge-web.service"
    
    ln -s deluge.png "${pkgdir}/usr/share/pixmaps/deluge-panel.png"
    
    printf '%s\n' 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/deluge.conf"
    
    printf '%s\n' 'd /srv/deluge 0775 deluge deluge' |
        install -D -m644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/deluge.conf"
}
