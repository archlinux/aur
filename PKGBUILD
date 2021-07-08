# Maintainer: kageru <kageru at encode dot moe>
_pkgname=ki-shell
_srcdir=kotlin-interactive-shell
pkgname=ki-shell-git
pkgver=0.3.3.r14.g0cc592d
pkgrel=1
pkgdesc="Kotlin Language Interactive Shell"
arch=('any')
url='https://github.com/Kotlin/kotlin-interactive-shell'
license=('Apache')
depends=('sh' 'java-runtime>=8')
makedepends=('maven' 'awk' 'kotlin>=1.4.32')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_srcdir}::git+https://github.com/Kotlin/kotlin-interactive-shell.git")
sha256sums=('SKIP')

# Build against system Kotlin version because upstream is very slow to update
_kotlin_version="$(kotlin -version | awk '{ split($3, a, "-"); print a[1] }')"

build() {
  cd "${_srcdir}"
  echo "#!/bin/sh
java -jar /usr/lib/${_pkgname}/${_pkgname}.jar" > ki
  mvn -Dkotlin.version=${_kotlin_version} -DskipTests package
}

pkgver() {
  cd "${_srcdir}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "${_srcdir}"
  install -Dm644 "lib/${_pkgname}.jar" -t "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm755 "ki" -t "${pkgdir}/usr/bin"
}
