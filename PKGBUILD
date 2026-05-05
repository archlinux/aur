# Maintainer: rako <m@rako.space>

pkgname=dxfl
pkgver=0.7.0
pkgrel=1
pkgdesc="A CLI tool to manage your Deuxfleurs account."
arch=('any')
url="https://www.npmjs.com/package/dxfl"
license=('EUPL')
depends=('nodejs')
makedepends=('npm')
source=("https://git.deuxfleurs.fr/Deuxfleurs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c2770398a0ac8f915c00b7305a66f19020d176ba5c2e676fe60de43d1e1a12d28bc2092fef4a998ab24d6c2b5c2f20b92907dd6f9792934b8d852ddf1faa9377')

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
