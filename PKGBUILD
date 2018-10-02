# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.10
_build=f1
_randomstring=674aa5a67ed5
_prefix=/opt/Unity

pkgname=unity-editor
pkgver=${_version}${_build}
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
         'npm'
         'intel-tbb'
         'gtk3')
optdepends=('unity-editor-doc'
            'unity-editor-android'
            'unity-editor-ios'
            'unity-editor-mac'
            'unity-editor-webgl'
            'unity-editor-windows'
            'unity-editor-facebook'
            'visual-studio-code-bin')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorInstaller/Unity.tar.xz"
        'unity-editor'
        'unity-editor.desktop'
        'unity-editor-icon.png'
        'eula.txt')
sha1sums=('ad835ec4fa87868f3e6787afef9acd89a2a5a9d7'
          'c3727d6851a3ffd0aef9b380e2485eed9f02ef6b'
          '6ba1a3051bc0d5ed08e2fa4551d0f6c679109176'
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
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/unity-editor.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/unity-editor.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/unity-editor-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm644 "${srcdir}/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}

