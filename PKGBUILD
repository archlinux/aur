# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2017.4.7
_build=f1
_buildtag=20180703
_randomstring=1d86eef80e0a
_prefix=/opt/UnityLts
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor-lts-webgl
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}")

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
  extract-component WebGL

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/UnitySetup-WebGL-Support-for-Editor-${_version}${_build}.tar.xz"
  fi
}

md5sums=('b3ae793ba7f9c5d6d334df7763b85049')
