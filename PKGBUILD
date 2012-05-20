# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: bugix
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=openni-git
pkgver=20120518
pkgrel=1
pkgdesc="The OpenNI Framework provides the interface for physical devices and for middleware components"
arch=('i686' 'x86_64')
url="http://www.openni.org/"
license=('GPL')
depends=('freeglut' 'libusb' 'java-environment')
makedepends=('git')
provides=('openni')
conflicts=('openni')
install="openni.install"
source=()
md5sums=()

_gitroot="git://github.com/OpenNI/OpenNI.git"
_gitname="openni"
_gitbranch="unstable"


if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi


build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone -b ${_gitbranch} ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  
  find "${srcdir}/${_gitname}-build/Samples" -type f -exec sed -i 's#../../../../Data/SamplesConfig.xml#/usr/share/openni/SamplesConfig.xml#g' {} \;
  
  cd "${srcdir}/${_gitname}-build/Platform/Linux/Build"
  
  if [ -f Common ]; then ln -fs `cat Common` Common; fi
  
  # BUILD
  LDFLAGS+=' -lGL' make
}

package() {
  install -d -m755 "${pkgdir}/usr/"{lib,bin,share/openni,include/ni/Linux-x86}
  install -d -m755 "${pkgdir}/var/lib/ni"

  cd "${srcdir}/${_gitname}-build/Include"
  install *.h "${pkgdir}/usr/include/ni"
  install Linux-x86/* "${pkgdir}/usr/include/ni/Linux-x86"
  
  cd "${srcdir}/${_gitname}-build/Data"
  install SamplesConfig.xml "${pkgdir}/usr/share/openni"

  cd "${srcdir}/${_gitname}-build/Platform/Linux/Bin/${_platform}-Release"
  install niLicense niReg "${pkgdir}/usr/bin"
  install Sample* "${pkgdir}/usr/bin"

  install libnimCodecs.so libnimMockNodes.so libnimRecorder.so libOpenNI.so "${pkgdir}/usr/lib"
}
