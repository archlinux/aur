# Maintainer: gee

pkgname=nkit
pkgver=1.3
pkgrel=1
pkgdesc='A Nintendo ToolKit that can Recover and Preserve Wii and GameCube disc images'
arch=('x86_64')
url='http://wiki.gbatemp.net/wiki/NKit'
license=('MIT')
depends=('mono')
source=("nkit-$pkgver.zip::https://gbatemp.net/download/nkit.36157/download?version=36555")
sha256sums=('21c50f45d0c930b488df176b7d3fda8b9986f32f32215f00dd22ab96ca698b12')

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
