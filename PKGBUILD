# Contributor: Gergely Imreh <gergely at imreh dot net>
# Maintainer: Gergely Imreh <gergely at imreh dot net>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=3.47.2
pkgrel=2
arch=('x86_64' 'aarch64' 'armv7h')
url='http://particle.io/'
license=('Apache-2.0')
depends=('libusb' 'udev' 'nodejs>=22' 'libxml2-legacy' 'openssl')
makedepends=('npm' 'git' 'python')
optdepends=('dfu-util: local flashing')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
md5sums=('0b6e9b6b49de3deca29828476dd57d7e')
sha256sums=('3deb0c722eaa612ecc8d36cc1364c8b3347c900c9397be797a06dcd8079e4c4d')
b2sums=('3024e074bb6b38a1e23d0421eb0d5794dfec590d182fc213f893b71233a4b9bd638adb0ef7d1c91274683a8508a3321f1d9daa978c5598ee124bd2e98b4e73aa')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
  sed -i 's|, GROUP="plugdev", MODE="0666"|, TAG+="uaccess"|g' "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules"
  install -D -m644 "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules" "${pkgdir}/etc/udev/rules.d/50-particle.rules"
  rm `find "${pkgdir}/" -name '.deps'` -rf

  # Remove unsupported architectures
  rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/qdl/darwin"
  rm -rf "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/qdl/win32"
  # TODO: remove unneeded prebuilt libraries as well
}
