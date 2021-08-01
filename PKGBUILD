# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances-git
pkgver=3.2.2.r11.gbdeb414a
pkgrel=1
pkgdesc='CLI curses-based monitoring tool (git)'
arch=(any)
url=https://github.com/nicolargo/glances
license=(LGPL)
makedepends=(git python-setuptools)
depends=(python python-psutil python-future python-defusedxml)
optdepends=('hddtemp: HDD temperature monitoring support'
            'python-bottle: web server support'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(git+"${url}".git
        glances.service)
sha512sums=('SKIP'
            '49f0d185a37a5c5837e5beb463770c943ede40b2f1b8405e338129e897e97d9fc58373a8586fabc506266e6343cfea3c91b9787ac6832cc97a1ab63d6ad058d4')

pkgver() {
    git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "${srcdir}"/glances.service -t "${pkgdir}"/usr/lib/systemd/system
}
