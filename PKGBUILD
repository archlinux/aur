#TODO: should it be named 'co2mond'?
pkgname='co2mon-git'
pkgdesc='CLI for MasterKit CO2 Monitor'
pkgver=2.0.1.r9.gdf58994
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/dmage/co2mon'

conflicts=('co2mon')
depends=('hidapi')
optdepends=('munin-node: for monitoring sensor values via munin')
makedepends=('git' 'cmake')

install=$pkgname.install
source=('git+https://github.com/dmage/co2mon.git'
        '99-co2mon.rules'
        'co2mon.service'
        'co2mon-git.tmpfiles.conf')
md5sums=('SKIP'
         '34aa92981e6a150fc75c43c9427698ee'
         'bef542a1a14f1b5def074c8181ebac0e'
         'f56b35a4420383659798bfa2b31790d5')

pkgver() {
    cd "$srcdir/co2mon"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -pv "$srcdir/co2mon/build"
    cd "$srcdir/co2mon/build"
    cmake ..
    make
}

package() {
    cd "$srcdir/co2mon" || exit 1

    install -Dvm755 -t "$pkgdir/usr/bin/" "$srcdir/co2mon/build/co2mond/co2mond"
    install -Dvm644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/99-co2mon.rules"
    install -Dvm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/co2mon.service"
    install -Dvm644 "$srcdir/co2mon-git.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/co2mon-git.conf"

    install -Dvm755 -t "$pkgdir/usr/lib/munin/plugins" "$srcdir/co2mon/graph/munin/"*

}
