# Maintainer: Maxim Baz <cerebro@maximbaz.com>
pkgname=cerebro
pkgver=0.2.6
pkgrel=1
pkgdesc='Open-source productivity booster with a brain.'
arch=('x86_64' 'i686')
url='https://cerebroapp.com/'
license=('MIT')
conflicts=('cerebro-git')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('gendesk' 'npm')
provides=('cerebro')
source=("${pkgver}.tar.gz::https://github.com/KELiON/cerebro/archive/"$pkgver".tar.gz")
sha256sums=('0becadc20e50a3e83c58c7cb3e07443724189f7002368b59629befb654145c5b')

prepare() {
  gendesk -f -n --name=Cerebro --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --exec="${pkgname}" --categories="System"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  npm install && cd ./app && npm install && cd ../
  npm run build

  if [ $CARCH == 'x86_64' ]; then
    node_modules/.bin/build --linux --x64 --dir
  elif [ $CARCH == 'i686' ]; then
    node_modules/.bin/build --linux --ia32 --dir
  else
    echo "Unknown architecture"; exit 1;
  fi
}

package() {
  # Place files
  install -d "${pkgdir}/usr/lib/${pkgname}"
  if [ $CARCH == 'x86_64' ]; then
    cp -a "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/"* "${pkgdir}/usr/lib/${pkgname}"
  elif [ $CARCH == 'i686' ]; then
    cp -a "${srcdir}/${pkgname}-${pkgver}/release/linux-ia32-unpacked/"* "${pkgdir}/usr/lib/${pkgname}"
  else
    echo "Unknown architecture"; exit 1;
  fi

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${pkgname}.desktop"
  for res in 16x16 32x32 48x48 128x128 256x256 512x512 1024x1024; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
  done

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${pkgname}/${license}" "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${pkgname}/${license}"
  done
}
