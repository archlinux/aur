# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
pkgname='netaudio-git'
pkgver=0.1.6
pkgrel=1
pkgdesc="CLI for controlling Audinate Dante network audio devices (git version)"
arch=(any)
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-zeroconf' 'python-ifaddr' 'python-sqlitedict' 'python-typer' 'python-rich' 'python-pyyaml')
optdepends=('python-pynacl: device lock/unlock'
            'python-redis: packet capture features'
            'wireshark-cli: live network capture')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling')
provides=('netaudio' 'python-netaudio')
conflicts=('netaudio' 'python-netaudio')
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
    cd "${pkgname}/packages/netaudio-lib"
    python -m build --wheel --no-isolation
    cd "${srcdir}/${pkgname}/packages/netaudio"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" packages/netaudio-lib/dist/*.whl
    python -m installer --destdir="$pkgdir" packages/netaudio/dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 systemd/netaudio.service "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
