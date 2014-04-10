# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: Bitwig GmbH <support at bitwig dot com>
pkgname=bitwig-studio-demo
_pkgname=bitwig-studio
pkgver=1.0.6
pkgrel=1
pkgdesc="Music production system for production, remixing and performance"
arch=( 'x86_64' )
url="http://www.bitwig.com"
license=('custom')
# This list is not anywhere near what it should be
# and misses a lot of package names. If you find 
# yourself in a situation where you are missing 
# something please tell me via mail or on Github: 
# https://github.com/mkzero/bitwig-studio-demo-aur
depends=( 'jack' 'xdg-utils' 'zenity' 'xcb-util-wm')
optdepends=(
             'alsa-lib'
             'oss'
             'libav: MP3 support'
           )
provides=('bitwig-studio')
conflicts=('bitwig-studio-demo-rc')
options=(!strip)
source=("http://packs.bitwig.com/downloads/bitwig-studio-${pkgver}.deb")
md5sums=('d9b85c03eca2de86bf8f459a99a6db91')

_archive=("bitwig-studio-${pkgver}.deb")
_archive_md5="${md5sums[0]}"

build() {
  cd $srcdir

  if [ ! -f ${_archive} ]
  then
     wget -r -np -nd -H "http://packs.bitwig.com/downloads/${_archive}"
  fi

  if ! echo "${_archive_md5}  ${_archive}" | md5sum -c --quiet
  then
    echo "Invalid checksum for ${_archive}"
    return 1
  fi
}

package() {
  cd $srcdir

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/${_pkgname}
  install -d $pkgdir/usr/share/{applications,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  bsdtar -xf ./data.tar.gz -C "${pkgdir}/"

  install -m644 ${pkgdir}/opt/$_pkgname/EULA.rtf $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Fix launcher category
  sed -i 's:Categories=Multimedia:Categories=Multimedia;AudioVideo;Player;Recorder;:' \
    $pkgdir/usr/share/applications/bitwig-studio.desktop

  # Install icons
  mkdir -p $pkgdir/usr/share/pixmaps
  install -m644 $pkgdir/usr/share/icons/gnome/48x48/apps/bitwig-studio.png \
    $pkgdir/usr/share/pixmaps/
  mv $pkgdir/usr/share/icons/gnome $pkgdir/usr/share/icons/hicolor
}
