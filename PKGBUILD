# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgname='netaudio'
pkgver=0.4.1
pkgrel=1
pkgdesc="Cross-platform control, automation, and monitoring for Dante network audio devices"
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
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel' 'rust')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "netaudio-${pkgver}.service::https://raw.githubusercontent.com/chris-ritsen/network-audio-controller/v${pkgver}/systemd/netaudio.service")
sha256sums=('c8f1307b5d0222a1494cfbcf4e0cdd626687c7d81c4dea68e5f87921f816be92'
            '62000946fc3ed099a89358cff33295f94e74dafe8e8d3e21575f1e3202a90f8c')

prepare() {
    cd "${_name}-${pkgver}/packages/netaudio-core"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_name}-${pkgver}"
    export CARGO_NET_OFFLINE=true RUSTUP_TOOLCHAIN=stable
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/netaudio-${pkgver}.service" "$pkgdir/usr/lib/systemd/user/netaudio.service"
}
