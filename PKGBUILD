# Maintainer: email@ricardo.band

pkgname=projen
pkgver=0.58.15
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
sha256sums=('cf1e54e8f8bbd779abe689c3f305cb6754e9e5780259e83d6257654a0750dc8d')

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

