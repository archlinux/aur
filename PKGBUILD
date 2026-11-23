# Maintainer: Qingxu <me@linioi.com>

pkgname=yamlresume
pkgver=0.18.1
pkgrel=2
pkgdesc="Resumes as code in YAML"
arch=('any')
url="https://github.com/yamlresume/yamlresume"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('f5be97cd293c29d0f8786427c2072c1e3d9b0cf8913533061c094fe8c785da27')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Remove non-Linux prebuilt binaries from font-list so the arch=('any') package stays portable
    rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}/node_modules/font-list/libs/"{darwin,win32}

    # Fix ownership and permissions (npm may preserve build user uid/gid under fakeroot)
    chown -R root:root "${pkgdir}"
    chmod -R go-w "${pkgdir}/usr"

    # Remove references to $pkgdir
    find "${pkgdir}" -name 'package.json' -exec sed -i "s|${pkgdir}||g" {} \;

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
