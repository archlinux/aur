# Maintainer: Sphericalkat <aur@kat.bio>

pkgname=wheatley-cli
pkgver=0.4.0
pkgrel=1
pkgdesc='Self-hosted, always-on personal AI assistant: daemon, CLI, and dashboard'
arch=('any')
url='https://github.com/SphericalKat/wheatley'
license=('ISC')
depends=('nodejs>=26.13.1')
makedepends=('npm')
provides=('wheatley')
source=("https://github.com/SphericalKat/wheatley/releases/download/v${pkgver}/wheatley-ai-cli-${pkgver}.tgz")
noextract=("wheatley-ai-cli-${pkgver}.tgz")
sha256sums=('70894463dc649bec5b1c208f1552b26af76084e80ab17b225955944d9b50e302')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/wheatley-ai-cli-${pkgver}.tgz"

  # npm can leave directories world-writable and gives every file to the build user.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # npm can record the install prefix in package.json files.
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i "s|${pkgdir}||g"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/@wheatley-ai/cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
