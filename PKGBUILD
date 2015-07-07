# Maintainer: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Matías Hernández <msdark(at)archlinux(dot)cl>
# Contributor: Hugo Ideler <hugoideler(at)dse(dot)nl>
#
# fixes.patch (biloky):
#   2010.09.23 - some Info.plist does not contain a CFBundleName, use 
#                CFBundleDisplayName instead
#   2011.08.07 - fix gcc4.6 werror=sign-compare error (2012.03.21 fixed upstream)
#   2012.09.13 - updated fixes.patch to merge with upstream changes
#   2012.11.26 - removed fixes.patch, issue resolved upstream
#   2012.12.31 - reverted upstream changes re Info.list & Payload detection
#                back to 2012.08.24
#   2013.01.16 - removed patch, Info.list & Payload detection resolved upstream
#   2013.06.19 - updated for new git vcs format
#   2013.07.29 - temporarily unset CPPFLAGS to ignore build warnings
#   2013.08.03 - use -Wno-error=unused-result in CFLAGS to ignore unused 
#                results warnings
#   2015.07.07 - removed -Werror to ignore compile warnings (Hugo Ideler)

pkgname=ideviceinstaller-git
_gitname=ideviceinstaller
pkgver=20150707
pkgrel=1
pkgdesc="Manage Applications of an iPhone or iPod Touch"
arch=('i686' 'x86_64')
url="http://cgit.sukimashita.com/ideviceinstaller.git/"
license=('GPL')
groups=('system')
depends=('libimobiledevice' 'usbmuxd' 'libzip') 
makedepends=('git' 'automake')
provides=('ideviceinstaller')
source=('git://git.sukimashita.com/ideviceinstaller.git')
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}

  # Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  
  # Use current date
  date +%Y%m%d
}

build() {
  cd ${_gitname}

#  unset CPPFLAGS
#  sed -i "/AS_COMPILER_FLAGS(/s/-Werror/-Werror -Wno-error=unused-result/" configure.ac
  sed -i "/AS_COMPILER_FLAGS(/s/-Werror//" configure.ac
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd ${_gitname}

  make DESTDIR=${pkgdir} install
}
