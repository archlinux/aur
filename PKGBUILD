# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl-dev
_pkgname=hmcl
pkgver=3.5.3.222
_commit=19b6633f4a01f2a94a240a5563cd9bf72418f6b3
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular (development version)"
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('java17-openjfx')
makedepends=(git)
source=("hmcl-launch-script"
        "${_pkgname}.desktop"
        "git+https://github.com/huanghongxun/HMCL.git#commit=${_commit}")
sha256sums=('b55d4a3bfa0136eee0c63c4c796a7a7ffb95a0a82442ceab3c0e97fb141c3b2b'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            'SKIP')

build() {
  cd HMCL
  _java=$(ls /usr/lib/jvm | grep 17-openjdk)
  export JAVA_HOME=/usr/lib/jvm/$_java
  export GRADLE_OPTS="-Xmx1g"
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
