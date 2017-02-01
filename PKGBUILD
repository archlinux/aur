# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

pkgname=unity-editor
_version=5.5.1
_build=f1
_buildtag=20170201
pkgver=${_version}${_build}+${_buildtag}
pkgrel=1
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
source=("http://beta.unity3d.com/download/f5287bef00ff/unity-editor-installer-5.5.1xf1Linux.sh"
        'EULA'
        'unity-editor'
        'monodevelop-unity'
        'unity-monodevelop.png')
noextract=("unity-editor-installer-${_version}x${_build}Linux.sh")
sha1sums=('99bfd5cd2332d105edcafe68b2392897ffa54112'
          'fddbbfbfa3fcabc753b19941e5fb5dff41851ba6'
          'c3727d6851a3ffd0aef9b380e2485eed9f02ef6b'
          '8ffbfd8f4577b146d25217720ac6689c5d929e84'
          'd1ecf758c9816f964febf601d065b0354940d866')
sha512sums=('c041b067c123c707b6e72af08877d60b9778b66eadc68255efa7c94052bea7354ca55dc3a3aa98e2fb20ccb17b893a18fe250ee096512425d6812cf560482daf'
            'a73524a6d43545cb961c42b4f3df5bcdb59d9bcaf07976b07c2e30c97f2ee1591af574a450ac44d68a8330098a349be3c071e1074045d595f85a3cf2aff40005'
            'ef907b215996354dd4f76cae79687952e11937510823ec836bc984180803b5deb3fd5a055092e258ca3a2293b90ce0da7f0c8cdb7862d546d843e092b3dbc3a0'
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
  yes | fakeroot sh $noextract > /dev/null
  rm $noextract
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
