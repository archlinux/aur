# Maintainer: Sving1024 <piano5432@outlook.com>
_name=accesser
pkgname=python-${_name}
pkgver=0.9.5
pkgrel=2
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
sha256sums=(
    '51cab930eac102abe0de50029d5f8fa121a814d051b67272cd50562dfdab46ed'
    '867bf31096eff1f35b4e7c2b60ad15f6fbe7df1264bcc9c8162d07d185cf22e7'
)
backup=(
    'etc/accesser/pac'
    'etc/accesser/config.toml'
)

build() {
    cd ${srcdir}/$_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd ${srcdir}/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "accesser/pac" "${pkgdir}/etc/accesser/pac"
    install -Dm644 "accesser/config.toml" "${pkgdir}/etc/accesser/config.toml"
    cd ..
    install -Dm644 "accesser.service" "${pkgdir}/usr/lib/systemd/system/accesser.service"
}
