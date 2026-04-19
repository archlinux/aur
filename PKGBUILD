# Maintainer: Yukari0201 130890393+Yukari0201@users.noreply.github.com

_pkgname=sing-box
pkgname="$_pkgname"-ref1nd-beta-bin
_pkgver=1.14.0-alpha.13-reF1nd.1 # renovate: datasource=github-tags depName=reF1nd/sing-box-releases
pkgver=$(echo "$_pkgver" | sed 's/-/\~/; s/-/\./')
pkgrel=1

pkgdesc='The universal proxy platform.'
arch=('x86_64' 'aarch64')
url='https://github.com/reF1nd/sing-box'
license=('GPL-3.0')

provides=("$_pkgname")

source=(
    "config.json::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/config.json"
    "sing-box.rules::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/sing-box.rules"
    "sing-box.service::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/sing-box.service"
    "sing-box@.service::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/sing-box@.service"
    "sing-box-split-dns.xml::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/sing-box-split-dns.xml"
    "sing-box.sysusers::https://raw.githubusercontent.com/reF1nd/sing-box/refs/tags/v${_pkgver}/release/config/sing-box.sysusers"
)
source_x86_64=("sing-box-${_pkgver}-linux-amd64-purego.tar.gz::https://github.com/reF1nd/sing-box-releases/releases/download/v${_pkgver}/sing-box-${_pkgver}-linux-amd64-purego.tar.gz")
source_aarch64=("sing-box-${_pkgver}-linux-arm64-purego.tar.gz::https://github.com/reF1nd/sing-box-releases/releases/download/v${_pkgver}/sing-box-${_pkgver}-linux-arm64-purego.tar.gz")

sha256sums=(
    '4da8152e6cc1b50b1eaa4ff5606510aeb6d3f6a6a5c91614d4b2c0ea9a2b1bde'
    '5a1135cd779a948882702e62b349c19cb72ef56c4af6567bc8f1794ca3b9fbcd'
    '259fa4ee0a29fb863bd1597eba9392bd9767c679c1e28b8b1ee91ce1ea01c84d'
    '0b8740010bb3b2a5b65f1cc444b00127372d015f70f272ed566606949ed2b91b'
    'ebdab3b912603c44b4d76640c5db5c4bc0ca04213d7f34ccaa5e789ba40b426f'
    '0d0631619b6f680b9a80b9a8f65c7a30f2565e80279182f63c77854051c5d473'
)
sha256sums_x86_64=('db515edbe05c28806e6aa5a325837445bc243a2753cdcf8100327861cc7f5d9b')
sha256sums_aarch64=('ed182642a3506a085e8a645746a0a72b7342a01fd84f9623f76daf4faea6ebd2')

conflicts=("$_pkgname"  "$_pkgname-bin" "$_pkgname-git" "$_pkgname-alpha" "$_pkgname-beta" "$_pkgname-beta-bin" "$_pkgname-ref1nd" "$_pkgname-ref1nd-bin" "$_pkgname-ref1nd-git")

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

    cd "sing-box-$_pkgver-linux-${ARCH_MAP[$CARCH]}-purego"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
}
