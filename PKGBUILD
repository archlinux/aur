# Maintainer: Janis Jansons <aur@janhouse.lv>
pkgname=cecdaemon-git
pkgver=1.0.0.r4.g0de2f51
pkgrel=1
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
    cp "$srcdir/../uinput.conf" "$pkgdir/etc/modules-load.d/"

    cp "examples/cecdaemon.conf-example" "$pkgdir/etc/cecdaemon.conf"

    mkdir -p "$pkgdir/etc/systemd/system/multi-user.target.wants/"
    cp "examples/cecdaemon.service-example" "$pkgdir/etc/systemd/system/multi-user.target.wants/cecdaemon.service"
    sed -i 's/cec.conf/cecdaemon.conf/' "$pkgdir/etc/systemd/system/multi-user.target.wants/cecdaemon.service"
}
