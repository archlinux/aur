# Maintainer: Valentijn "noirscape" V <neko at catgirlsin dot space>
# Contributor: Felix Golatofski <contact at xdfr dot de>
# Contributor: Oscar Morante <spacepluk at gmail dot com>


_prefix=/opt/UnityLts
_hash=e05b6e02d63e
# hash obtained from: https://unity3d.com/unity/qa/lts-releases , you can find it by right clicking the download
# link for any installer and then using your brain to figure out what part looks like the hash

pkgname=unity-editor-lts
pkgver=2019.4.16f1
pkgrel=1
epoch=1
pkgdesc="The world's most popular development platform for creating 2D and 3D multiplatform games and interactive experiences. (LTS)"
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
         'gtk3'
         'python2')
optdepends=("${pkgname}-doc"
            "${pkgname}-android"
            "${pkgname}-ios"
            "${pkgname}-mac"
            "${pkgname}-webgl"
            "${pkgname}-windows"
            "${pkgname}-facebook"
            "visual-studio-code-bin"
            "unityhub"
            "jq: needed for UnityHub integration helpers --register/--deregister")
source=("$pkgver.tar.xz::https://download.unity3d.com/download_unity/${_hash}/LinuxEditorInstaller/Unity.tar.xz"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-icon.png"
        "eula.txt")
sha256sums=('9bc0c51eac46b9a101de8b9b66ee280b9c22245a077dcf140d02cca93d1dc1d3'
            'c22d2f91c47923496d24e8be376f70305846e60c038f923d6c7b41f0741bcb4a'
            'e786f76cfe96b41300775e54fcdd7e81dbfb3b28f607a263ac7a3a73a697ae06'
            '193a3b88d7149f7eff19bbb282a836847831a842db399addbcc0cc600fd08cdb'
            'ad36e10abd6f4aa7dbd6619a57b521b067c96702b8f03a280245c60c2c1ebd1a')
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
  sed -i "/^Version=/c\Version=${_version}${_build}" "${srcdir}/${pkgname}.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${pkgname}-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}"
  install -Dm644 "${srcdir}/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"
}

