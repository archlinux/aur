# Maintainer: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=nodejs-mjml3
pkgver=3.3.5
pkgrel=1
pkgdesc="Older version of MJML."
arch=("any")
url="https://mjml.io/"
license=("MIT")
depends=("nodejs")
conflicts=("nodejs-mjml")
makedepends=("npm")
source=(
    "https://registry.npmjs.org/mjml/-/mjml-$pkgver.tgz"
    "LICENSE.md"
)
noextract=("mjml-$pkgver.tgz")
sha256sums=(
    "7886932a1ae228a5ed1f62a68ca966dd144862370c52c60ceb144fce48210538"
    "0c4f37a6b1d7fdc8e2abb11cf49ba9dfe8128a4242861930d810f01f00ca4c49"
)

package() {
    # See https://wiki.archlinux.org/index.php/Node.js_package_guidelines#Using_npm

    npm install --user root --global --prefix "$pkgdir/usr" \
        "$srcdir"/mjml-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
