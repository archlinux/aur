# Maintainer: email@ricardo.band

pkgname=projen
pkgver=0.71.11
pkgrel=1
pkgdesc="Define and maintain complex project configuration through code. projen synthesizes project configuration files from a well-typed definition written in JavaScript."
arch=('any')
url="https://github.com/projen/projen/"
license=('Apache')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=('bash-completion: Bash completion'
            'zsh: zsh completion')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('2a284aaad5c361fce1573c7493a49c0e1c2b34923ccf99300662c161985b26a6')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    #find "$pkgdir" -type f -name package.json | while read pkgjson; do
    #    local tmppackage="$(mktemp)"
    #    jq 'del(.man)' "$pkgjson" > "$tmppackage"
    #    mv "$tmppackage" "$pkgjson"
    #    chmod 644 "$pkgjson"
    #done

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}

