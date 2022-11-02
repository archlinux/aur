# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <ruben.deisenroth@stud.tu-darmstadt.de>

pkgname=jagr-git
_pkgname=Jagr
pkgver=r381.c47745b
pkgrel=2
pkgdesc='Java AutoGrader, implemented in Kotlin'
arch=('any')
url='https://github.com/sourcegrade/jagr'
license=('AGPL-3.0')
depends=('jre-openjdk')
makedepends=()
conflicts=('jagr-bin')
source=("${pkgname}::git+https://github.com/sourcegrade/jagr.git" "jagr")
sha256sums=('SKIP' 'SKIP')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  chmod +x "${srcdir}/${pkgname}/gradlew"
  rm -f "${srcdir}/${pkgname}/build/libs/"*.jar
}

build() {
  cd "${srcdir}/${pkgname}"
  ./gradlew build
  mv "${srcdir}/${pkgname}/build/libs/"*.jar "${srcdir}/${pkgname}/build/libs/${_pkgname}.jar"
}

# Build Package
package() {
    ## save current working directory
    cd "${srcdir}/${pkgname}"
    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Create Package Directory
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    # Copy Files
    install -Dm644 "build/libs/${_pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${_pkgname}.jar"

    mkdir -p $pkgdir/usr/bin
    ## restore working directory
    install -Dm755 "${srcdir}/jagr" "${pkgdir}/usr/bin/jagr"
}
