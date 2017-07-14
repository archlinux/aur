# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>
# Contributor: Ace <a.mad.coder at gmail dot com>

pkgname=unity-editor
_version=2017.1.0
_build=f3
_buildtag=20170711
_randomstring=061bcf22327f
pkgver=${_version}${_build}+${_buildtag}
pkgrel=2
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
source=("http://beta.unity3d.com/download/${_randomstring}/unity-editor-installer-${_version}x${_build}Linux.sh"
        'EULA'
        'unity-editor'
        'monodevelop-unity'
        'unity-monodevelop.png')
noextract=("unity-editor-installer-${_version}x${_build}Linux.sh")
sha1sums=('a494c8191738ed0cf2b2024d93b7154af2fefea6'
          'b0b08428b5df109916db396717ec7a8ec5f4c0c4'
          'c3727d6851a3ffd0aef9b380e2485eed9f02ef6b'
          '8ffbfd8f4577b146d25217720ac6689c5d929e84'
          'd1ecf758c9816f964febf601d065b0354940d866')
sha512sums=('edcd35eaa416cee67017bcf6634066f13d8981519c975de810eeeb98587107794a0fe8d98fb7e05e80f3ab5279b545d27b1ae81ef84d542b4a8663a1d5abd0ac'
            '9349fd1bf385d0cec8ed4596502b082c8f1f09c2c30a63d2f1d3b5e0695f86760ac7289eacc07d92d6f161ddd9ba838fb41883247fc5c8616e8bfe73f7eca070'
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

  # Fix permissions
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/UnityExtensions/Unity/VR/*
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/UnityExtensions/Unity/VR/WindowsStoreApps/*
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/UnityExtensions/Unity/VR/HolographicSimulation/Rooms/
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/PlaybackEngines/WebGLSupport/BuildTools/Emscripten_Linux/node/
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/PlaybackEngines/WebGLSupport/BuildTools/Emscripten_Linux/node/0.10.18_64bit
  chmod ga+rx ${pkgdir}/opt/Unity/Editor/Data/PlaybackEngines/WebGLSupport/BuildTools/Emscripten_Linux/node/0.10.18_64bit/bin

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
