# Maintainer: sksat <sksat@sksat.net>
# Unity for VRChat(2018.4.20f1)
# UnityHub link: unityhub://2018.4.20f1/008688490035

_prefix=/opt/Unity

pkgname=unity-editor-vrchat
pkgver=2018.4.20f1
pkgrel=1
epoch=1
pkgdesc="Allows building your Unity projects for VRChat"
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
optdepends=("unityhub"
            "jq: needed for UnityHub integration helpers --register/--deregister")
conflicts=("unity-editor"
           "unity-editor-windows")
install=${pkgname}.install
source=("${pkgver}.tar.xz::https://download.unity3d.com/download_unity/008688490035/LinuxEditorInstaller/Unity.tar.xz"
        "${pkgver}-win.pkg::https://download.unity3d.com/download_unity/008688490035/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-${pkgver}.pkg"
        "${pkgver}-android.pkg::https://download.unity3d.com/download_unity/008688490035/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-${pkgver}.pkg"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}-icon.png"
        "eula.txt")
noextract=("${pkgver}-android.pkg")
md5sums=("d1651b6b0a6d639253e8d149c4bc6b6a"
         "2af219c4a5f6a9679af9ae43a86d7dfb"
         "5272bd150acd2d9a412118978407d885"
         'a8fe2e41f06489dd09f651b08ec87125'
         'ee60f0d4d3c3fa9e0a52da085b1f3be6'
         '723f9e556821810682a6d1f4be540a74'
         '24f6741eba3d591a0761f3c92e3cc1f7')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

prepare(){
  mkdir "${srcdir}/Android"
  cd "${srcdir}/Android"
  bsdtar -xvf "${srcdir}/${pkgver}-android.pkg"
  cd ..
}

package() {
  install -d "${pkgdir}/${_prefix}"
  mv "${srcdir}/Editor" "${pkgdir}/${_prefix}"

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 "${pkgdir}${_prefix}/Editor/python"

  # Fix permissions
  find "${pkgdir}${_prefix}/Editor/Data" -type d -exec chmod ga+rx {} \;

  # Add version to desktop file
  sed -i "/^Version=/c\Version=${pkgver}" "${srcdir}/${pkgname}.desktop"

  # Add version/name to launch script
  sed -i "s/%PKGNAME%/${pkgname}/g" "${srcdir}/${pkgname}"
  sed -i "s/%PKGVER%/${pkgver}/g" "${srcdir}/${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${pkgname}-icon.png"
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}"
  install -Dm644 "${srcdir}/eula.txt" "${pkgdir}/usr/share/licenses/${pkgname}/eula.txt"

  _dest_win="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest_win}"
  cd "${_dest_win}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
  cd ..

  _dest_android="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/AndroidPlayer"
  install -d "${_dest_android}"
  cd "${_dest_android}"
  cat "${srcdir}/Android/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

