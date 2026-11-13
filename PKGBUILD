# Maintainer: @aardbol
pkgname=dhictl-bin
_pkgname=dhictl
pkgver=0.0.13
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

sha256sums_x86_64=('50e5e5904ac24484da44070bd7607c10901b5fcbea39521abe0f5c9538c849c4')
sha256sums_aarch64=('31a2deb4019b1719fe72dafc3358da0c91514a4e4e10237b146fbb87f4ebabce')

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
