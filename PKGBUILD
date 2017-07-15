# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on extra\deluge's PKGBUILD, adapted for -git version by Berseker

pkgname=deluge-git
pkgver=2.0b2.dev15.ge3f537770
pkgrel=1
epoch=1
pkgdesc="A BitTorrent client with multiple user interfaces in a client/server model (git version, 'develop' branch)"
arch=('any')
url='http://deluge-torrent.org/'
license=('GPL3')
depends=(
        'desktop-file-utils' 'hicolor-icon-theme' 'libtorrent-rasterbar'
        'python2-service-identity' 'python2-chardet' 'python2-pyopenssl'
        'python2-xdg' 'python2-twisted' 'xdg-utils'
)
makedepends=(
    # binary repositories:
        'git' 'intltool' 'librsvg' 'pygtk' 'python2-mako' 'python2-setuptools'
    # AUR:
        'python2-jsmin' 'slimit2'
)
optdepends=('python2-pillow'
            'librsvg: needed for gtk ui'
            'pygtk: needed for gtk ui'
            'python2-mako: needed for web ui'
            'python2-notify: libnotify notifications'
            'geoip: display peer locations')
provides=('deluge')
conflicts=('deluge' 'deluge-stable-git')
install='deluge.install'
source=("$pkgname"::'git://deluge-torrent.org/deluge.git#branch=develop'               # official repository
        #"$pkgname"::'git+https://github.com/deluge-torrent/deluge.git#branch=develop' # mirror
        'deluged.service'
        'deluge-web.service')
sha256sums=('SKIP'
            '58a451bb6cf4fe6ff78a4fb71d51c5910340a2de032ff435c3c7365015ab538f'
            '26e4d01003804afb197c570175d44ed4dddd443cc1b88ab2d0230ceacfac90c5')

pkgver() {
    cd "$pkgname"
    local _internalver="$(python2 version.py)"
    local _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.g%s' "$_internalver" "$_shorthash"
}

build() {
    cd "$pkgname"
    python2 setup.py build
}

package() {
    cd "$pkgname"
    python2 setup.py install --prefix='/usr' --root="$pkgdir" --optimize='1'
    
    install -D -m644 "${srcdir}/deluged.service"    "${pkgdir}/usr/lib/systemd/system/deluged.service"
    install -D -m644 "${srcdir}/deluge-web.service" "${pkgdir}/usr/lib/systemd/system/deluge-web.service"
    
    install -d                   "${pkgdir}/srv"
    install -d -m775 -o125 -g125 "${pkgdir}/srv/deluge"
}
