# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl-dev
_pkgname=hmcl
pkgver=3.3.201
_commit=5edd7a7b72e011a214ac8246561a8866e5e54a15
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular (development version)"
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('java8-openjfx'
         'jdk8-openjdk')
source=("hmcl-launch-script"
        "${_pkgname}.desktop"
        "${_pkgname}-${pkgver}.tgz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b9e66ecda49285fb076f2c383420854b639c56e4bb240e86dbf666f5929dc1a5'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            '9e62ecfc4797836bff48ac9d29ccd671dfd543503e97285f5606e57c453d0c7c')

build() {
  cd "HMCL-${_commit}"
  _java=$(ls /usr/lib/jvm | grep 8-openjdk)
  export JAVA_HOME=/usr/lib/jvm/$_java
  sh gradlew build
}

package() {
  # custom launch script
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/$_pkgname"
  # desktop file
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "HMCL-${_commit}/HMCL/build"

  # install jar
  _path=$(echo libs/HMCL*.jar)
  install -Dm644 $_path "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  # install icon
  install -Dm644 "resources/main/assets/img/craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
}
