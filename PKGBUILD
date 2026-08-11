# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
pkgname=taste
pkgver=1.0.1
pkgrel=4
pkgdesc='CLI to manage CommandCode preferences'
arch=('x86_64')
url='https://commandcode.ai'
license=('Apache-2.0')
depends=('nodejs' 'command-code')
makedepends=('npm')
options=(!strip)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('f6d3f5d886ef4c56122ee66c1dbea9a771c2d4b5af94bac3121c38b05f0cdeea')

package() {
    cd "${srcdir}/package"

    # taste delegates to command-code via npx at runtime (AUR package);
    # the bundled copy is never imported - drop it to avoid shipping ~200 dead deps
    jq 'del(.dependencies["command-code"])' package.json > pkg.json.tmp
    mv pkg.json.tmp package.json
    npm install --omit=dev \
        --cache "${srcdir}/npm-cache" \
        --no-audit --no-fund --no-progress --loglevel=error
    rm -f package-lock.json

    mkdir -p "${pkgdir}/usr/lib/node_modules"
    cp -a . "${pkgdir}/usr/lib/node_modules/${pkgname}"

    # Replace npm-installed symlink with wrapper that sets npm_config_prefix
    # so npx can find command-code installed via pacman/AUR
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'WRAPPER'
#!/bin/bash
export npm_config_prefix=/usr
exec node /usr/lib/node_modules/taste/dist/index.mjs "$@"
WRAPPER
}
