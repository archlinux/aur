# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=paradox-launcher
pkgver=2023.3
pkgrel=1
epoch=1
pkgdesc="Paradox Interactive Game Launcher v2"
arch=('x86_64')
url="https://play.paradoxplaza.com/"
license=('custom')
depends=("libxi" "xdg-utils" "freetype2" "libgl" "gconf")
_source=https://launcher.paradoxinteractive.com/v2/paradox-launcher-installer-linux
source=(${pkgname}-${pkgver}.deb::${_source})
sha256sums=('75d5e39cde98d5b13f6d11ebe0d620ce4c54155d8a83b71bf8447594b2b3bd1d')

pkgver() {
  ADDR=$(curl -ILs -o /dev/null -w %{url_effective} ${_source});
  echo "$ADDR" | awk -F- '{print $4}' | awk -F. '{print $1}' | sed 's/_/./g';
}

package() {
  mkdir -p "${pkgdir}"/opt
  mkdir -p "${pkgdir}"/usr/bin

  cd "${srcdir}"
  tar -xzvf data.tar.gz

  cp -R "${srcdir}"/opt/* "${pkgdir}"/opt/ -R
  cp -R "${srcdir}"/usr/* ${pkgdir}/usr/ -R

  sed -i 's|Icon=Launcher|Icon=PDXLauncher|g' "${pkgdir}"/usr/share/applications/paradox-launcher-v2.desktop
  find "${pkgdir}"/usr/share/icons/ -type f -name "Launcher.png" -exec rename Launcher.png PDXLauncher.png {} \;

  ln -s /opt/Paradox\ Interactive/Paradox\ Launcher\ v2/dowser "${pkgdir}"/usr/bin/dowser
}
