# Maintainer: Brandon Verkamp <jadelclemens+aur@jadelclemens.xyz>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matteo Parolari
# Contributor: gardar <aur@gardar.net>

pkgname=joplin-server
pkgver=3.6.14
pkgrel=1
pkgdesc="Joplin Server for self-hosting Joplin Notes"
url="https://github.com/laurent22/joplin/tree/v${pkgver}/packages/server"
license=('Custom')
#install="joplin.install"
backup=('etc/joplin-server.env')
depends=('nodejs>=20.15.0' 'nss' 'rsync' 'pm2')
arch=('x86_64' 'i686')
makedepends=('git' 'npm' 'yarn' 'python' 'rsync' 'jq' 'yq' 'libgsf' 'node-gyp>=9.4.1' 'python-setuptools' 'cairo' 'pango' 'libjpeg-turbo' 'giflib' 'librsvg')
options=('!strip')
source=(
"joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/refs/tags/v${pkgver}.tar.gz"
'joplin-server.service' 'joplin-server.sysusers' 'joplin-server.tmpfiles' 'joplin-server.env')
md5sums=('2173a5a64f8d7ea34e2ac0cf32d5db0b'
         '8bf105dd516b2e7bd3a8f5e8b5e5551f'
         '08359a65347818382a243a206828f1fa'
         '2534609cd0b3b9cbc6239205e73c9505'
         'd7149c893f95f87f65b9f9b2817909fe')


prepare() {
  msg2 "Deleting Unnecessary Packages"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-desktop"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-mobile"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-clipper"
  rm -r "${srcdir}/joplin-${pkgver}/packages/app-cli"
  msg2 "Remove onenote-converter from package.json - not used for Server"
  sed --in-place '/onenote-converter/d' "${srcdir}/joplin-${pkgver}/packages/lib/package.json"
}


build() {
    cd "${srcdir}/joplin-${pkgver}"

    export NODE_ENV=production
    export BUILD_SEQUENCIAL=1
    # Otherwise we can get a build failure on systems with libvips installed
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1 
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
    msg2 "Copy Node packages to ${pkgname} package"
    mkdir -p "${pkgdir}/opt/joplin-server/"
    cd "${srcdir}/joplin-${pkgver}/packages/"
    cp -r fork-htmlparser2 fork-sax fork-uslug htmlpack lib renderer server tools turndown turndown-plugin-gfm utils "${pkgdir}/opt/joplin-server/"

    msg2 "Fixing Directories Permissions"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/opt" -type d -exec chmod 755 {} +

    msg2 "Removing References to \$pkgdir"
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "/_where/d"
    
    cd "${srcdir}"
    install -Dm644 "${srcdir}/joplin-${pkgver}/packages/server/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 joplin-server.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 joplin-server.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 joplin-server.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 joplin-server.env "${pkgdir}/etc/${pkgname}.env"
  
}

