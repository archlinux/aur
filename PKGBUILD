# Maintainer: SilverBut <SilverBut@users.noreply.github.com>
# Contributor: Martin Weinelt <martin@darmstadt.freifunk.net>

# things can get a little crashy at times, so better have debug symbols handy
# OPTIONS+=(debug !strip)

pkgname=tinc-pre-git
pkgver=1.1pre18.236.gf3d5e225
pkgrel=2
pkgdesc="VPN (Virtual Private Network) daemon (Latest commit on the pre-release branch)"
arch=('any')
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo' 'openssl')
makedepends=('git' 'meson>=0.51')
optdepends=('python2' 'wxpython: gui support' 'miniupnpc')
provides=('tinc-pre')
conflicts=('tinc' 'tinc-pre' 'tinc-pre-systemd')
source=(
    'git+https://github.com/gsliepen/tinc#branch=1.1'
    'tinc-1.1_pre18-fix-upnp.patch'
)
_gitname=tinc

prepare() {
    cd "$_gitname"
    # apply local patch from PKGBUILD's parent directory
    patch -p1 <"${srcdir}/tinc-1.1_pre18-fix-upnp.patch"
}

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/-/./g' | cut -d. -f2-
}

build() {
    cd "$_gitname"
    meson setup build --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
    meson compile -C build
}

package() {
    cd "$_gitname"
    meson install --destdir="$pkgdir" -C build
}

md5sums=(
    'SKIP'
    '4f5b3e74c620efd0f16390ce2e61ec3f'
)