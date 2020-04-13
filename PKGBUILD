# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

_gitname=Apktool
pkgname=android-apktool-git
pkgver=2.2.4.r5.g2f387288
pkgrel=2
pkgdesc="a tool for reengineering Android apk files"
arch=(any)
url="https://ibotpeaches.github.io/Apktool/"
license=(Apache)
depends=(bash 'java-runtime>=8' android-sdk-build-tools)
conflicts=(android-apktool)
makedepends=(git 'java-environment>=8' gradle) # openjdk has had issues in the past, be warned!
source=("git+https://github.com/iBotPeaches/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  pacman -Qs openjdk &> /dev/null && printf "\033[31;1mWarning, there has been issues in the past with OpenJDK and apktool. Please install Oracle's JDK before marking the package as broken.\n\033[0m\n"

  # aapt cannot be found without this line
  PATH="/opt/android-sdk/build-tools/$(ls -1 /opt/android-sdk/build-tools/ | head -1):$PATH"

  cd "$srcdir/$_gitname"

  # Build (OpenJDK sometimes fails to find aapt)
  gradle build proguard --no-daemon
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}/$_gitname/scripts/linux/apktool" "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}/$_gitname/brut.apktool/apktool-cli/build/libs/apktool"*"small.jar" "${pkgdir}"/usr/bin/apktool.jar
}
