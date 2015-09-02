# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Maintainer: Florian Walch <florian+aur at fwalch dot com>
# Maintainer: Leonard König <leonard.r.koenig at googlemail dot com>
# Maintainer: Oscar Morante <spacepluk at gmail dot com>

pkgname=unity-editor
_version=5.1.0
_build=f3
_buildtag=2015082501
pkgver=${_version}${_build}+${_buildtag}
pkgrel=5
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
         'monodevelop')
makedepends=('elinks'
             'libxml2')
optdepends=('ffmpeg: for WebGL exporting'
            'nodejs: for WebGL exporting'
            'java-runtime: for WebGL exporting'
            'gzip: for WebGL exporting'
            'java-environment: for Android and Tizen exporting'
            'android-sdk: for Android Remote'
            'android-udev: for Android Remote')
conflicts=('unity3d')
replaces=('unity3d')
install="${pkgname}.install"
source=("http://download.unity3d.com/download_unity/unity-editor-installer-${pkgver}.sh"
        'EULA'
        'unity-editor'
        'monodevelop-unity')
noextract=("unity-editor-installer-${pkgver}.sh")
sha256sums=('bf73e7693ae15b271dbbd55010eb33fae3400b964fa4b70289bd5a17d19d5493'
            '3e0f6faad2cae20ae2784256b0f5525fc69897a889d696aa5d748db2fe8c6a14'
            '9d46d016ab4fe09a325c6d75bfdf770596ec6679e3d5e1a31934c8bc97106c32'
            '7309ac206fbb6eb5f1a073bf22e2571e1a574410ab410138a19fb66c3eee21e3')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

prepare() {
  warning "If you are using an AUR-Helper or building on a small partition (like /tmp),"
  warning "you might want to change the build-/cache-directory as this package is rather big"
}

build() {
  yes | fakeroot sh "unity-editor-installer-${pkgver}.sh"
}

package() {
  local extraction_dir="${srcdir}/unity-editor-${_version}${_build}"

  mkdir -p "${pkgdir}/opt/Unity"
  cp -a "${extraction_dir}/." "${pkgdir}/opt/Unity"

  # Remove bundled libresolv.so.2 for the time being (workarounds network problems)
  rm "${pkgdir}/opt/Unity/Editor/Data/Tools/libresolv.so.2"

  # Use the launch scripts in the .desktop files
  sed -i "/^Exec=/c\Exec=/usr/bin/unity-editor" "${extraction_dir}/unity-editor.desktop"
  sed -i "/^Exec=/c\Exec=/usr/bin/monodevelop-unity" "${extraction_dir}/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${extraction_dir}/unity-editor.desktop" \
                                                       "${extraction_dir}/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${extraction_dir}/unity-editor-icon.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${extraction_dir}/unity-monodevelop.png"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity"
  install -Dm644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}

# vim:set sw=2 sts=2 et:
