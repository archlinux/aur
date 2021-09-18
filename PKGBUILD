# Maintainer: Vladimir Svyatski <vsvyatski@yandex.ru>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>
# Contributor: Jamesjon <universales@protonmail.com>

pkgname=peazip-qt-bin
pkgver=8.2.0
pkgrel=2
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
sha256sums=('d4b6e56eb7f12f8e7338e0ebeb749a9f61d9c1ca28577bde6a91f5190a0df020')

package() {
  # preparing /usr/**/* files for installation
  mkdir "${pkgdir}/usr"
  cp -aR usr/bin/ "${pkgdir}/usr"
  cp -aR usr/share/ "${pkgdir}/usr"

  # preparing /opt/peazip/* files for installation
  local peazipDest="${pkgdir}/opt/peazip"
  mkdir -p "${peazipDest}"
  install -m 644 opt/peazip/*.txt "${peazipDest}" # copying *.txt files and removing executable flag from them
  cp opt/peazip/*.pdf "${peazipDest}/"
  cp opt/peazip/peazip "${peazipDest}/"
  
  # preparing /opt/peazip/res/**/* files for installation
  mkdir "${peazipDest}/res"
  cd opt/peazip/res
  install pea rnd "${peazipDest}/res"
  install -m 644 altconf.txt "${peazipDest}/res" # copying altconf.txt and removing executable flag from it
  for resSubDir in */; do # looping through all directories in "res" except "batch"
    if [ "${resSubDir}" = "batch/" ]; then continue; fi
    cp -aR ${resSubDir} "${peazipDest}/res"
    if [ -f "${peazipDest}/res/${resSubDir}note.txt" ]; then
      chmod 644 "${peazipDest}/res/${resSubDir}note.txt" # removing executable flag from note.txt
    fi
  done

  # let's take care of "batch"
  mkdir "${peazipDest}/res/batch"
  cp batch/*.sh "${peazipDest}/res/batch"
  cp -aR batch/freedesktop_integration "${peazipDest}/res/batch"
  cd -
}
