# Maintainer: Sving1024 <sving1024@outlook.com>
_name=accesser
pkgname=python-${_name}-git
pkgver=0.9.5.r0.g6b9a557
pkgrel=4
arch=('any')
pkgdesc="A tool for solving SNI RST"
url="https://github.com/URenko/Accesser"
license=('GPL-3.0-or-later')
conflicts=('python-accesser')
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
    "${_name}::git+https://github.com/URenko/Accesser.git"
    "accesser.service"
)
sha256sums=(
    'SKIP'
    'cb16c9771c4fbaf70b6b8f898475d8d024dd57ab385cfecfe364cb678dcbbabe'
)
backup=(
    'etc/accesser/pac'
    'etc/accesser/config.toml'
    'etc/accesser/rules.toml'
)

pkgver() {
    cd ${srcdir}/${_name}
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/${_name}
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "accesser/pac" "${pkgdir}/etc/accesser/pac"
    install -Dm644 "accesser/config.toml" "${pkgdir}/etc/accesser/config.toml"
    cd ..
    install -Dm644 "accesser.service" "${pkgdir}/usr/lib/systemd/system/accesser.service"
}
