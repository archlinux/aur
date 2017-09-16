# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

_version=2017.2.0
_build=b11
_buildtag=20170914
_randomstring=fd37f3680b5f
_extractiondir=unity-editor-${_version}${_build}

pkgname=('unity-editor-beta' 'monodevelop-unity-beta')
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
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
            'monodevelop-unity-beta: for old Monodevelop + Unity-specific addins')
noextract=("unity-editor-installer-${_version}${_build}.sh")
source=("http://beta.unity3d.com/download/${_randomstring}/${noextract}"
        'EULA'
        'unity-editor-beta'
        'monodevelop-unity-beta'
        'unity-monodevelop-beta.png')
sha1sums=('60643f5514647c70d32aa5c1e18637d41a6b1117'
          'b0b08428b5df109916db396717ec7a8ec5f4c0c4'
          'd61175685d0836a79b2d4582c09ea23ed5ee18e9'
          'cb3628b684d17fc889961b4b1bee7cda9378790d'
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

package_unity-editor-beta() {
  mkdir -p "${pkgdir}/opt/UnityBeta"
  mv "${srcdir}/${_extractiondir}/Editor" "${pkgdir}/opt/UnityBeta/Editor"

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 "${pkgdir}/opt/UnityBeta/Editor/python"

  # Fix permissions
  find "${pkgdir}/opt/UnityBeta/Editor/Data" -type d -exec chmod ga+rx {} \;

  # Rename to beta
  mv "${srcdir}/${_extractiondir}/unity-editor.desktop" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"
  mv "${srcdir}/${_extractiondir}/unity-editor-icon.png" "${srcdir}/${_extractiondir}/unity-editor-beta-icon.png"
  sed -i "/^Exec=/c\Exec=/usr/bin/unity-editor-beta" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"
  sed -i "/^Icon=/c\Icon=unity-editor-beta-icon" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"
  sed -i "/^Name=/c\Name=Unity Beta" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_extractiondir}/unity-editor-beta.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${_extractiondir}/unity-editor-beta-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor-beta"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

package_monodevelop-unity-beta() {
  pkgdesc="Unity's fork of MonoDevelop."
  depends=('monodevelop')
  optdepends=('gnome-sharp' 'referenceassemblies-2.0-bin' 'referenceassemblies-3.5-bin')

  mkdir -p "${pkgdir}/opt/UnityBeta"
  mv "${srcdir}/${_extractiondir}/MonoDevelop" "${pkgdir}/opt/UnityBeta/MonoDevelop"

  # Change stuff in the .desktop files
  mv "${srcdir}/${_extractiondir}/unity-monodevelop.desktop" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"
  sed -i "/^Exec=/c\Exec=/usr/bin/monodevelop-unity-beta" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"
  sed -i "/^Icon=/c\Icon=unity-monodevelop-beta" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"
  sed -i "/^Name=/c\Name=MonoDevelop Beta" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_extractiondir}/unity-monodevelop-beta.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/unity-monodevelop-beta.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity-beta"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
