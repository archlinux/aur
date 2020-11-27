# Maintainer: Alkindi42

pkgname=joplin-cli
pkgver=1.4.15
pkgrel=1
pkgdesc="An open source note taking and to-do application with synchronization capabilities"
arch=('x86_64')
depends=('nodejs>10' 'rsync')
source=(
  "${pkgname%-*}.sh"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/${pkgname%-*}/archive/v${pkgver}.tar.gz"
)
makedepends=('npm' 'git')
conflicts=('joplin' 'joplin-beta')
url="https://joplinapp.org"
license=('MIT')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  sed -i '/"husky": ".*"/d' package.json

  rm -rf packages/app-clipper \
    packages/app-desktop \
    packages/app-mobile \
    packages/generator-joplin

  npm install

  for package in $(ls -1 packages);
  do
    cd "${srcdir}/${pkgname%-*}-${pkgver}/packages/${package}"
    (cp -r node_modules/@joplin . 2> /dev/null && rm -rf node_modules/@joplin 2> /dev/null) || true
    npm prune --production
    mv -f @joplin node_modules 2> /dev/null || true
  done
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages"

  install -d ${pkgdir}/usr/share/${pkgname}

  # App-cli
  cp -R app-cli/app "${pkgdir}/usr/share/${pkgname}/app-cli"
  cp -R app-cli/node_modules "${pkgdir}/usr/share/${pkgname}/app-cli"
  cp -R fork-htmlparser2 "${pkgdir}/usr/share/${pkgname}"
  cp -R renderer "${pkgdir}/usr/share/${pkgname}"
  cp -R lib "${pkgdir}/usr/share/${pkgname}"

  install -Dm755 "${srcdir}/${pkgname%-*}.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha256sums=('b5c621c425cdf0b5bb07bf0353939f6991a18db81955294a47ec42d0c5593438'
            '946d1874b368fd490e7867df6060e93ab0de6318b7b49f61e697ceb5cb34fb7f')
