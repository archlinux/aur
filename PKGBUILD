# Maintainer: fnrhombus <fnrhombus@users.noreply.github.com>
#
# VCS flavor: builds from the tip of main. Companion to azure-ddns; users
# install one or the other (they conflict). pkgver() runs at build time
# and produces values like 0.1.0.r42.gabc1234, ordered correctly by vercmp.

pkgname=azure-ddns-git
_pkgname=azure-ddns
pkgver=0.2.1.r1.g24ef3db
pkgrel=1
pkgdesc='Dynamic DNS updater for Azure DNS (A + AAAA records) — HEAD of main'
arch=('any')
url='https://github.com/fnrhombus/azure-ddns'
license=('MIT')
depends=('bash' 'curl' 'jq' 'systemd')
optdepends=(
    'networkmanager: update-on-link-up dispatcher hook'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("$_pkgname")
backup=("etc/${_pkgname}.env")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    # last-tag.r<commits>.g<sha>; falls back to r<count>.<sha> when no tags exist.
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
        || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$_pkgname"

    install -Dm755 bin/azure-ddns                "$pkgdir/usr/bin/azure-ddns"
    install -Dm644 systemd/azure-ddns.service    "$pkgdir/usr/lib/systemd/system/azure-ddns.service"
    install -Dm644 systemd/azure-ddns.timer      "$pkgdir/usr/lib/systemd/system/azure-ddns.timer"
    install -Dm755 dispatcher.d/90-azure-ddns    "$pkgdir/usr/lib/NetworkManager/dispatcher.d/90-azure-ddns"
    install -Dm600 azure-ddns.env.template       "$pkgdir/etc/azure-ddns.env"

    install -Dm644 LICENSE                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md                     "$pkgdir/usr/share/doc/$pkgname/README.md"
}
