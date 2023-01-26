# Maintainer : Ahmed Moselhi <ahmedmoselhi55@gmail.com>

# Build notes:
# https://phoenicisorg.github.io/phoenicis/Users/build/

pkgname=phoenicis-playonlinux
_pkgname=phoenicis
pkgver=5.0.r2884.f9f749b46
_pkgver=5.0-snapshot
pkgrel=1
pkgdesc="Phoenicis PlayOnLinux allows you to install and use non-native applications on linux"
arch=('any')
url="https://github.com/PhoenicisOrg/phoenicis.git"
license=('LGPL3')
makedepends=('maven' 'java-environment-openjdk=11' 'git')
depends=('cabextract' 'curl' 'icoutils' 'imagemagick'
         'p7zip' 'unzip' 'wget' 'wine' 'xterm')
options=(!strip)
source=(git+https://github.com/PhoenicisOrg/${_pkgname})
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
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
  cd "${srcdir}/${_pkgname}/phoenicis-dist/target/Phoenicis_5.0-SNAPSHOT"
  cp -a usr "${pkgdir}"
}
