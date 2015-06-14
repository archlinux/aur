##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Use Release for normal release, or RelWithDebInfo if you want useful backtraces

_buildtype="Release"

##############################################################

pkgname=csync
pkgver=0.50.0
pkgrel=2
pkgdesc="A file synchronizer especially designed for you, the normal user. Not to be confused with csync2; related to ocsync."
arch=("i686" "x86_64")
url="http://www.csync.org"
license=('GPL2')
depends=('sqlite3>=3.3.9')
makedepends=('cmake')
optdepends=('libssh: sftp support'
            'smbclient: SMB support'
            'neon: ownCloud support')
conflicts=('ocsync')
backup=('etc/csync/csync.conf' 'etc/csync/csync_exclude.conf')
source=("ftp://gentoo.mirrors.pair.com/distfiles/${pkgname}-${pkgver}.tar.xz")
md5sums=('4f022aaa19ecd8008b03876dd65a9df2')

if [[ ! ${_buildtype} == "Release" ]] && [[ ! ${_buildtype} == "release" ]]; then
  options=(!strip)
fi

prepare() {
  if [[ -e ${srcdir}/${pkgname}-${pkgver}-build ]]; then rm -rf ${srcdir}/${pkgname}-${pkgver}-build; fi
  mkdir ${srcdir}/${pkgname}-${pkgver}-build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-build

  cmake -DCMAKE_BUILD_TYPE=${_buildtype} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSYSCONF_INSTALL_DIR=/etc \
        ../${pkgname}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}-build
  make DESTDIR=${pkgdir} install
}
