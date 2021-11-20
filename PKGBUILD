# Maintainer: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt-bin
pkgver=8.3.0
pkgrel=1
pkgdesc="PeaZip file manager and archiver (Qt5)"
arch=('x86_64')
url='https://peazip.github.io'
license=('LGPL3')
depends=('qt5pas')
options=('!emptydirs')
optdepends=('p7zip: Command-line file archiver with high compression ratio'
            'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
            'arc: Arc file archiver and compressor'
            'zpaq: Programmable file compressor, library and utilities'
            'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
            'upx: Extendable, high-performance executable packer for several executable formats')
provides=('peazip')
conflicts=('peazip-gtk2-bin' 'peazip-qt5' 'peazip-qt5-bin')
source=("https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip-${pkgver}.LINUX.Qt5-1.x86_64.rpm")
sha256sums=('d67bd88040d70f350360aff156e049143f091997f5afe0294eac70fb19cbca18')
changelog=changelog.txt

prepare() {
  rm -r usr/lib/.build-id
  rm usr/lib/libQt5Pas.so.1
  rm usr/lib/peazip/libQt5Pas.so.1
  # 7z.sfx is a Windows executable
  rm usr/lib/peazip/res/bin/7z/7z.sfx

  local sharedUsr=usr/share
  local sharedPeaZip="${sharedUsr}/peazip"
  rm "${sharedPeaZip}/readme/readme_Windows.txt"
  rm "${sharedPeaZip}/batch/"*.bat
  rm -r "${sharedPeaZip}/batch/SendTo"
  rm -r "${sharedPeaZip}/batch/freedesktop_integration/KDE-servicemenus/KDE3-konqueror"

  # setting correct permissions
  chmod 755 usr && chmod 755 usr/bin
  chmod 755 usr/lib && chmod 755 usr/lib/peazip
  chmod 755 usr/lib/peazip/res && chmod -R 755 usr/lib/peazip/res/bin
  chmod -x usr/lib/peazip/res/bin/7z/*.so
  chmod -x usr/lib/peazip/res/bin/7z/Codecs/*.so
  chmod 755 "${sharedUsr}"
  for subDir in "${sharedUsr}"/*; do chmod 755 "${subDir}"; done
  chmod 755 "${sharedUsr}/doc/peazip"
  for subDir in "${sharedPeaZip}"/*; do
    if [ -d "${subDir}" ]; then
      chmod 755 $(find "${subDir}" -type d)
    fi
  done
}

package() {
  mkdir "${pkgdir}/usr"
  cp -aR usr/bin/ "${pkgdir}/usr"
  cp -aR usr/lib/ "${pkgdir}/usr"
  cp -aR usr/share/ "${pkgdir}/usr"
}
