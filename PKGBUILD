# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

pkgname=unity-editor-beta
_version=5.4.0
_build=b15
_buildtag=20160418
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
         'monodevelop'
         'npm')
optdepends=('ffmpeg: for WebGL exporting'
            'nodejs: for WebGL exporting'
            'java-runtime: for WebGL exporting'
            'gzip: for WebGL exporting'
            'java-environment: for Android and Tizen exporting'
            'android-sdk: for Android Remote'
            'android-udev: for Android Remote')
install="${pkgname}.install"
source=("http://download.unity3d.com/download_unity/linux/unity-editor-installer-${pkgver}.sh"
        'EULA'
        'unity-editor-beta'
        'monodevelop-unity-beta'
        'unity-monodevelop-beta.png')
noextract=("unity-editor-installer-${pkgver}.sh")
sha256sums=('fc2f878af5ffed4c3693f3cddeaba833291c89cc44a7204f10b6d08ae6cdf68f'
            'aca6e932a624acd98f634428af0b33a36587b6c41887969477db944975d4d8b4'
            'a6183b216e30a472b9592059f64a3a6279a9d3e56c5c343c93713b03fa863c4c'
            '336ffc3f63e622aa394e1022c15a58ce94865d7b6d9465cbcca4ce943285763a'
            '6769b7ad1c1a1b088f1e96934d909fffef95d6a6c757420699f0a6705ef70a51')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

prepare() {
  if [ "$(df . -BG --output=avail | awk -F'[^0-9]*' 'FNR==2 {print $2;}')" -le "10" ]; then
    warning "It seems that you have less than 10GB left. If you are using an AUR-Helper"
    warning "or building on a small partition (like /tmp), you might want to change the"
    warning "build-/cache-directory as this package is rather big"
  fi
}

build() {
  msg2 "Extracting archive ..."
  yes | fakeroot sh "unity-editor-installer-${pkgver}.sh" > /dev/null
  rm "unity-editor-installer-${pkgver}.sh"
}

package() {
  local extraction_dir="${srcdir}/unity-editor-${_version}${_build}"

  mkdir -p "${pkgdir}/opt/"
  mv ${extraction_dir} ${pkgdir}/opt/UnityBeta

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 ${pkgdir}/opt/UnityBeta/Editor/python

  mv "${pkgdir}/opt/UnityBeta/unity-editor.desktop" "${pkgdir}/opt/UnityBeta/unity-editor-beta.desktop"
  mv "${pkgdir}/opt/UnityBeta/unity-monodevelop.desktop" "${pkgdir}/opt/UnityBeta/unity-monodevelop-beta.desktop"
  mv "${pkgdir}/opt/UnityBeta/unity-editor-icon.png" "${pkgdir}/opt/UnityBeta/unity-editor-beta-icon.png"

  # Use the launch scripts in the .desktop files
  sed -i "/^Exec=/c\Exec=/usr/bin/unity-editor-beta" "${pkgdir}/opt/UnityBeta/unity-editor-beta.desktop"
  sed -i "/^Exec=/c\Exec=/usr/bin/monodevelop-unity-beta" "${pkgdir}/opt/UnityBeta/unity-monodevelop-beta.desktop"

  # Change app names
  sed -i "/^Name=/c\Name=Unity Beta" "${pkgdir}/opt/UnityBeta/unity-editor-beta.desktop"
  sed -i "/^Name=/c\Name=MonoDevelop Beta" "${pkgdir}/opt/UnityBeta/unity-monodevelop-beta.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgdir}/opt/UnityBeta/unity-editor-beta.desktop" \
                                                       "${pkgdir}/opt/UnityBeta/unity-monodevelop-beta.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${pkgdir}/opt/UnityBeta/unity-editor-beta-icon.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/unity-monodevelop-beta.png"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor-beta"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity-beta"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

# vim:set ssw=2 sts=2 et:
