# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: bugix
# Contributor: Lubosz Sarnecki <lubosz at gmail>

pkgname=openni
pkgver=1.5.7.10
pkgrel=1
pkgdesc="The OpenNI Framework provides the interface for physical devices and for middleware components"
arch=('i686' 'x86_64')
url="http://www.openni.org/"
license=('GPL')
depends=('freeglut' 'mesa' 'libusb' 'java-environment')
makedepends=('git')
install="openni.install"

_gitroot="github.com/OpenNI/OpenNI.git"
_gitname="openni"
_gitbranch="Stable"

source=("$_gitname-build"::"git+https://$_gitroot"#tag=$_gitbranch-$pkgver
        "libopenni.pc")
md5sums=('SKIP'
         '846a9b0be1dbee5f1d4619db42034978')

if [ "${CARCH}" = "x86_64" ]; then
  _platform=x64
else
  _platform=x86
fi


build() {
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

  install libnimCodecs.so libnimMockNodes.so libnimRecorder.so libOpenNI.so libOpenNI.jni.so "${pkgdir}/usr/lib"

  install -d -m755 "${pkgdir}/usr/lib/pkgconfig"
  cp "${srcdir}/libopenni.pc" "${pkgdir}/usr/lib/pkgconfig/"
}
