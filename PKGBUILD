# Maintainer: Hao Long <aur@esd.cc>

pkgname=rekcod
pkgver=3.0.0
pkgrel=2
pkgdesc="docker inspect → docker run"
arch=('any')
url="https://github.com/nexdrew/rekcod"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "$url/raw/master/LICENSE")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('b15c90ef1628af8250b983eace84c4ddc6da4f45850a2c471a125d0580f5ec9c'
            '852bf81203aa93aa89afc9f881ebb035322dc7334aaceff435c557634c94a815')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
