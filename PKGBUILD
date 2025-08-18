# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: envolution
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>
# Contributor: l-koehler <lorenz.koehler@posteo.de>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Gaetan Bisson <bisson@archlinux.org
# Contributor: codyps <archlinux@codyps.com>

pkgname=aircrack-ng-git
_name=${pkgname%-git}
pkgver=1.7.r4705.g3e1b99a0
pkgrel=1
pkgdesc='Key cracker for the 802.11 WEP and WPA-PSK protocols'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'pentium4')
url='https://www.aircrack-ng.org'
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'openssl' 'sqlite' 'iw' 'net-tools' 'wireless_tools' 'ethtool'
         'pcre' 'libpcap' libpcap.so 'python' 'zlib' 'libnl' 'hwloc' 'usbutils')
optdepends=('pciutils: required for devices with populated PCI(e) bus'
            'gpsd: allows airodump-ng to log coordinates'
            'pcre2: SSID filtering with regular expressions in airodump-ng')
makedepends=('git' 'python-setuptools')
checkdepends=('cmocka')
provides=('aircrack-ng-scripts')
conflicts=('aircrack-ng-scripts')
replaces=('aircrack-ng-scripts')
source=("git+https://github.com/$_name/$_name.git")
sha256sums=('SKIP')

pkgver() {
    cd $_name

    _release=$(git tag --sort=-v:refname --list | grep '^[0-9.]*$' | head -n1)
    _revision=$(git rev-list --count HEAD)
    _commit=$(git rev-parse --short=8 HEAD)
    echo "$_release.r$_revision.g$_commit"
}

prepare() {
    cd $_name
    autoreconf -fiv
}

build() {
    cd $_name

    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --sbindir=/usr/bin \
        --with-ext-scripts \
        --with-experimental
    make
}

check() {
    cd $_name
    make check
}

package() {
    cd $_name
    make DESTDIR="$pkgdir" install
}
