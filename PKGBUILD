# Maintainer: Joschka Thurner <git@joschkathurner.de>
pkgname=docker-sbx
pkgver=0.42.1
pkgrel=1
pkgdesc="Docker sandboxes - run AI coding agents in isolated microVM sandboxes"
arch=('x86_64' 'aarch64')
url="https://docs.docker.com/ai/sandboxes/"
license=('LicenseRef-Docker-Proprietary' 'GPL-2.0-only' 'Apache-2.0')
depends=('dbus')
optdepends=(
    'apparmor: AppArmor profile for nerdbox shim confinement (recommended)'
    'wl-clipboard: image paste support (sbx settings set clipboard.imagePaste true)'
    'gnome-keyring: Keychain for credential storage'
    'keepassxc: Keychain for credential storage'
    'kwallet: Keychain for credential storage')
provides=('sbx')
conflicts=('sbx')
options=('!debug')
source_x86_64=("https://github.com/docker/sbx-releases/releases/download/v${pkgver}/DockerSandboxes-linux-amd64.tar.gz")
sha256sums_x86_64=('fe46facba420d1cb8b1dad57d5b182d6df9dadd46c324c2ca3ef574fb7eada6f')
source_aarch64=("https://github.com/docker/sbx-releases/releases/download/v${pkgver}/DockerSandboxes-linux-arm64.tar.gz")
sha256sums_aarch64=('285b36cdb46ce65f792f006869698f2664fcde8adc1e8524357f150f9368dd4c')

package() {
    # sbx locates its helper binaries at runtime via a path relative to its
    # own executable (<dir>/../libexec)
    install -Dm755 "$srcdir/docker-sbx/sbx" \
        "$pkgdir/usr/lib/${pkgname}/bin/sbx"
    install -d "$pkgdir/usr/bin"
    ln -s "../lib/${pkgname}/bin/sbx" "$pkgdir/usr/bin/sbx"

    install -Dm755 "$srcdir/docker-sbx/containerd-shim-nerdbox-v1" \
        "$pkgdir/usr/lib/${pkgname}/libexec/containerd-shim-nerdbox-v1"
    # GPU trampoline shim is only shipped in the amd64 upstream tarball.
    if [[ -f "$srcdir/docker-sbx/containerd-shim-nerdbox-gpu-v1" ]]; then
        install -Dm755 "$srcdir/docker-sbx/containerd-shim-nerdbox-gpu-v1" \
            "$pkgdir/usr/lib/${pkgname}/libexec/containerd-shim-nerdbox-gpu-v1"
    fi
    install -Dm755 "$srcdir/docker-sbx/mkfs.erofs" \
        "$pkgdir/usr/lib/${pkgname}/libexec/mkfs.erofs"
    # Kernel/rootfs filenames vary by arch (e.g. nerdbox-kernel-x86_64 vs.
    # nerdbox-kernel-arm64_4k), so install whatever upstream shipped.
    for f in "$srcdir"/docker-sbx/nerdbox-kernel-* "$srcdir"/docker-sbx/nerdbox-rootfs-*.erofs; do
        install -Dm644 "$f" "$pkgdir/usr/lib/${pkgname}/libexec/$(basename "$f")"
    done
    install -Dm755 "$srcdir/docker-sbx/libsailor.so" \
        "$pkgdir/usr/lib/${pkgname}/libexec/lib/libsailor.so"

    install -Dm644 "$srcdir/docker-sbx/apparmor-profile" \
        "$pkgdir/etc/apparmor.d/docker-sbx-nerdbox-shim"
    # Upstream's profile confines the /usr/libexec/ path; repoint it at
    # where the shim actually lives in this package.
    sed -i "s|/usr/libexec/containerd-shim-nerdbox-v1|/usr/lib/${pkgname}/libexec/containerd-shim-nerdbox-v1|" \
        "$pkgdir/etc/apparmor.d/docker-sbx-nerdbox-shim"

    install -Dm644 "$srcdir/docker-sbx/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/docker-sbx/THIRD-PARTY-NOTICES" \
        "$pkgdir/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
