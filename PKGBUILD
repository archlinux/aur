# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.2.0
_build=b5
_buildtag=20180525
_randomstring=05c26644dc98
_prefix=/opt/UnityBeta
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-beta-android
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the Android platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'android-platform'
         'android-sdk-build-tools'
         'android-udev')
optdepends=('android-ndk-13b: needed for IL2CPP builds')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")
sha1sums=('eff3735245592be8a44d29fe1fc7a8b0cbb4e0dd')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

unity-setup() {
  ./UnitySetup-${_version}${_build} \
    --download-location="${startdir}" \
    --install-location="${pkgdir}${_prefix}" \
    --unattended $@
}

extract-component() {
  msg2 "Extracting $1..."
  yes | unity-setup --components=$1 > "/tmp/$1.log"
}

prepare() {
  chmod +x "${srcdir}/UnitySetup-${_version}${_build}"
}

package() {
  mkdir -p "${pkgdir}${_prefix}"
  extract-component Android

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/UnitySetup-Android-Support-for-Editor-${_version}${_build}.pkg"
  fi
}

