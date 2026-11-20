# Maintainer: fenuks

pkgname=sql-formatter
pkgver=15.10.0
pkgrel=1
pkgdesc="A whitespace formatter for different query languages"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/sql-formatter-org/sql-formatter"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('09fc210ee3debd505ab869a40eed27495fb66976abc57dc946e15557ea4a8d96')
options=('!emptydirs')
provides=("${pkgname}")
conflicts=("${pkgname}")

package() {
   cd "${srcdir}"

   npm install \
       --cache "${srcdir}/npm-cache" \
       --global \
       --prefix "${pkgdir}/usr" \
       "${pkgname}@${pkgver}"

   # Non-deterministic race in npm gives 777 permissions to random directories.
   # See https://github.com/npm/npm/issues/9359 for details.
   find "${pkgdir}/usr" -type d -exec chmod 755 {} +

   # npm gives ownership of ALL FILES to build user
   # https://bugs.archlinux.org/task/63396
   chown -R root:root "${pkgdir}"
}
