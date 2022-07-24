pkgname=node-hp-scan-to
pkgver=1.2.1
pkgrel=1
pkgdesc="Allow to send scan from HP All-in-One Printer to computer"
arch=(any)
url="https://github.com/manuc66/node-hp-scan-to"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')

source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('73322289bfe0440d0c844a3868b9adf6970487fdd3651c069123a84ca1740e81df02bca5544fba4cdde07f9a752845954ba07ea994b321c01bf464594f7ce20a')

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
