# Maintainer: David Manouchehri <d@32t.ca>
# Contributor (original PKGBUILD): Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>

pkgname=android-apktool-git
pkgver=20131101
pkgrel=1
pkgdesc="a tool for reengineering Android apk files"
arch=('i686' 'x86_64')
url="https://code.google.com/p/android-apktool/"
license=('Apache 2.0')
depends=('java-runtime' 'android-sdk-build-tools' 'jdk7') # sadly openjdk does not work
conflicts=('android-apktool')
makedepends=('git')

_gitroot=https://github.com/iBotPeaches/Apktool
_gitname=apktool
_gitbranch=wip-2.0

build() {
  # Copied this bit from one of the examples, thanks to whoever made it
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" -b "$_gitbranch"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Build (this is the part where openjdk fails)
   ./gradlew build fatJar proguard
}

package() {
  cd "$srcdir/$_gitname-build"
  mkdir -p "${pkgdir}"/usr/bin
  install -m 0755 "${srcdir}/$_gitname-build/scripts/linux/apktool" "${pkgdir}"/usr/bin
  install -m 0644 "${srcdir}/$_gitname-build/brut.apktool/apktool-cli/build/libs/apktool"*"small.jar" "${pkgdir}"/usr/bin/apktool.jar
}
