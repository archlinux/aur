# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances-git
pkgver=3.4.0.r91.g16b04fd
pkgrel=1
pkgdesc='CLI curses-based monitoring tool (git)'
arch=(any)
url=https://github.com/nicolargo/glances
license=(LGPL)
makedepends=(python-build python-installer python-setuptools python-wheel git)
depends=(python python-psutil python-future python-defusedxml python-ujson)
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
    git -C "${pkgname%-git}" describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Clean out old wheels etc.
    git -C "${pkgname%-git}" clean -dfx
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}"/glances.service -t "${pkgdir}"/usr/lib/systemd/system
}
