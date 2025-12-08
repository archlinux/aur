# Based on the file created by the Manjaro Team:
# Maintainer: Philip Müller <philm[AT]manjaro[DOT]org>
# Contributor: Helmut Stult <helmut[AT]manjaro[DOT]org>
# Contributor: Steven Seifried <gitlab@canox.net>

# Maintainer: sukanka <su975853527 [AT] gmail [DOT] com>

pkgname=tuxedo-control-center
pkgver=2.1.21
pkgrel=1
pkgdesc="A tool to control performance, energy, fan and comfort settings on TUXEDO laptops. (With system-wide electron) "
arch=(x86_64)
url="https://github.com/tuxedocomputers/tuxedo-control-center"
license=('GPL3')
_electron='electron39'
depends=(
  # 'tuxedo-drivers-dkms'
  ${_electron}
  python
)
makedepends=('npm' 'git'
  'openssh'
)
options=('!strip' '!debug')
install=${pkgname}.install

source=(
  ${url}/archive/refs/tags/v${pkgver}.tar.gz
  tuxedo-control-center.install
  tuxedo-control-center.sh
)
sha256sums=('8e6e0375526fce38fa78d623935e20444cfbb871ac7ee1f792dd5c331dc6b320'
            'fef8f708ff4ba19921f167ff9bffd2536cc0c128dfe418a30f7e5e0d04fca6e3'
            '6c393c72100131320be982b52124cda0a56f1f49b9f45b41ab1efb02ade250b7')
sha512sums=('13645c53f6074524e24df7d40637b1dad1f8d308bc42d641de0c5ec7fe6f4904da1ae0075cd6055b5330666be2bae739fe1bf0dbdb4d8d4e36cb249016afab3a'
            'b70d3412f07c72d6de2cf18e75a184741d8f5db7f144c4d8e8c0dde752e197d831fc8f8b6c095c9b6387ff97b36567f9cf5167dbb23ebc392f7b3cc47a78111a'
            '344dd01d332f1288388502c8436728153daa9db974623cd1ad5c340ef21c28a55e23fc139ec25eee1f422eb97d4793d24b9f89010210979ec7bcfc630a6599d6')

_patch() {
  cd "${srcdir}/${pkgname}-${pkgver}"/src/dist-data
  sed -i tccd.service \
    -e "s|^ExecStart.*|ExecStart=/usr/lib/$pkgname/data/service/tccd  --start|g" \
    -e "s|^ExecStop.*|ExecStop=/usr/lib/$pkgname/data/service/tccd  --stop|g"
  sed -i tuxedo-control-center-tray.desktop \
    -e "s|^Exec=.*|Exec=$pkgname --tray|g"
  sed -i tuxedo-control-center.desktop \
    -e "s|^Exec=.*|Exec=$pkgname %U|g" \
    -e "s|^Icon=.*|Icon=$pkgname|g"
  sed -i "${srcdir}/${pkgname}-${pkgver}"/src/udev/99-webcam.rules \
    -e "s|/opt/tuxedo-control-center/resources/dist/|/usr/lib/|g"
}
prepare() {
  sed -i "s|__ELECTRON__|${_electron}|g" "${pkgname}.sh"

  # keep for future, now we have to build with electron13, but use electron38 at runtime

  # cd "${srcdir}/${pkgname}-${pkgver}"
  # local electronDist="/usr/lib/${_electron}"
  # local electronVersion="$(<$electronDist/version)"

  # jq ".devDependencies.electron = \"$electronVersion\"" package.json |
  #   jq ".build.electronDist = \"$electronDist\"" |
  #   jq ".build.electronVersion = \"$electronVersion\"" |
  #   sponge package.json

  (
    _patch
  )
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export NODE_OPTIONS=--openssl-legacy-provider
  npm install
  npm run build
  cd dist/${pkgname}
  npm install tslib dbus-next rxjs node-ble xliff
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/src/dist-data
  install -Dm644 tuxedo-control-center{,-tray}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 tuxedo-control-center_256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 tuxedo-control-center_256.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -Dm644 com.tuxedocomputers.{tccd,tomte}.policy -t "${pkgdir}/usr/share/polkit-1/actions"
  install -Dm644 com.tuxedocomputers.tcc.metainfo.xml -t "${pkgdir}/usr/share/metainfo"

  install -Dm644 "com.tuxedocomputers.tccd.conf" -t "${pkgdir}/usr/share/dbus-1/system.d"
  install -Dm644 tccd{,-sleep}.service -t "${pkgdir}/usr/lib/systemd/system"

  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r dist/${pkgname} "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "src/udev/99-webcam.rules" -t "${pkgdir}/usr/lib/udev/rules.d"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
