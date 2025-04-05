# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contribubtor: Moritz Patelscheck <moritz(at)patelscheck.de>

pkgname=python-webssh
_pkg="${pkgname#python-}"
pkgver=1.6.2
pkgrel=2
pkgdesc="Web-based SSH client"
arch=('any')
url="https://github.com/huashengdun/webssh"
license=('MIT')
depends=('python-paramiko' 'python-tornado')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/conf.d/webssh')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz"
        webssh.conf.d
        webssh.service
        sysusers.conf)
sha256sums=('9917acb5126e91a7fbb62def22cfcc33f47ece91a62b9e758f91c033672106c1'
            'd14c4c025468b8a4801b8f93dccad10da638934ec394bf34f9523bbcfe358286'
            'cd7f5fc4b81fc1757fca6c00b5fadf1e24954d6c21682e6a3876b0de9e7be291'
            '5f4eca9aeb0744f06d14e90d0aae74d91a1953056c27a186c793bc104c22f832')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 "$srcdir/$_pkg.conf.d" "$pkgdir/etc/conf.d/$_pkg"
	install -Dvm644 "$srcdir/$_pkg.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dvm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkg.conf"
}
