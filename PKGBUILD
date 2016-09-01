# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

pkgname=unity-editor
_version=5.5.0
_build=b1
_buildtag=20160830
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
conflicts=('unity3d')
replaces=('unity3d')
source=("http://download.unity3d.com/download_unity/linux/unity-editor-installer-${pkgver}.sh"
        'EULA'
        'unity-editor'
        'monodevelop-unity'
        'unity-monodevelop.png')
noextract=("unity-editor-installer-${pkgver}.sh")
sha1sums=('ca023d29f545012a2e9ad640dba56b3da382e64e'
          '949c8c7808af14d946a18d0631b017b46c504e66'
          '9172be394811c35dba79d2e9ac7d5bbd5fabccdc'
          '8ffbfd8f4577b146d25217720ac6689c5d929e84'
          'd1ecf758c9816f964febf601d065b0354940d866')
sha512sums=('0fd853512ae2ec83df67512276460a30fb42197d1930781ad391132f93e15c60cf5042f02ea402ba598dc272af056184d704cd25e12940693e61f13a2d056ab3'
            '63dcb18e4cc68dc1f991b4b2f67aa96fbf286682ef01c000c597eb3cf97ae42504063c6599921c3c11d5d98e79dfa33784c47f0cdc9aa0e494362235aa0e302f'
            'bf8a4ab65a2fc7dc51ff02e5f46ce3be365b660f32fa9d70d5b284575c20766ccd6abe53eef1049ae76b78d86eaeb830ce73184b63abab1237a3e735a0897709'
            '26946ad2c759699763c1284a1f30380072da2911659992fa2471b436df1f0535b6eef61007f11c2e010e4a002663324e42ef5ae1417aa45e0ec99f4e3f0aafb7'
            '44676f54d83357721bee844d1e0e997e584b2148c871dbf24385976dda840f37e4cf4a1796fa17dec90fac539bac58e0e47fa0af0abc98e4cf795f735b23c1b0')
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
  yes | fakeroot sh "unity-editor-installer-${pkgver}.sh" > /dev/null
  rm "unity-editor-installer-${pkgver}.sh"
}

package() {
  local extraction_dir="${srcdir}/unity-editor-${_version}x${_build}Linux"

  mkdir -p "${pkgdir}/opt/"
  mv ${extraction_dir} ${pkgdir}/opt/Unity

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 ${pkgdir}/opt/Unity/Editor/python

  # Use the launch scripts in the .desktop files
  sed -i "/^Exec=/c\Exec=/usr/bin/unity-editor" "${pkgdir}/opt/Unity/unity-editor.desktop"
  sed -i "/^Exec=/c\Exec=/usr/bin/monodevelop-unity" "${pkgdir}/opt/Unity/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgdir}/opt/Unity/unity-editor.desktop" \
                                                       "${pkgdir}/opt/Unity/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${pkgdir}/opt/Unity/unity-editor-icon.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${srcdir}/unity-monodevelop.png"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

# vim:set sw=2 sts=2 et:
