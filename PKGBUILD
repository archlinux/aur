# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye-git
pkgver=0.43.1.r139.gd0904f33
pkgrel=1
pkgdesc="A web frontend for the motion daemon, Python 3 development branch"
url="https://github.com/motioneye-project/motioneye"
license=("GPL-3.0-or-later")
arch=("any")
provides=("motioneye")
conflicts=("motioneye")
depends=("motion"
         "python-argon2-cffi"
         "python-babel"
         "python-boto3"
         "python-jinja"
         "python-pillow"
         "python-pycurl"
         "python-tornado")
makedepends=("git"
             "python-build"
             "python-installer"
             "python-setuptools"
             "python-wheel")
backup=("etc/motioneye/motioneye.conf")
source=("git+$url#branch=dev"
        "motioneye.service")
b2sums=('SKIP'
        'f730f87645de0e9573774db2caf05b70d03bed5083b24e2b92e13e436a2d9c865d4dd1c7f0456262f6d19a260572b2926be1cd29fa0e685207d0248cd01f1428')
install=motioneye.install

pkgver() {
    cd "$srcdir/motioneye"
    git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare() {
    git -C "$srcdir/motioneye" clean -dfx
}

build() {
    cd "$srcdir/motioneye"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/motioneye"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # configuration folder must be writable by motioneye
    install -D -m 660 "motioneye/extra/motioneye.conf.sample" "$pkgdir/etc/motioneye/motioneye.conf"
    install -D -m 644 "$srcdir/motioneye.service" "$pkgdir/usr/lib/systemd/system/motioneye.service"
}
