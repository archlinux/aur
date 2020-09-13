# Maintainer: Alessandro Menti <alessandro.menti@alessandromenti.it>
pkgname=aws-azure-login
pkgver=2.2.4
pkgrel=1
pkgdesc="Use Microsoft Azure AD SAML Single Sign-On to log into AWS"
arch=('x86_64')
url="https://github.com/sportradar/aws-azure-login"
license=('MIT')
depends=('gtk3' 'nodejs' 'nss' 'libxss')
makedepends=('jq' 'npm' 'typescript')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sportradar/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('9e7739330fe2fcfcbb5ec2a0b1ad27c0a6e0b35b3a2848fc9ab7e2e71c379d04')

package() {
    mkdir -p "${srcdir}/npm-cache"

    # The "npm run build" step is required to invoke the TypeScript compiler
    # and generate the actual binary, "npm install" will not suffice.
    # For this reason:
    # - we generate a temporary install containing all development
    #   dependencies;
    # - we run the build to invoke the TypeScript compiler and then pack
    #   the result;
    # - we install the release tarball to the package directory.
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --user root --cache "${srcdir}/npm-cache" --no-bin-links .
    npm run build
    npm pack
    npm install -g --production --user root --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" --no-save "${pkgname}-${pkgver}.tgz"

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

    # Copy the license file to the current directory
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
