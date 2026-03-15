pkgname=cloudfleet-cli
pkgver=0.8.23
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('7d4fe1c7def3196b4545d4b1bc56ed83a196d16f04423c9ccaaa445fc28e0acc' '4172a620ce5a66b8b7f7ad0aeeeb7133ee7a32ce8db9a2dc1e9cf46ee063b86a')

prepare() {
    cd "$srcdir"
    # Extract only the archive for the current architecture
    case "$CARCH" in
        x86_64)
            bsdtar -xf "cloudfleet_linux_amd64-${pkgver}.zip"
            ;;
        aarch64)
            bsdtar -xf "cloudfleet_linux_arm64-${pkgver}.zip"
            ;;
    esac
}

package() {
    # Install binary
    install -Dm755 "$srcdir/cloudfleet" "$pkgdir/usr/bin/cloudfleet"

    # Install shell completions
    "$srcdir/cloudfleet" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/cloudfleet"
    "$srcdir/cloudfleet" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_cloudfleet"
    "$srcdir/cloudfleet" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/cloudfleet.fish"
}
