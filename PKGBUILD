# Maintainer: yobson <aur@yobson.xyz>
pkgname=stremio-web
pkgver=5.0.0_beta.43
pkgrel=1
pkgdesc="Stremio web client frontend"
arch=('x86_64')
url="https://github.com/Stremio/$pkgname"
license=('GPL-2.0-only')
depends=('nodejs')
makedepends=('nvm' 'pnpm' 'esbuild')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('957376d1a7934701f57a636c264ed6b2afa27238a2148d1909d77fe9f41a498d')

# https://wiki.archlinux.org/title/Node.js_package_guidelines#Using_nvm
_ensure_local_nvm() {
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    # patch webpack config to use pkgver instead of a commit hash
    # since our source is just a tarball, not a git repo
    sed -i "s|execSync('git rev-parse HEAD').toString().trim()|'${pkgver}-${pkgrel}-AUR'|" webpack.config.js
    # patch http_server.js to use where stremio-web is to be installed
    sed -i "s|path.resolve(__dirname, 'build')|'/usr/share/stremio-web'|" http_server.js

    _ensure_local_nvm
    nvm install
    pnpm clean-install
    pnpm install express@4 # https://github.com/Stremio/stremio-web/blob/development/Dockerfile#L30
}

build() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    _ensure_local_nvm
    pnpm run build
    esbuild http_server.js --bundle --platform=node --outfile=stremio-web-server.js
}

package() {
    cd "$srcdir/$pkgname-${pkgver//_/-}"

    install -d "$pkgdir/usr/share/stremio-web"
    cp -r build/* "$pkgdir/usr/share/stremio-web/"
    install -Dm755 stremio-web-server.js "$pkgdir/usr/bin/stremio-web"
}
