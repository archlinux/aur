# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
pkgname='netaudio-git'
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for managing network audio devices (git version)"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr' 'python-sqlitedict' 'python-typer' 'python-rich' 'python-pyyaml')
optdepends=('python-pynacl: device lock/unlock'
            'python-redis: packet capture features'
            'wireshark-cli: live network capture')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('netaudio')
conflicts=('netaudio')
source=("${pkgname}::git+https://github.com/chris-ritsen/network-audio-controller.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 systemd/netaudio.service "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
