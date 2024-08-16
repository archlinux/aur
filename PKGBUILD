# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="adb-wifi"
pkgver=0.1.2
pkgrel=1
pkgdesc="A CLI tool which shows QR code and makes seamless connection to the ADB bridge"
arch=('any')
url="https://github.com/saleehk/${pkgname}"
license=('custom:None')
makedepends=('npm')
depends=('nodejs')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tgz::https://registry.npmjs.org/${pkgname}/-/${_pkgsrc}.tgz")
noextract=("${_pkgsrc}.tgz")
sha256sums=('7e96f443a6a4eb39bd5881beb9476c0c0f4d19759935131fe56d79d67a44e43a')

package() {
  cd "${srcdir}"
  npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgsrc}.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "${pkgdir}"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "${pkgdir}/usr/lib/node_modules/${pkgname}/readme.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
