# Maintainer: facelock contributors
pkgname=facelock-bin
_pkgname=facelock
_tag=0.2.0
pkgver=0.2.0
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
sha256sums=('06b0d6eea61c88bbdbd4a0830bf91a67aeb12565c6fc78fdb28a89f229bc3771' '4ca1efad131a9c5c2e3ce430b0872ce218f0129be51bbe18342c05c6b568720c' '3aa8604a7daa5b488f4f52aa7f3512a8c8974e032042371fa0778506180f7d2d' '1247c9aeafa3c1e0ded050297e7960cf16ae58cd317448820bc090c7783343b9')

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
