# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=vercel-node
_pkgname=vercel
pkgver=59.11.7
pkgrel=1
_tarver=7.5.22
pkgdesc='Command-line interface for Vercel'
# x86_64 only: the resolved npm tree embeds platform-specific payloads for
# Vercel's native CLI, esbuild, NAPI keyring, oxc parser/transform, and rolldown.
# Add architectures only after validating each required prebuilt for that target.
arch=('x86_64')
url='https://vercel.com'
license=('Apache-2.0')
depends=('nodejs' 'glibc' 'gcc-libs')
makedepends=('npm')
optdepends=('python: local runtime emulation for @vercel/python and @vercel/fun')
provides=('vercel')
conflicts=('vercel')
options=('!strip')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('34432b6f0ddd6501ab17140dcf6c5baa2e68fa1ce91eabcb2afef4fbf4db44eb')

package() {
    local _stagedir="${srcdir}/${_pkgname}-${pkgver}-stage"

    rm -rf "${_stagedir}"
    mkdir -p "${_stagedir}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.tgz" \
        -C "${_stagedir}" \
        --strip-components 1

    # The published runtime tree still resolves vulnerable tar 7.5.7:
    # @vercel/fun pins it, while @mapbox/node-pre-gyp accepts it via ^7.4.0.
    # Keep the secure override applied to every dependency path.
    # Dev dependencies are temporarily removed because the published manifest
    # names private build-only packages. Restore them after resolving the
    # runtime tree, while retaining the override as installed package metadata.
    cp "${_stagedir}/package.json" "${_stagedir}/package.json.upstream"
    npm pkg delete devDependencies --prefix "${_stagedir}"
    npm pkg set "overrides.tar=${_tarver}" --prefix "${_stagedir}"
    npm install \
        --omit=dev \
        --no-audit \
        --no-fund \
        --ignore-scripts \
        --cache "${srcdir}/npm-cache" \
        --prefix "${_stagedir}"
    mv "${_stagedir}/package.json.upstream" "${_stagedir}/package.json"
    npm pkg set "overrides.tar=${_tarver}" --prefix "${_stagedir}"
    rm -f \
        "${_stagedir}/package-lock.json" \
        "${_stagedir}/node_modules/.package-lock.json"

    install -dm755 \
        "${pkgdir}/usr/bin" \
        "${pkgdir}/usr/lib/node_modules/vercel"
    cp -a "${_stagedir}/." "${pkgdir}/usr/lib/node_modules/vercel/"
    ln -s ../lib/node_modules/vercel/dist/vc.js "${pkgdir}/usr/bin/vercel"
    ln -s ../lib/node_modules/vercel/dist/vc.js "${pkgdir}/usr/bin/vc"
    # npm install may seed an etc/ directory with build-time paths inside
    # the prefix; it is not useful at runtime.
    rm -rf "${pkgdir}/usr/etc"

    # Install the upstream LICENSE (Apache-2.0) explicitly. The tarball is
    # kept un-extracted by `noextract` above, so pull it out on demand.
    bsdtar -xOf "${srcdir}/${_pkgname}-${pkgver}.tgz" package/LICENSE \
        > "${srcdir}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Drop user/group-writable bits that npm install sometimes leaves behind.
    chmod -R go-w "${pkgdir}/usr"
}
