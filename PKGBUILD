# Maintainer: David Manouchehri <d@32t.ca>
# Contributor (original PKGBUILD): Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=android-apktool-git
_gitname=Apktool
_gitbranch=wip-2.0
_gitauthor=iBotPeaches
pkgver=2.0.0.Beta9.g251a6bb
pkgrel=1
pkgdesc="a tool for reengineering Android apk files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/android-apktool/"
license=('Apache 2.0')
depends=('java-runtime' 'android-sdk-build-tools')
conflicts=('android-apktool')
makedepends=('git' 'jdk7') # openjdk does not work for some unknown reason
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # This is a heck of a line, but I found it way the only way of getting the version number properly
  printf "$(grep "def apktoolversion_major" build.gradle | sed "s/.*'\(.*\)'.*/\1/").$(grep "def apktoolversion_minor" build.gradle | sed "s/.*'\(.*\)'.*/\1/").$(git describe | sed -n -e 's/^.*-//p')"
}

build() {
  cd "$srcdir/$_gitname"

  # Build (this is the part where openjdk fails)
   ./gradlew build fatJar proguard # proguard isn't needed, but makes the binary a little bit smaller
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}/$_gitname/scripts/linux/apktool" "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}/$_gitname/brut.apktool/apktool-cli/build/libs/apktool"*"small.jar" "${pkgdir}"/usr/bin/apktool.jar
}
