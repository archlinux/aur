# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b3
_randomstring=cc0086a8e10c
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta
pkgver=${_version}${_build}
pkgrel=1
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
         'npm'
         'intel-tbb'
         'gtk3')
optdepends=('unity-editor-beta-doc'
            'unity-editor-beta-android'
            'unity-editor-beta-ios'
            'unity-editor-beta-mac'
            'unity-editor-beta-webgl'
            'unity-editor-beta-windows'
            'unity-editor-beta-facebook'
            'visual-studio-code-bin')
source=("https://beta.unity3d.com/download/${_randomstring}/LinuxEditorInstaller/Unity.tar.xz"
        'unity-editor-beta'
        'unity-editor-beta.desktop'
        'unity-editor-beta-icon.png'
        'eula.txt')
sha1sums=('dcf97c5ce0c74659637001ca4f897b20feb7e124'
          'd61175685d0836a79b2d4582c09ea23ed5ee18e9'
          'c348f141232ec06c6558fd42b5cbf86a75e2d02d'
          'fddf4861974f88f0565de7f54f7418204e729894'
          '1c3d4bc66fd16a10e68f78320e16cfd86afac7ac')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  install -d "${pkgdir}/${_prefix}"
  mv "${srcdir}/Editor" "${pkgdir}/${_prefix}"

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 "${pkgdir}${_prefix}/Editor/python"

  # Fix permissions
  find "${pkgdir}${_prefix}/Editor/Data" -type d -exec chmod ga+rx {} \;

  # Add version to desktop file
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/unity-editor-beta.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/unity-editor-beta.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/unity-editor-beta-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor-beta"
  install -Dm644 "${srcdir}/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}

