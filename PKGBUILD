# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
pkgname='netaudio-git'
pkgver=0.4.0
pkgrel=1
pkgdesc="Cross-platform control, automation, and monitoring for Dante network audio devices (git version)"
arch=('x86_64' 'aarch64')
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('python' 'python-click' 'python-cryptography' 'python-dbus-fast' 'python-ifaddr' 'python-rich'
         'python-segno' 'python-typer' 'python-typing_extensions' 'python-yaml' 'python-zeroconf')
optdepends=('python-jack-client: follow JACK audio with host_audio'
            'python-numpy: record JACK audio'
            'python-pulsectl-asyncio: follow PulseAudio audio with host_audio'
            'python-redis: publish device state to Redis'
            'wireshark-cli: live network capture')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer' 'python-wheel' 'rust')
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
    cd "${pkgname}/packages/netaudio-core"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}"
    export CARGO_NET_OFFLINE=true RUSTUP_TOOLCHAIN=stable
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 systemd/netaudio.service "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
