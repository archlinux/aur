# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=vercel-node
_pkgname=vercel
pkgver=59.10.0
pkgrel=1
_tarver=7.5.22
pkgdesc='Command-line interface for Vercel'
# x86_64 only: the npm tree pulls platform-specific native payloads for the
# Vercel CLI, esbuild, oxc-transform, and rolldown. Add other architectures
# only after verifying that every required helper has a matching prebuilt.
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
sha256sums=('a8c2a1048f0929df5599cf0e882bbd4e8c049ea1baa60b33c6952f0027a29c5f')

package() {
    local _stagedir="${srcdir}/${_pkgname}-${pkgver}-stage"

    rm -rf "${_stagedir}"
    mkdir -p "${_stagedir}"
    bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}.tgz" \
        -C "${_stagedir}" \
        --strip-components 1

    # The published runtime tree pins vulnerable tar 7.5.7 through
    # @vercel/fun and @mapbox/node-pre-gyp. Install from a temporary root
    # manifest so npm applies the security override to every dependency path.
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
