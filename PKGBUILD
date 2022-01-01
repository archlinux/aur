# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Lin Ruoshui <LinRs at users.noreply.github dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=hmcl-dev
_pkgname=hmcl
pkgver=3.5.2.215
_commit=ebe880bd39825efc0cbfb1a2a78e4b55c09d188e
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular (development version)"
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
provides=('hmcl')
conflicts=('hmcl')
depends=('java8-openjfx'
         'jdk8-openjdk')
makedepends=(git)
source=("hmcl-launch-script"
        "${_pkgname}.desktop"
        "git://github.com/huanghongxun/HMCL.git#commit=${_commit}"
        "git://github.com/huanghongxun/JSTUN.git#commit=08ab1f8483aba307931494e695e27cbde0cc2657")
sha256sums=('b9e66ecda49285fb076f2c383420854b639c56e4bb240e86dbf666f5929dc1a5'
            '5780cf70f1afec0eb3cd8fc43297d361903c7204e274a28c5edf9b8ac3eea83e'
            'SKIP'
            'SKIP')

prepare() {
  cd HMCL
  git submodule init
  git config submodule.JSTUN.url "$srcdir/JSTUN"
  git submodule update
}

build() {
  cd HMCL
  _java=$(ls /usr/lib/jvm | grep 8-openjdk)
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
