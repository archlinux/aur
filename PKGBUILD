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
             'sed'
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
        "https://unity3d.com/legal/eula"
        'unity-editor'
        'monodevelop-unity')
noextract=("unity-editor-installer-${pkgver}.sh")
sha256sums=('bf73e7693ae15b271dbbd55010eb33fae3400b964fa4b70289bd5a17d19d5493'
            '25421c924c29d338a0e18f6dd356a927ebe93ec093307894d4da9bd71c07f0ea'
            'a03aaf639c6ba56a0ef03a591f0f629a3e015a3a3c6999ecc0feb6b2284c901b'
            '7309ac206fbb6eb5f1a073bf22e2571e1a574410ab410138a19fb66c3eee21e3')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

build() {
  yes | fakeroot sh "unity-editor-installer-${pkgver}.sh"
}

package() {
  local extraction_dir="${srcdir}/unity-editor-${_version}${_build}"

  mkdir -p "${pkgdir}/opt/Unity"
  cp -a "${extraction_dir}/." "${pkgdir}/opt/Unity"

  # Remove bundled libresolv.so.2 for the time being (workarounds network problems)
  rm "${pkgdir}/opt/Unity/Editor/Data/Tools/libresolv.so.2"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${extraction_dir}/unity-editor.desktop" \
                                                       "${extraction_dir}/unity-monodevelop.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${extraction_dir}/unity-editor-icon.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/48x48/apps" "${extraction_dir}/unity-monodevelop.png"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/unity-editor"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/monodevelop-unity"

  # EULA
  xmllint --html --xpath "//section[@id='content']" "${srcdir}/eula" 2> /dev/null | elinks -dump | sed '/Quick jump/,$d' > "${srcdir}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
