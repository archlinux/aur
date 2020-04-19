# Maintainer: Alessandro Menti <alessandro.menti@alessandromenti.it>
pkgname=aws-azure-login
pkgver=1.13.0
pkgrel=1
pkgdesc="Use Microsoft Azure AD SAML Single Sign-On to log into AWS"
arch=('x86_64')
url="https://github.com/sportradar/aws-azure-login"
license=('MIT')
depends=('gtk3' 'nodejs' 'nss' 'libxss')
makedepends=('jq' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sportradar/${pkgname}/archive/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('2e10a27cdc955f91ab5f218a37d5e423d81baadbf048874750aa735f3e6acd9e')

package() {
    mkdir -p "${srcdir}/npm-cache"
    npm install -g --production --user root --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove useless development files
    rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}/.github" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/.dockerignore" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/.editorconfig" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/.eslintrc.json" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/.gitattributes" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/.npmignore" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/Dockerfile" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/docker-launch.sh" \
        "${pkgdir}/usr/lib/node_modules/${pkgname}/snapcraft.yml"

    # Copy the license file to the current directory
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
