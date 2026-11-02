# Contributor: prurigro <prurigro at gmail dot com>
# Contributor: Rorschach <r0schach at lavabit dot com>
# Maintainer:  max.bra <max dot bra at alice dot it>

pkgname=ipscan
pkgver=3.12.0
pkgrel=1
pkgdesc='Angry IP Scanner (or simply ipscan) is an open-source and cross-platform network scanner designed to be fast and simple to use. It scans IP addresses and ports as well as has many other features.'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://angryip.org'
depends=('java-runtime>=21')
makedepends=('java-environment>=21')

[[ $CARCH == "i686" ]] && _intarch=linux
[[ $CARCH == "x86_64" ]] && _intarch=linux64

source=(ipscan ipscan.desktop build.gradle.patch \
  "https://github.com/angryip/${pkgname}/archive/refs/tags/${pkgver}.zip")

sha512sums=('e2caf62412c35a7a29128d0ae176aca1e4a45cf81e44b76e4bb23ad1c0633fa8833d674d7d514942a170ab54223b6c4a93ab458f2736107e7bbe9a5e806a7c5e'
            'c17db5e4ac90af8675e9ac2a8e77f1322beb8bacb578a288bcfbf8da67270004ec40314b2793ea8ed8eeeeb64f9c03b3f80694e38c55be9d213486b825689a0f'
            '8ec4aae1b2226af984e58acd20ddc7d78268ab53a1f39cb6c85143741638727cf94794597bb9755483968c5f93e37cc96c33c61527529c074782f9447914399a'
            '1949c471c25e94ea596041a897763a31bcf9a03e093d349a415633cfb5a73f4a2ce0ace37e0c46f06802cbdedacd58afb37a8b0015125cf4ff302ae81429661e')

# prefer jdk21, otherwise the system default JDK
_javahome() {
  if [[ -d /usr/lib/jvm/java-21-openjdk ]]; then
    echo /usr/lib/jvm/java-21-openjdk
  else
    readlink -f /usr/lib/jvm/default
  fi
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch < ../build.gradle.patch
  sed -i "s|^version = .*|version = '${pkgver}'|" build.gradle
  sed -i -E "s|^( *'Version':) version,|\1 '${pkgver}',|g" build.gradle
  # bundled Gradle 9.5 and ProGuard 7.8.1 handle up to Java 25; Java 27 needs Gradle 9.8.0+ and ProGuard 7.10+
  local _jver=$(sed -n 's/^JAVA_VERSION="\([0-9]*\).*/\1/p' "$(_javahome)/release")
  if (( _jver > 25 )); then
    sed -i "s|gradle-.*-bin.zip|gradle-9.8.2-bin.zip|" gradle/wrapper/gradle-wrapper.properties
    sed -i "s|com.guardsquare:proguard-gradle:[0-9.]*|com.guardsquare:proguard-gradle:7.10.0|" build.gradle
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset _JAVA_OPTIONS
  export JAVA_HOME="$(_javahome)"
  GRADLE_USER_HOME="${srcdir}" ./gradlew current
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 resources/images/icon256.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 build/libs/ipscan-*-${pkgver}-$_intarch.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
