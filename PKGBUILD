# Maintainer: facelock contributors
pkgname=facelock-bin
_pkgname=facelock
_tag=0.2.1
pkgver=0.2.1
pkgrel=1
pkgdesc="Face authentication for Linux PAM (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/tyvsmith/facelock"
license=('MIT OR Apache-2.0')
depends=('glibc' 'dbus' 'pam' 'gcc-libs' 'tpm2-tss' 'libxkbcommon' 'onnxruntime')
# The binaries are prebuilt, but the translation catalogs are still compiled
# here from the source tarball's po/ tree.
makedepends=('gettext')
optdepends=(
    'onnxruntime-opt-cuda: NVIDIA GPU acceleration (replaces onnxruntime)'
    'onnxruntime-opt-rocm: AMD GPU acceleration (replaces onnxruntime)'
)
provides=('facelock')
conflicts=('facelock' 'facelock-git')
backup=('etc/facelock/config.toml')
install=facelock.install
source=(
    "$_pkgname-$_tag.tar.gz::$url/archive/v$_tag.tar.gz"
    "facelock-$_tag-x86_64::$url/releases/download/v$_tag/facelock-x86_64-linux-gnu"
    "pam_facelock-$_tag.so::$url/releases/download/v$_tag/pam_facelock.so"
    "facelock-polkit-agent-$_tag-x86_64::$url/releases/download/v$_tag/facelock-polkit-agent-x86_64-linux-gnu"
)
sha256sums=('b7f7cc8f65b9e26a22abd95b2c3a5e4b435e496590e4a03bddb0a670a47b267f' 'd8c529945e262d1c5ec134e3cfd7777e4fd7759ab463be47cf9755f0fe153b95' '01678219c40b685c07df822588136ba3766186e4b76c2583b4165c593569138f' '865d8cc87509dadb66dee981fbb28191bf38032d8806c12dd31b96856d42ba11')

package() {
    cd "$_pkgname-$_tag"

    # Prebuilt binaries from the GitHub Release
    install -Dm755 "$srcdir/facelock-$_tag-x86_64" "$pkgdir/usr/bin/facelock"
    install -Dm755 "$srcdir/facelock-polkit-agent-$_tag-x86_64" "$pkgdir/usr/bin/facelock-polkit-agent"
    install -Dm755 "$srcdir/pam_facelock-$_tag.so" "$pkgdir/usr/lib/security/pam_facelock.so"

    # Ancillary assets from the source tarball
    install -Dm644 config/facelock.toml "$pkgdir/etc/facelock/config.toml"
    install -Dm644 -t "$pkgdir/usr/share/facelock/quirks.d/" config/quirks.d/*.toml
    install -Dm644 systemd/facelock-daemon.service "$pkgdir/usr/lib/systemd/system/facelock-daemon.service"
    install -Dm644 dbus/org.facelock.Daemon.conf "$pkgdir/usr/share/dbus-1/system.d/org.facelock.Daemon.conf"
    install -Dm644 dbus/org.facelock.Daemon.service "$pkgdir/usr/share/dbus-1/system-services/org.facelock.Daemon.service"
    install -Dm644 dist/facelock.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/facelock.conf"
    install -Dm644 dist/facelock-pam-remove.hook "$pkgdir/usr/share/libalpm/hooks/facelock-pam-remove.hook"

    # Compiled translation catalogs, both gettext domains. Installs nothing
    # while po/ holds only .pot templates, and creates no empty locale root.
    scripts/install-locale-catalogs.sh "$pkgdir/usr/share/locale"

    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
