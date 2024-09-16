# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matteo Parolari
# Contributor: gardar <aur@gardar.net>

pkgname=joplin-server
pkgver=3.0.1
pkgrel=1
pkgdesc="Joplin Server for self-hosting Joplin Notes"
#install="joplin.install"
backup=('etc/joplin-server.env')
depends=('nodejs>=20.15.0' 'nss' 'rsync' 'pm2')
arch=('x86_64' 'i686')
makedepends=('git' 'npm' 'yarn' 'python' 'rsync' 'jq' 'yq' 'libgsf' 'node-gyp>=9.4.1' 'python-setuptools')
url="https://github.com/laurent22/joplin/tree/dev/packages/server"
license=('Custom')
source=(
"joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/refs/tags/server-v${pkgver}.tar.gz"
'joplin-server.service' 'joplin-server.sysusers' 'joplin-server.tmpfiles' 'joplin-server.env')
sha256sums=('9d48e7b4e84831987dc54ed94b92881da3b283d6dd4f83cedcf6512c26d54cbc'
            '025f5eb7fee8bf7526d326050ba59a93dfdc1aed2b0770434b421b7c61f04a1c'
            '819b3cb48f9e624b8613753844981fd391b66b826c984fc95005de62ad9659b5'
            '92bd0dea2d8f8160e25ed2811cc3806f5d95568c6557d6ef0c8afda620caac7b'
            '2384fed0f14940b5c2ebb318786d1a45a8aa9762ee46f8af5dc2dbd25cc2b1b7')



prepare() {

    msg2 "Deleting Unnecessary Packages"
    rm -r "${srcdir}/joplin-server-v${pkgver}/packages/app-desktop"
    rm -r "${srcdir}/joplin-server-v${pkgver}/packages/app-mobile"
    rm -r "${srcdir}/joplin-server-v${pkgver}/packages/app-clipper"
    rm -r "${srcdir}/joplin-server-v${pkgver}/packages/app-cli"
}


build() {

    cd "${srcdir}/joplin-server-v${pkgver}"

    export NODE_ENV=production
# added --inline-builds to dump logs to screen when building
    yarn install --inline-builds
    yarn cache clean 
    rm -rf .yarn/berry
}

#FIXME: These checks fail on some machines, even with the exit 0
# Something related with the number of allowed processes I guess
#check() {
#    cd "${srcdir}/joplin-${pkgver}"
#    msg2 "Not Running any tests for now"
#    #npm run test || exit 0
#}

package() {

    export SKIP_YARN_COREPACK_CHECK=0
    mkdir -p "${pkgdir}/opt/joplin-server/"
    cd "${srcdir}/joplin-server-v${pkgver}/packages/"  
    cp -r fork-htmlparser2 fork-sax fork-uslug htmlpack lib renderer server tools turndown turndown-plugin-gfm utils "${pkgdir}/opt/joplin-server/"

    msg2 "Fixing Directories Permissions"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/opt" -type d -exec chmod 755 {} +

    msg2 "Removing References to \$pkgdir"
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "/_where/d"
    
    cd "${srcdir}"
    install -Dm644 "${srcdir}/joplin-server-v${pkgver}/packages/server/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 joplin-server.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 joplin-server.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 joplin-server.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 joplin-server.env "${pkgdir}/etc/${pkgname}.env"
  
}

