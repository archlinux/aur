pkgname=cloudfleet-cli
pkgver=0.11.3
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('5cca6e103d8829475bd6b8a8fe53a66461801b117a91cb8774cb92f20f816888' '4360f367036389364b9b561ea52efea54389b7cf51f4c94c00281ae67a4c146b')

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
