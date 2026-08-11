# Maintainer: Ismet Togay <ismet.togay@gmail.com>
pkgname=taste
pkgver=1.0.1
pkgrel=2
pkgdesc='CLI to manage CommandCode preferences'
arch=('x86_64')
url='https://commandcode.ai'
license=('Apache-2.0')
depends=('nodejs' 'command-code')
makedepends=('npm')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('f6d3f5d886ef4c56122ee66c1dbea9a771c2d4b5af94bac3121c38b05f0cdeea')

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Replace npm-installed symlink with wrapper that sets npm_config_prefix
    # so npx can find command-code installed via pacman/AUR
    rm "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/bash
export npm_config_prefix=/usr
exec node /usr/lib/node_modules/taste/dist/index.mjs "$@"
WRAPPER
}
