# Maintainer: fnrhombus <fnrhombus@users.noreply.github.com>
#
# This PKGBUILD is the template that CI publishes to aur/azure-ddns on every
# GitHub release. CI runs `updpkgsums` before pushing, so the published copy
# has real sha256sums even though this template uses SKIP.

pkgname=azure-ddns
pkgver=0.2.3
pkgrel=1
pkgdesc='Dynamic DNS updater for Azure DNS (A + AAAA records)'
arch=('any')
url='https://github.com/fnrhombus/azure-ddns'
license=('MIT')
depends=('bash' 'curl' 'jq' 'systemd')
optdepends=(
    'networkmanager: update-on-link-up dispatcher hook'
)
backup=('etc/azure-ddns.env')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('215d1dd005f198f12216f3dd1aa65ab8f94853bcce76854f52c6667a9645e9f9')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 bin/azure-ddns                "$pkgdir/usr/bin/azure-ddns"
    install -Dm644 systemd/azure-ddns.service    "$pkgdir/usr/lib/systemd/system/azure-ddns.service"
    install -Dm644 systemd/azure-ddns.timer      "$pkgdir/usr/lib/systemd/system/azure-ddns.timer"
    install -Dm755 dispatcher.d/90-azure-ddns    "$pkgdir/usr/lib/NetworkManager/dispatcher.d/90-azure-ddns"
    install -Dm600 azure-ddns.env.template       "$pkgdir/etc/azure-ddns.env"

    install -Dm644 LICENSE                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md                     "$pkgdir/usr/share/doc/$pkgname/README.md"
}
