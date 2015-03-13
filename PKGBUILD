# Maintainer: David Manouchehri <d@32t.ca>
# Contributor (original PKGBUILD): Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=android-apktool-git
_gitname=Apktool
_gitbranch=master
_gitauthor=iBotPeaches
pkgver=2.0.0.RC4.r20.gbbc6023
pkgrel=1
pkgdesc="a tool for reengineering Android apk files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/android-apktool/"
license=('Apache 2.0')
depends=('java-runtime' 'android-sdk-build-tools')
conflicts=('android-apktool')
makedepends=('git' 'java-environment') # openjdk has had issues in the past, be warned!
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
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
   ./gradlew build fatJar proguard # proguard isn't needed, but makes the binary a little bit smaller
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}/$_gitname/scripts/linux/apktool" "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}/$_gitname/brut.apktool/apktool-cli/build/libs/apktool"*"small.jar" "${pkgdir}"/usr/bin/apktool.jar
}
