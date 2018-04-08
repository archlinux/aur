# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2017.4.0
_build=f1
_buildtag=20180501
_randomstring=0ec691fce5c2
_prefix=/opt/Unity
_unitydownloads="http://beta.unity3d.com/download/${_randomstring}"
#_keepdownloads=yes

pkgname=unity-editor
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
epoch=1
pkgdesc="The world's most popular development platform for creating 2D and 3D multiplatform games and interactive experiences."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('desktop-file-utils'
         'xdg-utils'
         'gcc-libs'
         'lib32-gcc-libs'
         'gconf'
         'libgl'
         'glu'
         'nss'
         'libpng12'
         'libxtst'
         'libpqxx'
         'npm')
optdepends=('unity-editor-doc'
            'unity-editor-standardassets'
            'unity-editor-example'
            'unity-editor-android'
            'unity-editor-ios'
            'unity-editor-mac'
            'unity-editor-webgl'
            'unity-editor-windows'
            'unity-editor-facebook')
makedepends=('gtk2' 'libsoup' 'libarchive')
source=("${_unitydownloads}/UnitySetup-${_version}${_build}"
        'unity-editor'
        'unity-editor.desktop'
        'unity-editor-icon.png')
sha1sums=('b379e6df5d9d5f02047d37c3399a2b1bb5168dda'
          'c3727d6851a3ffd0aef9b380e2485eed9f02ef6b'
          '6ba1a3051bc0d5ed08e2fa4551d0f6c679109176'
          'fddf4861974f88f0565de7f54f7418204e729894')
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
  msg2 "Extracting EULA..."
  echo n | unity-setup | head -n -2 > "${srcdir}/EULA"

  mkdir -p "${pkgdir}${_prefix}"
  extract-component Unity

  if [ -z "${_keepdownloads}" ]; then
    rm "${startdir}/Unity.tar.xz"
  fi

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 "${pkgdir}${_prefix}/Editor/python"

  # Fix permissions
  find "${pkgdir}${_prefix}/Editor/Data" -type d -exec chmod ga+rx {} \;

  # Add version to desktop file
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/unity-editor.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/unity-editor.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/unity-editor-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

