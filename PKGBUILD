pkgname='co2mon-git'
pkgdesc='CLI for MasterKit CO2 Monitor'
pkgver=2.0.1.r9.gdf58994
pkgrel=2
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
         'e96495d7ed56756af234aa2c4959177b'
         'bef542a1a14f1b5def074c8181ebac0e'
         'ad1ef6873b453a9f09447c70d74921ff')

pkgver() {
    cd "$srcdir/co2mon"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -pv "$srcdir/co2mon/build"
    cd "$srcdir/co2mon/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
        -DCMAKE_INSTALL_LIBDIR:PATH=lib \
        ..
    make
}

package() {
    cd "$srcdir/co2mon/build" || exit 1
    make install

    install -Dvm644 -t "$pkgdir/usr/lib/udev/rules.d" "$srcdir/99-co2mon.rules"
    install -Dvm644 -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/co2mon.service"
    install -Dvm644 "$srcdir/co2mon-git.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/co2mon-git.conf"

    install -Dvm755 -t "$pkgdir/usr/lib/munin/plugins" "$srcdir/co2mon/graph/munin/"*
}
