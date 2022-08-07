# Maintainer : Thanos Apostolou <thanosapostolou@outlook.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0_snapshot
_pkgver=5.0-snapshot
pkgrel=1
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://www.phoenicis.org/"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11' 'git')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
commit=1d3957a8c03218167c7f6472afc6b4a72f5e2da6
source=("$pkgname-$pkgver.zip::https://github.com/PhoenicisOrg/${_pkgname}/archive/$commit.zip")
sha256sums=('763794a0f776bc3626448793dc96803f828696638123fe5c9b914bebf67fd7fc')

build() {
  cd "${_pkgname}-$commit"
  if test -d "/usr/lib/jvm/java-11-openjdk"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
  elif test -d "/usr/lib/jvm/java-11-jdk11"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-jdk11"
  elif test -d "/usr/lib/jvm/java-11-adoptopenjdk"; then
    export JAVA_HOME="/usr/lib/jvm/java-11-adoptopenjdk"
  fi
  mvn clean package
  cd phoenicis-dist/src/scripts
  bash phoenicis-create-package.sh
}

package() {
  cd "${_pkgname}-$commit/phoenicis-dist/target/Phoenicis_5.0-SNAPSHOT"
  cp -a usr "${pkgdir}"
}
