# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=vercel-node
_pkgname=vercel
pkgver=59.9.1
pkgrel=1
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
sha256sums=('585f8fe39acb7bed3c8fe5a1595adbbaf6c6f46989c3a2ec81704b70d7680a05')

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
        --ignore-scripts \
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
