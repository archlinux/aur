# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgname='netaudio'
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for managing network audio devices"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr' 'python-sqlitedict' 'python-typer' 'python-rich' 'python-pyyaml')
optdepends=('python-pynacl: device lock/unlock'
            'python-redis: packet capture features'
            'wireshark-cli: live network capture')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "netaudio.service::https://raw.githubusercontent.com/chris-ritsen/network-audio-controller/master/systemd/netaudio.service")
sha256sums=('3d444a4c81da8aee6ef7f3539ccf3aef64ad03335a0909eb3abca440d3031e6a'
            'SKIP')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/netaudio.service" "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
