# Maintainer: Alkindi42

pkgname=joplin-beta
pkgver=1.2.4
pkgrel=1
pkgdesc="The latest pre-release - open source note taking and to-do application"
arch=('x86_64')
depends=('nodejs>10' 'nss' 'gtk3' 'libxss' 'libsecret' 'rsync' 'libgsf' 'libexif' 'libcroco')
source=(
  "${pkgname%-*}-desktop.sh" "${pkgname%-*}.sh" "${pkgname%-*}.desktop"
  "${pkgname}-${pkgver}.tar.gz::https://github.com/laurent22/${pkgname%-*}/archive/v${pkgver}.tar.gz"
)
makedepends=('npm' 'git')
optdepends=('libappindicator-gtk3: for tray icon')
conflicts=('joplin')
replaces=('joplin')
url="https://joplinapp.org"
license=('MIT')
sha256sums=('fdda15d7eba2a8ab9a0f10191fc2a3cc9e92ab43b5a48ecf12d29672c48819dc'
            '1c72d30d468c532f272c9a574a0a0f96f50aeb68fdde364ebac780f951a34c83'
            'b46dd772eb1adf9327f6c07657acf3c627c6ea204f8de3a4481efa6db0071f5e'
            'c530d7a3a26af171d561264e78c03a142089da376868d9478fa5fa7abb02ac70')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  npm install

  # Install CliClient
  cd "${srcdir}/${pkgname%-*}-${pkgver}/CliClient"
  npm install

  # Install ElectronClient
  cd "${srcdir}/${pkgname%-*}-${pkgver}/ElectronClient"
  npm install
  npm run dist
}

package() {
  app_name=${pkgname%-*}
  cd "${srcdir}/${app_name}-${pkgver}"

  install -d ${pkgdir}/usr/share/{${app_name},${app_name}-cli}

  # CliClient
  cp -R CliClient/build/* "${pkgdir}/usr/share/${app_name}-cli"
  cp -R CliClient/node_modules "${pkgdir}/usr/share/${app_name}-cli"
  # ElectronClient
  cp -R ElectronClient/dist/linux-unpacked/* "${pkgdir}/usr/share/${app_name}"

  install -Dm755 "${srcdir}/${app_name}-desktop.sh" "${pkgdir}/usr/bin/${app_name}-desktop"
  install -m755 "${srcdir}/${app_name}.sh" "${pkgdir}/usr/bin/${app_name}"

  install -Dm644 "${srcdir}/${app_name}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${app_name}"
}
