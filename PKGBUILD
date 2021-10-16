# Maintainer: JinguTech <xiuluo.android at gmail dot com>
# Contributor: Alkindi42
pkgname=joplin-beta
pkgver=2.5.1
pkgrel=1
pkgdesc="The latest pre-release - open source note taking and to-do application"
arch=('x86_64')
depends=('electron' 'gtk3' 'libexif' 'libgsf' 'libjpeg-turbo' 'libwebp' 'libxss' 'nodejs'
         'nss' 'orc' 'rsync' )
makedepends=('git' 'npm' 'python2' 'rsync' 'jq' 'electron')
optdepends=('libappindicator-gtk3: for tray icon')
source=(
  "${pkgname%-*}-desktop.sh" "${pkgname%-*}.sh" "${pkgname%-*}.desktop"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/${pkgname%-*}/archive/v${pkgver}.tar.gz"
)
conflicts=('joplin' 'joplin-desktop')
url="https://joplinapp.org"
license=('MIT')
sha256sums=('18cca699f52f884980646359631bb59a77d190b9f91e9e3e71efa62166772557'
            'b5c621c425cdf0b5bb07bf0353939f6991a18db81955294a47ec42d0c5593438'
            'b46dd772eb1adf9327f6c07657acf3c627c6ea204f8de3a4481efa6db0071f5e'
            'ecc91b10bd5775f0aed31666f58e8acd0eff9473782aeed0ea24b11483f98ca8')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  rm -rf packages/app-mobile
  npm install
  # Install app-cli
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages/app-cli"
  npm run build

  # Install app-desktop
  cd "${srcdir}/${pkgname%-*}-${pkgver}/packages/app-desktop"
  npm run dist --linux --64
}

package() {
  app_name=${pkgname%-*}
  cd "${srcdir}/${app_name}-${pkgver}/packages"

  install -d ${pkgdir}/usr/share/{${app_name},${app_name}-cli}

  # App-cli
  cp -R app-cli/build "${pkgdir}/usr/share/${app_name}-cli/app-cli"
  cp -R app-cli/node_modules "${pkgdir}/usr/share/${app_name}-cli/app-cli"
  cp -R renderer "${pkgdir}/usr/share/${app_name}-cli"


  # App-desktop
  cp -R app-desktop/dist/linux-unpacked/* "${pkgdir}/usr/share/${app_name}"

  install -Dm755 "${srcdir}/${app_name}-desktop.sh" "${pkgdir}/usr/bin/${app_name}-desktop"
  install -m755 "${srcdir}/${app_name}.sh" "${pkgdir}/usr/bin/${app_name}"

  install -Dm644 "${srcdir}/${app_name}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${app_name}"
}
