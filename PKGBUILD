# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ivan Fonseca <ivanfon[at]riseup[dot]net>
# Contributor: John D Jones III jnbek1972 __AT__ $mailservice_by_google __DOT__ com

_npmname=tldr
pkgname=nodejs-tldr-git
pkgver=r6279.178e6959a
pkgrel=1
pkgdesc="Simplified and community-driven man pages (git version)"
arch=('any')
url="https://github.com/tldr-pages/tldr"
license=('MIT')
makedepends=('git' 'jq' 'npm')
depends=('nodejs' )
conflicts=('nodejs-tldr' 'tldr')
replaces=('nodejs-tldr' 'tldr')
install='INSTALL'
source=("tldr::git+${url}.git")
sha1sums=('SKIP')

pkgver(){
    cd "${_npmname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# see: https://wiki.archlinux.org/index.php/Node.js_package_guidelines

package() {
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" "${_npmname}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    # Remove local paths from package.json
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
    
