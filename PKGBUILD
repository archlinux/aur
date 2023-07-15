pkgname=gsender-bin
_pkgname=gsender
pkgver=1.2.2
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=('x86_64')
url="https://github.com/Sienci-Labs/${_pkgname}"
license=('GNU')
depends=("gtk3" "libnotify" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret")
optdepends=('libappindicator-gtk3')
source=("https://github.com/Sienci-Labs/${_pkgname}/releases/download/v${pkgver}/gSender_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/Sienci-Labs/${_pkgname}/master/LICENSE")
sha256sums=('2b7bd584cb9aded1650f861befb103a8d5b1b497477be7381cc96f25db8bbbf8'
            'fb4594571c8142643b5a121b585b8a218e450ee0c13446802480a5586106cec0')
conflicts=('gsender')

prepare() {
  [ -d data ] && rm -rf data
  mkdir data
  cd data
  for datatar in ../data.tar.*; do
     msg2 "Unpacking $datatar"
     tar -xf $datatar
  done
}

package(){
  cp -dr --no-preserve=ownership ./data/{opt,usr} "${pkgdir}"/
  install -d "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -sf '/opt/gSender/gsender' "${pkgdir}/usr/bin/gsender"
  chmod 4755 "${pkgdir}/opt/gSender/chrome-sandbox" || true
}

