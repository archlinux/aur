# Maintainer: Yvaniak <Yvaniak 11 at gmail dot com>
# Contributor: Vladimir Svyatski <vsvyatski@yandex.ru>
# Previous Maintainer: Edoardo Brogiolo <edoardo@brogiolo.eu>
# Previous Maintainer: Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: gspu <bssbk2455@gmail.com>
# Previous Maintainer: Uncle Hunto <unclehunto@yahoo.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-gtk2-bin
pkgver=9.7.0
pkgrel=1
pkgdesc='PeaZip file manager and archiver (GTK 2)'
arch=('x86_64')
url='https://peazip.github.io'
license=('LGPL-3.0-or-later')
depends=('gtk2')
options=('!emptydirs')
optdepends=('p7zip: Command-line file archiver with high compression ratio'
            'quad: High-performance file compressor that utilizes an advanced LZ-based compression algorithm'
            'arc: Arc file archiver and compressor'
            'zpaq: Programmable file compressor, library and utilities'
            'paq8o: PAQ8 series of archivers, resurrected by new maintainers'
            'upx: Extendable, high-performance executable packer for several executable formats')
provides=('peazip')
conflicts=('peazip-qt-bin' 'peazip-qt5' 'peazip-qt5-bin')
source=("https://github.com/peazip/PeaZip/releases/download/${pkgver}/peazip-${pkgver}.LINUX.GTK2-1.${CARCH}.rpm")
sha256sums=('9942d64e43da70a0ecbf7d7aa46c396c8ef94781c80e5de4aa876bcdc8ca08e9')
changelog=changelog.txt

prepare() {
  # Senior Giorgio Tani should definitely reconsider the way he builds his Linux packages: he adds a lot of
  # unnecessary Windows-related files to them. Additionally, he sets wrong permissions on folders: the majority
  # of them are set to 777, whereas it should be 755. So here I'm removing Windows files and setting the
  # appropriate permissions before packaging.

  rm -r usr/lib/.build-id
  # 7z.sfx is a Windows executable
  rm usr/lib/peazip/res/bin/7z/7z.sfx

  local sharedUsr=usr/share
  local sharedPeaZip="${sharedUsr}/peazip"
  # Windows related stuff
  rm -r "${sharedPeaZip}/batch/Windows"
  rm -r "${sharedPeaZip}/batch/bat"

  # macOS related stuff
  rm -r "${sharedPeaZip}/batch/macOS service menus"

  # KDE 3? You must be kidding.
  rm -r "${sharedPeaZip}/batch/freedesktop_integration/KDE-servicemenus/KDE3-konqueror"
  # KDE 4 is not supported on Arch since 2015-12-12 (https://archlinux.org/news/dropping-plasma-4/)
  rm -r "${sharedPeaZip}/batch/freedesktop_integration/KDE-servicemenus/KDE4-dolphin"

  # setting correct permissions
  chmod 755 usr && chmod 755 usr/bin
  chmod 755 usr/lib && chmod 755 usr/lib/peazip
  chmod 755 usr/lib/peazip/res && chmod -R 755 usr/lib/peazip/res/bin
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
