# Maintainer: @aardbol
pkgname=dhictl-bin
_pkgname=dhictl
pkgver=0.0.14
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

sha256sums_x86_64=('6bd383daa314f32464ecef6cc81a7e198252943565c929b9b210761650fdbc1a')
sha256sums_aarch64=('8a5df1c8d5e7d6352a168481b7b143508830589ff37b65df2b13b9bb3287eed4')

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
