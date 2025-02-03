# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="adb-wifi"
_commit_rel="63d54c0bcbcbaac9be9d9afd78a9390103318915" # 0.1.2
_commit="afa4bb3233f860033d34769b9bcc5fa859eb6c96" # r1
pkgver="0.1.2+r1+g${_commit::7}"
pkgrel=1
pkgdesc="A CLI tool which shows QR code and makes seamless connection to the ADB bridge"
arch=('any')
url="https://github.com/saleehk/${pkgname}"
license=('ISC')
depends=('android-tools' 'nodejs')
makedepends=('npm')
_pkgsrc="${pkgname}-${_commit}"
noextract=("${_pkgsrc}.tar.gz")
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('bc739397817f5ed66fc820141994b19c06868216627f1911fe733a8ed6ff83f5')

package() {
  cd "${srcdir}"
  npm install --cache "${srcdir}/npm-cache" -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgsrc}.tar.gz"

  # Non-deterministic race in npm gives 777 permissions to random directories
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "${pkgdir}"

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -vd "${pkgdir}/usr/share/doc/${pkgname}"
  ln -vsf "/usr/lib/node_modules/${pkgname}/readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
