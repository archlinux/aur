# Maintainer: Hao Long <aur@esd.cc>

pkgname=xxexploiter
pkgver=0.1.8
pkgrel=2
pkgdesc="A tool to help exploit XXE vulnerabilities"
arch=('any')
url="https://github.com/luisfontes19/xxexploiter"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "$url/raw/master/LICENSE.txt")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('d2f23cccc90acf23a577ca6fe31408777635b77fb7f6ea66088807fb132af2f0'
            '468dd4dfe7b77461bb2b644576ca2cec341e3387782dfd82e204b79502fb25b3')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
  
  install -Dm644 "$srcdir"/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
