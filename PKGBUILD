# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=langfuse-cli
pkgver=1.2.4
pkgrel=1
pkgdesc="Interact with Langfuse API from the command line"
arch=('any')
url="https://github.com/langfuse/langfuse-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7b63fcc9b1d0fe963c57af00b9e8c31eb89fbedeecbeeb5c21e80a4a91e91c80')
options=('!strip')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    # Install license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s ../../../lib/node_modules/$pkgname/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
