# Maintainer: Gyara <laxect39@gmail.com>

pkgname=beancount-language-server-git
_pkgname=beancount-language-server
_npmname=beancount-langserver
pkgver=r89.73bfbd1
pkgrel=1
pkgdesc="A Language Server Protocol (LSP) for beancount files"
arch=('any')
url="https://github.com/polarmutex/beancount-language-server"
conflicts=('beancount-language-server')
provides=('beancount-language-server')
license=('MIT')
depends=('nodejs' 'python' 'beancount')
makedepends=('npm' 'git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    npm install
    npm run compile
    npm prune --production
}

package() {
    local _npmdir="${pkgdir}/usr/lib/${_pkgname}"

    cd "${srcdir}/${_pkgname}"
    install -Ddm755 "${_npmdir}"
    cp -r --no-preserve=ownership out node_modules package.json tree-sitter-beancount.wasm python "${_npmdir}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    install -Ddm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/out/cli.js" "${pkgdir}/usr/bin/${_npmname}"
    chmod 755 "${pkgdir}/usr/lib/${_pkgname}/out/cli.js"
}
