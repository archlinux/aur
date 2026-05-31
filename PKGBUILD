# Maintainer: facelock contributors
pkgname=facelock-bin
_pkgname=facelock
pkgver=0.1.4
pkgrel=1
pkgdesc="Face authentication PAM module for Linux (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon' 'onnxruntime')
optdepends=(
    'onnxruntime-opt-cuda: NVIDIA GPU acceleration (replaces onnxruntime)'
    'onnxruntime-opt-rocm: AMD GPU acceleration (replaces onnxruntime)'
)
provides=('facelock')
conflicts=('facelock' 'facelock-git')
backup=('etc/facelock/config.toml')
install=facelock.install
source=(
    "$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "facelock-$pkgver-x86_64::$url/releases/download/v$pkgver/facelock-x86_64-linux-gnu"
    "pam_facelock-$pkgver.so::$url/releases/download/v$pkgver/pam_facelock.so"
    "facelock-polkit-agent-$pkgver-x86_64::$url/releases/download/v$pkgver/facelock-polkit-agent-x86_64-linux-gnu"
)
sha256sums=('c644a00d29a9ac4c3ad254b646b2ed0cb8b5dc83046ed3b0f7362cdec7824c17' '6d52b8ec125364c16f5c17928b54163403a0ace6ed61fd6ff0ad49bacdf1f0f7' '211345eb2eecc3d4b60bfdefb4e53ba47f91967fa058e6e876478688c4a35982' '95c7d9f88a6f4115e6cae52f73173a0408eead3eef13a349b83784177eb69426')

package() {
    cd "$_pkgname-$pkgver"

    # Prebuilt binaries from the GitHub Release
    install -Dm755 "$srcdir/facelock-$pkgver-x86_64" "$pkgdir/usr/bin/facelock"
    install -Dm755 "$srcdir/facelock-polkit-agent-$pkgver-x86_64" "$pkgdir/usr/bin/facelock-polkit-agent"
    install -Dm755 "$srcdir/pam_facelock-$pkgver.so" "$pkgdir/usr/lib/security/pam_facelock.so"

    # Ancillary assets from the source tarball
    install -Dm644 config/facelock.toml "$pkgdir/etc/facelock/config.toml"
    install -Dm644 -t "$pkgdir/usr/share/facelock/quirks.d/" config/quirks.d/*.toml
    install -Dm644 systemd/facelock-daemon.service "$pkgdir/usr/lib/systemd/system/facelock-daemon.service"
    install -Dm644 dbus/org.facelock.Daemon.conf "$pkgdir/usr/share/dbus-1/system.d/org.facelock.Daemon.conf"
    install -Dm644 dbus/org.facelock.Daemon.service "$pkgdir/usr/share/dbus-1/system-services/org.facelock.Daemon.service"
    install -Dm644 dist/facelock.sysusers "$pkgdir/usr/lib/sysusers.d/facelock.conf"
    install -Dm644 dist/facelock.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/facelock.conf"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
