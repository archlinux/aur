# Contributor: Xunhua Guo <xunhua.guo@gmail.com>

_npmname=nodeppt
pkgname=nodejs-nodeppt
pkgver=2.2.2
pkgrel=1
pkgdesc="A simple, in-browser, markdown-driven presentation framework"
arch=('any')
url="https://github.com/ksky521/nodeppt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=("32c42ef86f7b97c672022a0f4d54bba1a420bf100ea50a9e99769ccf4d4a9110")

package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" $_npmname@$pkgver

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
