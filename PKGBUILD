pkgname=gsender-bin
_pkgname=gsender
pkgver=1.4.1
pkgrel=1
pkgdesc="Connect to and control Grbl-based CNCs"
arch=('x86_64')
url="https://github.com/Sienci-Labs/${_pkgname}"
license=('GNU')
depends=("gtk3" "libnotify" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret")
optdepends=('libappindicator-gtk3')
makedepends=('debugedit')
source=("https://github.com/Sienci-Labs/${_pkgname}/releases/download/v${pkgver}/gSender-${pkgver}-Linux-Intel-64Bit.deb"
        "https://raw.githubusercontent.com/Sienci-Labs/${_pkgname}/master/LICENSE")
sha256sums=('3c4f2ffa975723d4e811c734fae0eb86d7c7cc853239bdb46bff46525113a3e9'
            'fb4594571c8142643b5a121b585b8a218e450ee0c13446802480a5586106cec0')
conflicts=('gsender')
provides=('gsender')
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

