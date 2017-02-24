# Maintainer: Maxim Baz <cerebro@maximbaz.com>
pkgname=cerebro-git
_pkgname=cerebro
pkgver=0.2.6.r16.g5b49175
pkgrel=1
pkgdesc='Open-source productivity booster with a brain.'
arch=('x86_64' 'i686')
url='https://cerebroapp.com/'
license=('MIT')
conflicts=('cerebro')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('gendesk' 'yarn')
provides=('cerebro')
source=('git://github.com/KELiON/cerebro.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/-/.r/;s/-/./g'
}

prepare() {
  gendesk -f -n --name=Cerebro --pkgname="${_pkgname}" --pkgdesc="${pkgdesc}" --exec="${_pkgname}" --categories="System"
}

build() {
  cd "${srcdir}/${_pkgname}"

  yarn && cd ./app && yarn && cd ../
  yarn run build

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
  install -d "${pkgdir}/usr/lib/${_pkgname}"
  if [ $CARCH == 'x86_64' ]; then
    cp -a "${srcdir}/${_pkgname}/release/linux-unpacked/"* "${pkgdir}/usr/lib/${_pkgname}"
  elif [ $CARCH == 'i686' ]; then
    cp -a "${srcdir}/${_pkgname}/release/linux-ia32-unpacked/"* "${pkgdir}/usr/lib/${_pkgname}"
  else
    echo "Unknown architecture"; exit 1;
  fi

  # Symlink main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Place desktop entry and icon
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${_pkgname}.desktop"
  for res in 16x16 32x32 48x48 128x128 256x256 512x512 1024x1024; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    install -Dm644 "${srcdir}/${_pkgname}/build/icons/${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${_pkgname}.png"
  done

  # Place license files
  for license in "LICENSE.electron.txt" "LICENSES.chromium.html"; do
    install -Dm644 "${pkgdir}/usr/lib/${_pkgname}/${license}" "${pkgdir}/usr/share/licenses/${_pkgname}/${license}"
    rm "${pkgdir}/usr/lib/${_pkgname}/${license}"
  done
}
