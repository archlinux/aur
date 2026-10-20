# Maintainer: KirishimaAmenatsu <rainsummertse@outlook.com>
# Based on the AUR package "hmcl" by Misaka13514 <Misaka13514 at gmail dot com>
# Contributors of the original package:
#   Hao Long <imlonghao@archlinuxcn.org>
#   Lin Ruoshui <LinRs at users.noreply.github dot com>
#   hexchain <i at hexchain.org>

pkgname=hmcl-no-download-restriction
_pkgname=HMCL
pkgver=3.17.0.361.r1.g583e004d7
_commit=583e004d718102ae4489aa3f64bcde0c0161d000
pkgrel=1
pkgdesc="A Minecraft launcher with the mainland China game download restriction removed"
arch=('any')
url="https://github.com/HMCL-dev/HMCL"
license=('GPL-3.0-or-later')
depends=('java-runtime' 'hicolor-icon-theme')
makedepends=('java-environment-openjdk=17')
install="$pkgname.install"
source=("hmcl-launch-script"
        "${pkgname}.desktop"
        "revert-583e004.patch"
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('72e2f9aa78f7755cbb6b25854111d5f8ca68cf6135de570782fff15303cd55bb7d4a9377aa2272bcf445ad8e352e455ad75f7c2f69e06cf38e80d86fe1482426'
        'db6a4afbe8a5b9698d160a0f31eb91c8c727eb9f5c2742f15366443537b30b11dd3f25d6598cc01fbc362ab249deccc5d94f338f39bd60ab09e8b5480b4d3fd7'
        'fa3cd15df62613086917aa2270a0ccad957e547b8eb59516aea056b75764f76e18ccf07631caef60ac379b246184eb4cab6071b96df3f28140658efa4a746159'
        'f6903d4b349053177df76f87f935731eb703c19b9ded3b51b62c9fbdd044b5d598d8038954c229e801967aac8332580cf026cb35766501bb6648f610632c7f89')

prepare() {
  cd "${_pkgname}-${_commit}"

  # Revert upstream commit 583e004, which disables game downloads in mainland China.
  patch -Np1 -i "${srcdir}/revert-583e004.patch"
}

build() {
  # Pre-configured Microsoft Azure app credentials for HMCL's Microsoft login feature.
  # These are maintained by the AUR hmcl package maintainer (Misaka13514) to ensure
  # out-of-box functionality for users who cannot register their own Azure application.
  #
  # Registration guide:
  # https://learn.microsoft.com/en-us/entra/identity-platform/quickstart-register-app
  # https://help.minecraft.net/hc/en-us/articles/16254801392141
  export MICROSOFT_AUTH_ID='004be3ca-1c2a-4dc1-b805-d06494b3e968'
  export MICROSOFT_AUTH_SECRET='~mD8Q~J1C4cwiiEoTUdR3XYA96Jobsp.EZEnCauP'

  cd "${_pkgname}-${_commit}"
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  ./gradlew clean build --no-daemon
}

package() {
  # custom launch script
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  # desktop file
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${_pkgname}-${_commit}/${_pkgname}/build"

  # install jar
  _path=$(echo libs/HMCL*.jar)
  install -Dm644 "$_path" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  # install icons
  local _icon _iconfile
  for _icon in 32:icon.png 64:icon@2x.png 128:icon@4x.png 256:icon@8x.png; do
    _iconfile=${_icon#*:}
    _icon=${_icon%:*}
    install -Dm644 "resources/main/assets/img/${_iconfile}" "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
  done
}
