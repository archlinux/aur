# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>
_name=webssh
pkgname=python-$_name
pkgver=1.5.3
pkgrel=1
pkgdesc="A SSH Web Front End"
arch=(any)
url="https://github.com/huashengdun/webssh"
license=("Apache")
depends=("python-tornado" "python-paramiko")
makedepends=("python" "python-setuptools")
backup=(etc/conf.d/webssh)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        webssh.conf.d
		webssh.service
		sysusers.conf)
sha256sums=('02ee8f13c8d89bc2e4129d01d72996fff664ae4715d016aec2e7d09ab1cb114e'
            'd14c4c025468b8a4801b8f93dccad10da638934ec394bf34f9523bbcfe358286'
            'cd7f5fc4b81fc1757fca6c00b5fadf1e24954d6c21682e6a3876b0de9e7be291'
            '5f4eca9aeb0744f06d14e90d0aae74d91a1953056c27a186c793bc104c22f832')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	cd "$srcdir"
    # Configuration
    install -Dm644 webssh.conf.d "$pkgdir/etc/conf.d/webssh"
    install -Dm644 webssh.service \
        "$pkgdir/usr/lib/systemd/system/webssh.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/webssh.conf"
}
