# Maintainer: Sving1024 <sving1024@outlook.com>
_name=accesser
pkgname=python-${_name}
pkgver=0.11.0
pkgrel=1
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
sha256sums=('4a50982230d0d995121f474f4d44656121126acda91c03051b27256a57d96877'
            '0ab7e33edd1b9294cb7f47224bae146846a0007d319c30000a564f02e7c16e4d')
backup=(
    'etc/accesser/pac'
    'etc/accesser/config.toml'
    'etc/accesser/rules.toml'
)

install="${pkgname}.install"

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
