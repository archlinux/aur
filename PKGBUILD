# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=direwolf-git
_pkgname=direwolf
pkgver=1.5.beta4.r105.gf08ed51
pkgrel=1
pkgdesc="Software modem/TNC and APRS encoder/decoder"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wb2osz/direwolf"
license=('GPL')
depends=('alsa-lib' 'gpsd' 'hamlib')
makedepends=('git' 'cmake')
provides=('direwolf')
conflicts=('direwolf')
source=('git+https://github.com/wb2osz/direwolf.git#branch=dev'
        '0001-Add-build-option-for-udev-path.patch'
        'direwolf.service'
        'direwolf-kiss.service')
sha1sums=('SKIP'
          'c768819622aa10092a1dc3481e4f2340b9674593'
          '66366c7a4e8d3768013f9036f2681a86d4b8ad88'
          'eea3a3fb334645cd8a1e2604dc6c6b024148722a')
sha256sums=('SKIP'
            '3c80f0350df3959a759906722837514aedb0488e008a6ba5081cd727fce7e2ad'
            'a1efe2bb96470bc52faa747708b195a685dc454f3d9c91f6bf4d39ab94d3608a'
            '2a2e4acc769a20afebdfdcd21640fd17b0c4217ceb7ecb3378f9ee5c45fadc68')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git apply ../0001-Add-build-option-for-udev-path.patch
}

build() {
    cd "$_pkgname"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
          -DCMAKE_BUILD_TYPE=Release \
          -DUDEV_RULES_DIR="$pkgdir/etc/udev/rules.d" \
          ..
    make
}

package() {
    cd "$_pkgname/build"
    make install
    #mkdir -p "$pkgdir/usr/bin"
    #mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
    #mkdir -p "$pkgdir/var/log/direwolf"


    mkdir -p "$pkgdir/etc/direwolf"
    install -D -m 644 direwolf.conf "$pkgdir/etc/direwolf/direwolf.conf"

    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf.service "$pkgdir/usr/lib/systemd/system"
    install -D -m 644 ../direwolf-kiss.service "$pkgdir/usr/lib/systemd/system"
}
