# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl-dev
_pkgname=hmcl
pkgver=3.5.3.221
_commit=edd89fb040e658a53b931f40abecc81d9ac59de3
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular (development version)"
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('java-openjfx'
         'jdk-openjdk')
makedepends=(git)
source=("hmcl-launch-script"
        "${_pkgname}.desktop"
        "git+https://github.com/huanghongxun/HMCL.git#commit=${_commit}")
sha256sums=('7c67cac5c940d26e6657118dcea832a435a675df03cb73ef7c735b42dbcd8923'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            'SKIP')

build() {
  cd HMCL
  _java=$(ls /usr/lib/jvm | grep 18-openjdk)
  export JAVA_HOME=/usr/lib/jvm/$_java
  sh gradlew --no-daemon build
}

package() {
  # custom launch script
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/$_pkgname"
  # desktop file
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd HMCL/HMCL/build

  # install jar
  _path=$(echo libs/HMCL*.jar)
  install -Dm644 $_path "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  # install icon
  install -Dm644 "resources/main/assets/img/craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
}
