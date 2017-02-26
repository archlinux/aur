# Maintainer: Alex Mekkering <amekkering at gmail dot com>

pkgname=horepg
pkgver=r66.f85e46c
pkgrel=1
pkgdesc="Parses EPG data from the service at horizon.tv for usage in TVHeadend."
arch=('any')
url="https://github.com/beralt/horepg"
license=('MIT')
depends=('python-requests' 'tvheadend')
makedepends=('python-setuptools')

###################################
# Use a specific commit for stability reasons
source=('git+https://github.com/beralt/horepg.git#commit=f85e46c')
###################################
# Enable the following line (& disable the previous one) to build using the most recent commit
#source=('git+https://github.com/beralt/horepg.git')

install=horepg.install

prepare() {
    cd ${srcdir}/${pkgname}
    patch -p1 -i ../../horepg-disable-radio.patch
}

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}/"

    install -D -m 644 "dist/systemd/horepgd.service" "$pkgdir/usr/lib/systemd/system/horepgd.service"
    install -D -m 644 "dist/systemd/horepgd.timer" "$pkgdir/usr/lib/systemd/system/horepgd.timer"
}

md5sums=('SKIP')
