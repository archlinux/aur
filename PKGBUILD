# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: Bitwig GmbH <support at bitwig dot com>
pkgname=bitwig-studio-demo
_pkgname=bitwig-studio
pkgver=1.0.1
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
depends=( 'xdg-utils' 'zenity' )
makedepends=('deb2targz')
optdepends=('alsa-lib' 'oss')
provides=('bitwig-studio')
options=(!strip)
source=("http://packs.bitwig.com/downloads/bitwig-studio-${pkgver}.deb")
md5sums=('60415786ba89915e89b25001d3dd891f')

_archive=("bitwig-studio-${pkgver}.deb")
_archive_md5="60415786ba89915e89b25001d3dd891f"
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

  deb2targz ${_archive}
  tar xfz ${_archive/.deb/.tar.gz} -C ${pkgdir}/

  install -m644 ${pkgdir}/opt/$_pkgname/EULA.rtf $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
