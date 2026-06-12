# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=vercel-node
_pkgname=vercel
pkgver=54.12.2
pkgrel=1
pkgdesc='Command-line interface for Vercel'
# x86_64 only: the npm tree pulls native ELF helpers (esbuild, oxc-transform,
# rolldown, sandbox/pty-server) that are platform-specific. Add other arches
# only after verifying that every native helper has a matching prebuilt.
arch=('x86_64')
url='https://vercel.com'
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=('python: local runtime emulation for @vercel/python and @vercel/fun')
provides=('vercel')
conflicts=('vercel')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('a2579daa10508398aa4458acb3aba0c176242821813fbfc7542a9d00a2e2f070')

package() {
    # Install the published tarball globally into $pkgdir. npm fetches the
    # runtime dependencies from the registry and lays the package out at:
    #   $pkgdir/usr/lib/node_modules/vercel
    # with bin symlinks at $pkgdir/usr/bin/{vercel,vc}.
    npm install \
        --global \
        --omit=dev \
        --no-audit \
        --no-fund \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

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
