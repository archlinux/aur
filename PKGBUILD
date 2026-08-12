# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

_pkgname=sing-box
pkgname="$_pkgname"-ref1nd-beta-bin
_pkgver_beta=1.14.0-beta.14-reF1nd # renovate: datasource=github-tags depName=reF1nd/sing-box-releases
pkgver="${_pkgver_beta//-/.}"
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'aarch64')
url='https://github.com/reF1nd/sing-box'
license=('GPL-3.0')

depends=('glibc>=2.31')
provides=("$_pkgname")

source=(
    "config.json::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/config.json"
    "sing-box.rules::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/sing-box.rules"
    "sing-box.service::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/sing-box.service"
    "sing-box@.service::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/sing-box@.service"
    "sing-box-split-dns.xml::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/sing-box-split-dns.xml"
    "sing-box.sysusers::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver_beta}/release/config/sing-box.sysusers"
)
source_x86_64=("sing-box-${_pkgver_beta}-linux-amd64-glibc.tar.gz::https://github.com/reF1nd/sing-box-releases/releases/download/v${_pkgver_beta}/sing-box-${_pkgver_beta}-linux-amd64-glibc.tar.gz")
source_aarch64=("sing-box-${_pkgver_beta}-linux-arm64-glibc.tar.gz::https://github.com/reF1nd/sing-box-releases/releases/download/v${_pkgver_beta}/sing-box-${_pkgver_beta}-linux-arm64-glibc.tar.gz")

sha256sums=('4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde'
            '5a1135cd779a948882702e62b349c19cb72ef56c4af6567bc8f1794ca3b9fbcd'
            '259fa4ee0a29fb863bd1597eba9392bd9767c679c1e28b8b1ee91ce1ea01c84d'
            '0b8740010bb3b2a5b65f1cc444b00127372d015f70f272ed566606949ed2b91b'
            'ebdab3b912603c44b4d76640c5db5c4bc0ca04213d7f34ccaa5e789ba40b426f'
            '0d0631619b6f680b9a80b9a8f65c7a30f2565e80279182f63c77854051c5d473')
sha256sums_x86_64=('31f36e219c0e86f41eaa8b59ed24887a1ff9b28d68c0479c62edbb69edc3d59a')
sha256sums_aarch64=('e6eb715507bfb2dfe7efb33ad3f911a09896068c88ffd940a3a532af496c2e5c')

conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$_pkgname-beta-bin" "$_pkgname-ref1nd" "$_pkgname-ref1nd-bin" "$_pkgname-ref1nd-git")

backup=("etc/$_pkgname/config.json")

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [aarch64]="arm64" )

    install -Dm644 config.json -t "$pkgdir/etc/$_pkgname"
    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 sing-box.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 sing-box-split-dns.xml "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    cd "sing-box-$_pkgver_beta-linux-${ARCH_MAP[$CARCH]}-glibc"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
}
