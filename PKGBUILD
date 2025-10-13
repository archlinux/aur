# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

_gitname=Apktool
_java_version=21
pkgname=android-apktool-git
pkgver=2.12.1.r24.g96779b52
pkgrel=3
pkgdesc="a tool for reengineering Android apk files"
arch=(any)
url="https://ibotpeaches.github.io/Apktool/"
license=(Apache)
depends=(bash 'java-runtime>=8' android-sdk-build-tools)
conflicts=(android-apktool)
makedepends=(git jdk${_java_version}-openjdk gradle)
source=("git+https://github.com/iBotPeaches/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  # aapt cannot be found without this line
  export JAVA_HOME=/usr/lib/jvm/java-${_java_version}-openjdk
  export PATH="/opt/android-sdk/build-tools/$(ls -1 /opt/android-sdk/build-tools/ | head -1):$PATH"

  cd "$srcdir/$_gitname"

  # Build (OpenJDK sometimes fails to find aapt)
  ./gradlew build proguard --no-daemon
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}/$_gitname/scripts/linux/apktool" "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}/$_gitname/brut.apktool/apktool-cli/build/libs/apktool-cli.jar" "${pkgdir}"/usr/bin/apktool.jar
}
