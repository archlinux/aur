pkgname=cloudfleet-cli
pkgver=0.8.32
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('6f5d79253f7d189eeb2ea69a1460411d896036269bdc6c176ae8d1788b9eb113' 'b2710e34efb75285b3109c3cf9a86eed593a0f44cfaffff8219bb17ca12b7b39')

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
