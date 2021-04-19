# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=cecdaemon-git
pkgver=1.0.0.r7.ge87b85f
pkgrel=2
pkgdesc="CEC Daemon for linux media centers"
arch=('any')
url="https://github.com/simons-public/cecdaemon"
license=('BSD')
depends=('python' 'libcec' 'python-cec-git' 'python-uinput')
provides=('cecdaemon')
conflicts=('cecdaemon')
makedepends=('git' 'python-setuptools')
source=("cecdaemon-git::git+https://github.com/Janhouse/cecdaemon.git")
md5sums=('SKIP')
backup=(etc/{cecdaemon.conf,systemd/system/multi-user.target.wants/cecdaemon.service})

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    python setup.py build
}

package() {
    cd $srcdir/$pkgname
    python setup.py install --root="$pkgdir"

    mkdir -p "$pkgdir/etc/modules-load.d"
    echo "uinput" > "$pkgdir/etc/modules-load.d/uinput.conf"

    cp "examples/cecdaemon.conf-example" "$pkgdir/etc/cecdaemon.conf"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp "examples/cecdaemon.service-example" "$pkgdir/usr/lib/systemd/system/cecdaemon.service"
    sed -i 's/cec.conf/cecdaemon.conf/' "$pkgdir/usr/lib/systemd/system/cecdaemon.service"
}
