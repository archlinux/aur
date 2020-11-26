# Maintainer: Alkindi42

pkgname=joplin-cli
pkgver=1.4.12
pkgrel=1
pkgdesc="An open source note taking and to-do application with synchronization capabilities"
arch=('x86_64')
depends=('nodejs>10' 'rsync')
source=(
  "${pkgname}.sh"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/${pkgname%-*}/archive/v${pkgver}.tar.gz"
)
makedepends=('npm' 'git')
conflicts=('joplin' 'joplin-beta')
url="https://joplinapp.org"
license=('MIT')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  sed -i '/"husky": ".*"/d' package.json
  rm -rf packages/app-mobile \
    packages/app-desktop \
    packages/app-clipper \
    packages/generator-joplin

  npm install

  # Install app-cli
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages/app-cli"
  npm run build
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages"

  install -d ${pkgdir}/usr/share/${pkgname}

  # App-cli
  cp -R app-cli/build "${pkgdir}/usr/share/${pkg_name}/app-cli"
  cp -R app-cli/node_modules "${pkgdir}/usr/share/${pkg_name}/app-cli"
  cp -R fork-htmlparser2 "${pkgdir}/usr/share/${pkg_name}"
  cp -R renderer "${pkgdir}/usr/share/${pkg_name}"
  cp -R lib "${pkgdir}/usr/share/${pkg_name}"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha256sums=('b5c621c425cdf0b5bb07bf0353939f6991a18db81955294a47ec42d0c5593438'
            'f3a5e8e910144a0cae265ea4082e6f69ee12ea550d296a7948ee5f80c38a28de')
