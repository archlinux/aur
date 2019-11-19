# Maintainer: gee

pkgname=nkit
pkgver=1.4
pkgrel=1
pkgdesc='A Nintendo ToolKit that can Recover and Preserve Wii and GameCube disc images'
arch=('x86_64')
url='http://wiki.gbatemp.net/wiki/NKit'
license=('MIT')
depends=('mono')
source=("nkit-$pkgver.zip::https://gbatemp.net/download/nkit.36157/download?version=36607")
sha256sums=('e600b0a2dbacf784779ce33b01259f197c5f8cfc7135f1831160d3f98bb431c6')

prepare() {
  cd "${srcdir}"
  sed -i 's|%exe\\Processed|~/.local/share/NKit/Processed|' NKit.dll.config
  sed -i 's|%exe\\Recovery|~/.local/share/NKit/Recovery|' NKit.dll.config
  sed -i 's|key="WaitForKeyAfterProcessing" value="true"|key="WaitForKeyAfterProcessing" value="false"|' NKit.dll.config
  sed -i 's|key="NkitFormat" value="gcz"|key="NkitFormat" value="iso"|' NKit.dll.config
  sed -i 's|key="MaskRename" value="true"|key="MaskRename" value="false"|' NKit.dll.config
}

package() {
  install -m755  -d "${pkgdir}/usr/lib/nkit"
  mv "${srcdir}"/* "${pkgdir}/usr/lib/nkit/"
  rm "${pkgdir}/usr/lib/nkit/nkit-$pkgver.zip"
  cd "${pkgdir}/usr/lib/nkit"
  install -m755 -d "${pkgdir}/usr/bin"
  for exe in *exe;
  do
    echo "mono /usr/lib/nkit/$exe \"\$@\"" > "${pkgdir}/usr/bin/${exe:0:-4}"
    chmod 755 "${pkgdir}/usr/bin/${exe:0:-4}"
  done
}
