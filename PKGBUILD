# Maintainer: John Beard <john.j.beard@gmail.com>

_npmname=rofi-search
pkgname=rofi-search-git
pkgver=r27.f5bccda
pkgrel=1
pkgdesc="Search engine plugin for rofi"
arch=('any')
url="https://github.com/fogine/rofi-search"
license=('MIT')
makedepends=('git' 'jq' 'npm')
depends=('nodejs' 'rofi' 'rofi-blocks-git')
optdepends=('googler: retrieve results from Google'
            'ddgr: retrieve results from DuckDuckGo')
conflicts=('rofi-search')
replaces=('rofi-search')
# install='INSTALL'
source=("rofi-search::git+${url}.git")
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
