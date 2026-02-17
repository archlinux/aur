# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=wcmcommander
_pkgname=WCMCommander
pkgver=0.20.0
_pkgver=release-${pkgver}
pkgrel=1
pkgdesc="Multi-platform open source file manager (Windows, Linux, FreeBSD, OS X) mimicking the look-n-feel of Far Manager"
arch=('i686' 'x86_64' 'aarch64')
url="http://wcm.linderdaum.com/"
license=('MIT')
depends=('bash' 'libssh2' 'libstdc++' 'libx11' 'smbclient' 'freetype2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sagpant/${pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('f166cfd0ff8511642402892cb8eee3b20c845f82c04ca4ca940996e611aa5aba')


prepare() {
  # Fixing bug related to modern C++ compilers
  # credit here goes to packagers of wcmcommander for pkgsrc - more at: https://github.com/NetBSD/pkgsrc/tree/trunk/sysutils/WCMCommander/patches
  
  # fixing line 190 of file src/vfs/vfs-sftp2.cpp
  # variable prompts[i].text needs to be explicitly typecasted as pointer to char:
  sed -i \
    '190 s/.*/pData[i].prompt = std::string( reinterpret_cast<char *>(prompts[i].text), prompts[i].length );/' \
    "$srcdir/${_pkgname}-${_pkgver}/src/vfs/vfs-sftp2.cpp"
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make all
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  
  #copy license file from sourcedir/LICENSE to the package at /usr/share/licenses/wcmcommader
  install -d -m755 $pkgdir/usr/share/licenses
  install -d -m755 $pkgdir/usr/share/licenses/${pkgname}
  cp ./LICENSE $pkgdir/usr/share/licenses/${pkgname}
}
