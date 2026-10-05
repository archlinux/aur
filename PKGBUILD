# Maintainer: Matthias R. Wiora <matthias@wiora.io>
pkgname=tpm2-kira
pkgver=0.4.2
# pkgver may not contain '-', but a prerelease tag can. Keep them separate.
_tag=0.4.2
pkgrel=1
pkgdesc="TPM2-based TOTP authenticator with PCR policies"
arch=('x86_64')
url="https://github.com/mrwiora/tpm2-kira"
license=('BSD-3-Clause')
# Statically linked, no cgo: the same binary runs in the initramfs.
depends=()
makedepends=('go>=1.24')
optdepends=('mkinitcpio: for early boot integration'
            'cryptsetup: for disk encryption integration'
            'tpm2-tools: for debugging and integration testing'
            'pcsclite: keeping the signing key on a YubiKey (setup --yubikey)')
conflicts=('tpm2-kira-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('10e0471e96234dc15ab08472454e90d06951cf62bcc5992b79203b46b98b5a11')
options=('!debug')

# GitHub names the extracted directory after the tag, minus a leading 'v'.
_srcdir="$pkgname-${_tag#v}"

prepare() {
    cd "$_srcdir"

    export GOPROXY=direct
    go mod download
}

build() {
    cd "$_srcdir"

    # The binary is copied into the initramfs, which has no libc, so it must
    # be fully static. That rules out cgo, which Go enables by default when a
    # C compiler is present (the net package alone then links glibc), and it
    # rules out -buildmode=pie: even without cgo a PIE binary still needs
    # glibc's program interpreter, /lib64/ld-linux-x86-64.so.2, to start.
    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"

    go build -ldflags "-s -w -X main.Version=${pkgver}" -o "$pkgname" .
    go version -m "$pkgname" | grep -q 'CGO_ENABLED=0' || { echo "$pkgname was built with cgo" >&2; return 1; }
}

check() {
    cd "$_srcdir"

    go test -tags=unit ./cmd/...
}

package() {
    cd "$_srcdir"

    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Not enabled on the host: the mkinitcpio install hook enables it inside the
    # image, which is the only place it is meant to run.
    install -Dm644 initramfs/systemd/tpm2-kira.service \
        "$pkgdir/usr/lib/systemd/system/tpm2-kira.service"
    install -Dm644 initramfs/systemd/tpm2-kira-cap.service \
        "$pkgdir/usr/lib/systemd/system/tpm2-kira-cap.service"

    install -Dm644 initramfs/mkinitcpio/install/sd-tpm2-kira \
        "$pkgdir/usr/lib/initcpio/install/sd-tpm2-kira"
    install -Dm755 initramfs/mkinitcpio/post/sd-tpm2-kira \
        "$pkgdir/usr/lib/initcpio/post/sd-tpm2-kira"

    install -Dm644 initramfs/mkinitcpio/mkinitcpio.conf.example \
        "$pkgdir/usr/share/doc/$pkgname/mkinitcpio.conf.example"
}

# vim:set ts=4 sw=4 et:
