# Maintainer: rako <m@rako.space>

pkgname=dxfl
pkgver=0.6.1
pkgrel=1
pkgdesc="A CLI tool to manage your Deuxfleurs account."
arch=('any')
url="https://www.npmjs.com/package/dxfl"
license=('EUPL')
depends=('nodejs')
makedepends=('npm')
source=("https://git.deuxfleurs.fr/Deuxfleurs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a51842aadbaa932d47322a87df2f7556d941a754d7c2a9b1bea5c60e2f6d7bbd7d86fd0fe2eb47a5dbecfeda922cc5f1299451f4be387e3b5753a6e1adba5d9c')

prepare() {
	npm pack dxfl
}

package() {
  npm install -g --prefix "${pkgdir}/usr" $pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
