# Maintainer: Sphericalkat <aur@kat.bio>

pkgname=wheatley-cli
_npmname=cli
pkgver=0.3.0
pkgrel=1
pkgdesc='Self-hosted, always-on personal AI assistant: daemon, CLI, and dashboard'
arch=('any')
url='https://github.com/SphericalKat/wheatley'
license=('ISC')
depends=('nodejs>=26.13.1')
makedepends=('npm')
provides=('wheatley')
source=("https://registry.npmjs.org/@wheatley-ai/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('be4aee1d92e41899f580845f79af8bbcd30c9de2977e780c37b731db048bf92d')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_npmname}-${pkgver}.tgz"

  # npm can leave directories world-writable and gives every file to the build user.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"

  # npm can record the install prefix in package.json files.
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i "s|${pkgdir}||g"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/@wheatley-ai/cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
