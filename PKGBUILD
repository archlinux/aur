# Maintainer: Matthias R. Wiora <matthias@wiora.io>
pkgname=tpm2-kira
pkgver=0.1.2
pkgrel=1
pkgdesc="TPM2-based TOTP authenticator with PCR policies"
arch=('x86_64')
url="https://github.com/mrwiora/tpm2-kira"
license=('BSD-3-Clause')
depends=('bash' 'tpm2-tss>=3.0.0' 'qrencode')
makedepends=('go>=1.26' 'git')
optdepends=('mkinitcpio: for early boot integration'
            'cryptsetup: for disk encryption integration'
            'systemd: for systemd-based initramfs'
            'tpm2-tools: for debugging and integration testing')

provides=('tpm2-kira')
conflicts=('tpm2-kira-git')
source=("$pkgname::git+https://github.com/mrwiora/tpm2-kira.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$pkgname"

    # Get version from git tag, similar to Makefile logic
    local git_tag=$(git describe --tags --exact-match 2>/dev/null)

    if [ -n "$git_tag" ]; then
        # Remove 'v' prefix if present (e.g., v1.2.3 -> 1.2.3)
        echo "${git_tag#v}"
    else
        # Fallback to 0.0.0 if no exact tag match
        echo "0.0.0"
    fi
}

prepare() {
    cd "$pkgname"

    # Download Go dependencies
    export GOPROXY=direct
    export GO111MODULE=on
    go mod download
    go mod tidy
}

build() {
    cd "$pkgname"

    # Set Go build environment
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # Get version info
    local git_tag=$(git describe --tags --exact-match 2>/dev/null || echo "v$pkgver")
    local git_commit=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

    # Build with version information
    go build \
        -ldflags "-s -w -X main.Version=${git_tag#v}" \
        -o $pkgname \
        .
}

check() {
    cd "$pkgname"

    # Run unit tests (skip integration tests as they require special TPM setup)
    go test -v -tags=unit ./cmd/...
}

package() {
    cd "$pkgname"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # # Install udev mkinitcpio hooks
    # install -Dm644 ../../mkinitcpio/hooks/tpm2-kira "$pkgdir/usr/lib/initcpio/hooks/tpm2-kira"
    # install -Dm644 ../../mkinitcpio/install/tpm2-kira "$pkgdir/usr/lib/initcpio/install/tpm2-kira"

    # install systemd service
    install -Dm644 systemd/system/tpm2-kira.service "$pkgdir/usr/lib/systemd/system/tpm2-kira.service"
    mkdir -p "$pkgdir/usr/lib/systemd/system/sysinit.target.wants"
    ln -s "../tpm2-kira.service" "$pkgdir/usr/lib/systemd/system/sysinit.target.wants/tpm2-kira.service"

    # Install systemd initramfs hooks
    install -Dm644 mkinitcpio/install/sd-tpm2-kira "$pkgdir/usr/lib/initcpio/install/sd-tpm2-kira"

    # Install post-generation hook (runs 'tpm2-kira reseal' after initramfs rebuild)
    install -Dm755 mkinitcpio/post/sd-tpm2-kira "$pkgdir/usr/lib/initcpio/post/sd-tpm2-kira"

    # Install example configuration
    install -Dm644 mkinitcpio/mkinitcpio.conf.example "$pkgdir/usr/share/doc/$pkgname/mkinitcpio.conf.example"

}

# vim:set ts=4 sw=4 et:
