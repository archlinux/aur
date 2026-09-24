# Maintainer: Matthias R. Wiora <matthias@wiora.io>
pkgname=tpm2-kira
pkgver=0.3.3
# pkgver may not contain '-', but a prerelease tag can. Keep them separate.
_tag=0.3.3
pkgrel=1
pkgdesc="TPM2-based TOTP authenticator with PCR policies"
arch=('x86_64')
url="https://github.com/mrwiora/tpm2-kira"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go>=1.24')
optdepends=('mkinitcpio: for early boot integration'
            'cryptsetup: for disk encryption integration'
            'qrencode: renders the enrolment QR code during setup'
            'tpm2-tools: for debugging and integration testing')
conflicts=('tpm2-kira-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('9c1c101a9ee0a2cf376dbe236343065861f6cbb87024c97e4675d295b8793186')
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

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -ldflags "-s -w -X main.Version=${pkgver}" -o "$pkgname" .
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

    install -Dm644 initramfs/mkinitcpio/install/sd-tpm2-kira \
        "$pkgdir/usr/lib/initcpio/install/sd-tpm2-kira"
    install -Dm755 initramfs/mkinitcpio/post/sd-tpm2-kira \
        "$pkgdir/usr/lib/initcpio/post/sd-tpm2-kira"

    install -Dm644 initramfs/mkinitcpio/mkinitcpio.conf.example \
        "$pkgdir/usr/share/doc/$pkgname/mkinitcpio.conf.example"
}

# vim:set ts=4 sw=4 et:
