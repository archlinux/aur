# Maintainer: Beini <bane at iki dot fi>
pkgname=('perlnavigator'
         'nodejs-perl-navigator-web-server'
         'nodejs-perlnavigator-client'
         'nodejs-perlnavigator-server'
        )
pkgbase=perlnavigator
_pkgname=PerlNavigator
pkgver=0.6.3
pkgrel=1
pkgdesc="Perl language server that includes syntax checking, perl critic, and code navigation"
arch=('any')
url="https://github.com/bscan/PerlNavigator"
license=('MIT')
makedepends=('npm' 'jq')
source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/bscan/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c6cf55fab59e368423379778137f025169c9ce6888004a8c596a705cc862647a5a53c97487fdde745f132c158814ed18c3f37c534b02dda4c71f462fbd0a6902')

_package_node_subdir(){
    local subdir=$1

    cd "${_pkgname}-${pkgver}"

    npm install -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    --install-links "./$subdir"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    chown -R root:root "${pkgdir}"

    find "${pkgdir}" -type f -name "package.json" -print0 \
        | xargs -0 sed -i "/_where/d"

    local tmppackage="$(mktemp)"
    local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname#nodejs-}/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"
}

prepare() {
    cd "${_pkgname}-${pkgver}"
    npm ci --cache "${srcdir}/npm-cache" --ignore-scripts

    local subdir
    for subdir in browser-ext client server
    do
       pushd $subdir
       npm ci --cache "${srcdir}/npm-cache"
       popd
    done
}

build() {
    cd "${_pkgname}-${pkgver}"
    npm run compile
}

package_perlnavigator() {
    pkgdesc="Perl language server that includes syntax checking, perl critic, and code navigation. Self-contained executable"
    arch=('x86_64' 'aarch64')
    depends=('glibc' 'gcc-libs')
    # Both provide /usr/bin/perlnavigator
    conflicts=('nodejs-perlnavigator-server')
    options=("!strip")

    cd "${_pkgname}-${pkgver}"

    PKG_CACHE_PATH="${srcdir}/pkg-cache" \
      npx pkg -t node18-linux .

    install -Dm755 dist/perlnavigator "${pkgdir}/usr/bin/perlnavigator"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_nodejs-perl-navigator-web-server() {
    pkgdesc="Perl language server implementation in a web extension"
    depends=("nodejs")

    _package_node_subdir browser-ext
}

package_nodejs-perlnavigator-client() {
    pkgdesc="Perl language server client"
    depends=("bash" "nodejs")

    _package_node_subdir client
}

package_nodejs-perlnavigator-server() {
    depends=("nodejs")
    provides=('perlnavigator')
    conflicts=('perlnavigator')

    _package_node_subdir server
}
