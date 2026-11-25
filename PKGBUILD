# Maintainer: @aardbol
pkgname=dhictl-bin
_pkgname=dhictl
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI for managing Docker Hardened Images (DHI)'
arch=('x86_64' 'aarch64')
url='https://github.com/docker-hardened-images/dhictl'
license=('LicenseRef-Docker-Subscription-Service-Agreement')
provides=('dhictl')
conflicts=('dhictl' 'dhictl-git')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums_x86_64=('112b5ef558896097aac4f769dc52f4b8764f1ca79f9c92d48aac9eaf15896948')
sha256sums_aarch64=('1ef2a32a1e43f4e631d9d372e27fd12f78defb8272d200ed188e542ccf12aa58')

package() {
    local goarch
    case "$CARCH" in
        x86_64) goarch=amd64 ;;
        aarch64) goarch=arm64 ;;
    esac
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-linux-${goarch}" "$pkgdir/usr/bin/${_pkgname}"

    "$pkgdir/usr/bin/${_pkgname}" completion bash > "$srcdir/${_pkgname}.bash"
    "$pkgdir/usr/bin/${_pkgname}" completion zsh > "$srcdir/_${_pkgname}"
    "$pkgdir/usr/bin/${_pkgname}" completion fish > "$srcdir/${_pkgname}.fish"
    install -Dm644 "$srcdir/${_pkgname}.bash" "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "$srcdir/_${_pkgname}" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "$srcdir/${_pkgname}.fish" "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

    install -dm755 "$pkgdir/usr/lib/docker/cli-plugins"
    ln -s /usr/bin/${_pkgname} "$pkgdir/usr/lib/docker/cli-plugins/docker-dhi"
}
