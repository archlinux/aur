# Maintainer: Yakir Sitbon <kingyes1 at gmail dot com>
# Contributor: Alex Taber <aft dot pokemon at gmail dot com>

pkgname=teamviewer
pkgver=11.0.52520
pkgrel=2
pkgdesc="All-In-One Software for Remote Support and Online Meetings"
arch=('i686' 'x86_64')
url="http://www.teamviewer.com"
license=('custom')
depends=('alsa-lib' 'gcc-libs' 'libxdamage' 'libxtst' 'zlib' 'freetype2' 'libxrandr' 'libice' 'libsm')
options=('!strip')
install=${pkgname}.install

if [[ $CARCH == 'i686' ]]; then
  source=("teamviewer_linux-${pkgver}.deb::http://download.teamviewer.com/download/teamviewer_i386.deb")
  md5sums=('69520c11b4db8700617b5344cb8d4daa')
  depends+=('alsa-lib' 'gcc-libs' 'libxdamage' 'libxtst' 'zlib' 'freetype2' 'libxrandr' 'libice' 'libsm')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("teamviewer_linux_x64-${pkgver}.deb::http://download.teamviewer.com/download/teamviewer_amd64.deb")
  md5sums=('233d98a671d9ae6376c7265a3db2031f')
  depends+=('lib32-gcc-libs' 'lib32-alsa-lib' 'lib32-libxtst' 'lib32-libxdamage' 'lib32-zlib' 'lib32-freetype2' 'lib32-libxrandr' 'lib32-libice' 'lib32-libsm' 'lib32-libxinerama')
fi

build() {
  cd "${srcdir}"
  tar -jxf data.tar.bz2
}

package() {
  cd "${srcdir}"

# Install
  if [ -f /opt/teamviewer/logfiles ]
    then
      rm opt/teamviewer/logfiles
  fi

  if [ -f /opt/teamviewer/config ]
    then
      rm opt/teamviewer/config
  fi

  cp -dr --no-preserve=ownership {etc,opt,usr,var} "${pkgdir}"/

# Additional files
  rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
  install -dm 755 "${pkgdir}"/usr/{lib/systemd/system,share/applications,share/licenses/teamviewer}
  install -m 644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service "${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
  ln -s /opt/teamviewer/tv_bin/desktop/teamviewer-teamviewer10.desktop "${pkgdir}"/usr/share/applications/teamviewer.desktop
  ln -s /opt/teamviewer/License.txt "${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}

