# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgname='netaudio'
pkgver=0.5.0
pkgrel=1
pkgdesc="Cross-platform control, automation, and monitoring for Dante network audio devices"
arch=('x86_64' 'aarch64')
url='https://github.com/chris-ritsen/network-audio-controller'
license=(Unlicense)
depends=('alsa-lib' 'libpulse' 'python' 'python-click' 'python-cryptography' 'python-dbus-fast' 'python-ifaddr' 'python-rich'
         'python-segno' 'python-typer' 'python-typing_extensions' 'python-yaml' 'python-zeroconf')
optdepends=('jack: native JACK audio'
            'python-jack-client: follow JACK audio with host_audio'
            'python-numpy: record JACK audio'
            'python-pulsectl-asyncio: follow PulseAudio audio with host_audio'
            'python-redis: publish device state to Redis'
            'wireshark-cli: live network capture')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel' 'rust')
options=('!lto')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "netaudio-${pkgver}.service::https://raw.githubusercontent.com/chris-ritsen/network-audio-controller/v${pkgver}/systemd/netaudio.service")
sha256sums=('74c783452adf0df0d6d3bd874c9865afc13613fe54ae0296f25c075fed367d99'
            'de4e7a411fa6818436be641a2106d5c71cd77b7d3d1ac8659bc2e739e1364dcb')

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
