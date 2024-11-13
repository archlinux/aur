# Maintainer: Sving1024 <piano5432@outlook.com>
_name=accesser
pkgname=python-${_name}
pkgver=0.10.0
pkgrel=4
arch=('any')
pkgdesc="A tool for solving SNI RST"
url="https://github.com/URenko/Accesser"
license=('GPL-3.0-or-later')
conflicts=('python-accesser-git')
provides=('python-accesser')
depends=(
	'python'
	'python-packaging'
    'python-cryptography'
    'python-tld'
    'python-tomli'
    'python-dnspython'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=(
    'python-rich: DNS over https support'
    'python-httpcore: DNS over https support'
    'python-httpx: DNS over https support'
    'python-h2: DNS over https support'
    'python-aioquic: DNS over quic support'
)
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz"
    "accesser.service"
)
sha256sums=('b11965b1a52adf1fc55e313f08d6a38f224c21a4597833a04c3fe1f784cd4691'
            'f943fdd6f112eb32a5630c60383470bcb344db66d0a116cdcbcc22f533815690')
backup=(
    'etc/accesser/pac'
    'etc/accesser/config.toml'
    'etc/accesser/rules.toml'
)

build() {
    cd ${srcdir}/$_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    pushd ${srcdir}/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "accesser/pac" "${pkgdir}/etc/accesser/pac"
    install -Dm644 "accesser/config.toml" "${pkgdir}/etc/accesser/config.toml"
    install -Dm644 "accesser/rules.toml" "${pkgdir}/etc/accesser/rules.toml"
    popd
    install -Dm644 "accesser.service" "${pkgdir}/usr/lib/systemd/system/accesser.service"
}
