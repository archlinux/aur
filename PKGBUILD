# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Firef0x <Firefgx (at) gmail (dot) com>
# Contributor: sh0 <mee@sh0.org>
# Contributor: Lekensteyn <lekensteyn@gmail.com>

pkgname=smali-git
_gitname=smali
pkgver=2.0.7.1385.0c7e7b7
pkgrel=1
pkgdesc="An assembler/disassembler for Android's dex format"
url="https://github.com/JesusFreke/smali"
arch=('any')
license=('BSD')
depends=('java-runtime' 'bash')
makedepends=('git' 'java-environment' 'gradle')
provides=('smali')
conflicts=('smali')
source=(${pkgname}::git+https://github.com/JesusFreke/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  _version=$(grep -e '^version' build.gradle|cut -d\' -f2)
  printf "%s.%s.%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  for file in baksmali smali; do
    # prevent from printing path on launch
    sed '/echo ${newProg}/d' -i scripts/${file}
    # fix ls path
    sed 's|/bin/ls|/usr/bin/ls|' -i scripts/${file}
  done
}

build() {
  cd ${pkgname}
  gradle --gradle-user-home=. build
}

check() {
  cd ${pkgname}
  gradle --gradle-user-home=. test
}

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/bin"
  for file in baksmali smali; do
    install -Dm 644 "${file}/build/libs/${file}.jar" "${pkgdir}/usr/share/java/${pkgname}/${file}.jar"
    install -Dm 755 scripts/${file} "${pkgdir}/usr/share/java/${pkgname}/${file}"
    ln -s "/usr/share/java/${pkgname}/${file}" "${pkgdir}/usr/bin/${file}"
  done
  install -Dm 644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
