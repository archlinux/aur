pkgname=cloudfleet-cli
pkgver=0.9.1
pkgrel=1
pkgdesc="Cloudfleet CLI"
arch=('x86_64' 'aarch64')
license=('Custom')
url="https://cloudfleet.ai"
source=("cloudfleet_linux_amd64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_amd64.zip"
        "cloudfleet_linux_arm64-${pkgver}.zip::https://downloads.cloudfleet.ai/cli/${pkgver}/cloudfleet_linux_arm64.zip")

sha256sums=('679e9697dbd65b55c99f4e49be7afdcc2e6ceb12b58c7f71cacba950035c5a5f' '0f30a4e3b69123f9d331fabd82655cc62268d84e7da533a04309c1ba0da12899')

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
