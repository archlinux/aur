pkgname=cloudfleet-cli
pkgver=0.11.1
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('85a3078a317c842a236932844f1aeebc9ef982ff34a60e3625d977eac9fb9360' '97ee64a1b2721e1bf3f2fcbb21c3b489d10a7eab74190225a1cdbd7b01daec7c')

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
