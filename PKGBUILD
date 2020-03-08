# Maintainer: Dario Giovannetti <info@dariogiovannetti.net>

pkgname=report-todo
pkgver=1.0.0
pkgrel=1
pkgdesc="Parse and report TODO, FIXME, BUG etc. comments in source code."
arch=('any')
url="https://github.com/kynikos/report-todo"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('b66bc4fda397ebcb694efc8208dfa2f4ad4f2a31869d3a2a560b9251f6610c23')

package() {
  npm install -g --only=production --user root --prefix "${pkgdir}/usr" \
    "${srcdir}/${pkgname}-${pkgver}.tgz" --cache "${srcdir}/npm-cache"

  # Non-deterministic race in npm gives 777 permissions to random directories
  # https://github.com/npm/npm/issues/9359
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of all files to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "../../../lib/node_modules/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
