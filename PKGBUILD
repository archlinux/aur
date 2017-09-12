# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

_version=2017.1.1
_build=f1
_buildtag=20170905
_randomstring=f4fc8fd4067d
_extractiondir=unity-editor-${_version}x${_build}Linux

pkgname=('unity-editor' 'monodevelop-unity')
pkgver=${_version}${_build}+${_buildtag}
pkgrel=3
epoch=1
pkgdesc="The world's most popular development platform for creating 2D and 3D multiplatform games and interactive experiences."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('desktop-file-utils'
         'xdg-utils'
         'gcc-multilib'
         'libgl'
         'glu'
         'nss'
         'libpng12'
         'libxtst'
         'libpqxx'
         'npm')
optdepends=('ffmpeg: for WebGL exporting'
            'nodejs: for WebGL exporting'
            'java-runtime: for WebGL exporting'
            'gzip: for WebGL exporting'
            'java-environment: for Android and Tizen exporting'
            'android-sdk: for Android Remote'
            'android-udev: for Android Remote'
            'monodevelop-unity: for old MonoDevelop + Unity-specific addins')
conflicts=('unity3d')
replaces=('unity3d')
source=("http://beta.unity3d.com/download/${_randomstring}/unity-editor-installer-${_version}x${_build}Linux.sh"
        'EULA'
        'unity-editor'
        'monodevelop-unity'
        'unity-monodevelop.png')
noextract=("unity-editor-installer-${_version}x${_build}Linux.sh")
sha1sums=('fe7dca4513f2e22c11ac34f861e642cada7989f9'
          'b0b08428b5df109916db396717ec7a8ec5f4c0c4'
          'c3727d6851a3ffd0aef9b380e2485eed9f02ef6b'
          '8ffbfd8f4577b146d25217720ac6689c5d929e84'
          'd1ecf758c9816f964febf601d065b0354940d866')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

prepare() {
  if [ "$(df . -BG --output=avail | awk -F'[^0-9]*' 'FNR==2 {print $2;}')" -le "10" ]; then
    warning "It seems that you have less than 10GB left. If you are using
     an AUR-Helper or building on a small partition (like /tmp), you might
     want to change the build-/cache-directory as this package is rather big."
  fi
}

build() {
  msg2 "Extracting archive ..."
  yes | fakeroot sh $noextract > /dev/null
  rm $noextract
}

package_unity-editor() {
  mkdir -p "${pkgdir}/opt/Unity"
  mv ${srcdir}/${_extractiondir}/Editor ${pkgdir}/opt/Unity/Editor

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 ${pkgdir}/opt/Unity/Editor/python

  # Fix permissions
  find ${pkgdir}/opt/Unity/Editor/Data -type d -exec chmod ga+rx {} \;

  # Use the launch scripts in the .desktop files
  sed -i "/^Exec=/c\Exec=/usr/bin/unity-editor" "${srcdir}/${_extractiondir}/unity-editor.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_extractiondir}/unity-editor.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${_extractiondir}/unity-editor-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

package_monodevelop-unity() {
  pkgdesc="Unity's fork of MonoDevelop."
  depends=('monodevelop')
  optdepends=('gnome-sharp' 'referenceassemblies-2.0-bin' 'referenceassemblies-3.5-bin')

  mkdir -p "${pkgdir}/opt/Unity"
  mv ${srcdir}/${_extractiondir}/MonoDevelop ${pkgdir}/opt/Unity/MonoDevelop

  # Use the launch scripts in the .desktop files
  sed -i "/^Exec=/c\Exec=/usr/bin/monodevelop-unity" "${srcdir}/${_extractiondir}/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_extractiondir}/unity-monodevelop.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/unity-monodevelop.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
# vim:set sw=2 sts=2 et:
