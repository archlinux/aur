# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.17
_build=f1
_randomstring=05307cddbb71
_prefix=/opt/UnityLts

pkgname=unity-editor-lts
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
optdepends=('unity-editor-lts-doc'
            'unity-editor-lts-android'
            'unity-editor-lts-ios'
            'unity-editor-lts-mac'
            'unity-editor-lts-webgl'
            'unity-editor-lts-windows'
            'unity-editor-lts-facebook'
            'visual-studio-code-bin')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorInstaller/Unity.tar.xz"
        'unity-editor-lts'
        'unity-editor-lts.desktop'
        'unity-editor-lts-icon.png'
        'eula.txt')
md5sums=('0cb23afc495356c7b4ea481ddd19c86d'
         '6e2f0e897fe71d99c649f397dce8c0f9'
         '7cf8762a5f84a408286365d23fa00e5e'
         '723f9e556821810682a6d1f4be540a74'
         '7519f32fef332078cc77378fe9815835')
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
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/unity-editor-lts.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/unity-editor-lts.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/unity-editor-lts-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor-lts"
  install -Dm644 "${srcdir}/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}

