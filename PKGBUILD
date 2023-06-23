# Maintainer: Simon Mangel <simon dot mangel dot sm at gmail dot com>

_pkgname="RWTH Mensaplan CLI"
pkgname="rwth-mensaplan-git"
pkgver=1.0.777d9e9
pkgrel=1
pkgdesc="An (unofficial) CLI for the cafeteria menues of RWTH Aachen University"
arch=("x86_64")
url="https://github.com/MangelWare/Mensaplan"
license=("MIT")
depends=('sh' 'java-runtime')
makedepends=('git' 'java-environment')
source=("git+https://github.com/MangelWare/Mensaplan.git#branch=master"
        "mensaplan.sh")
sha256sums=('SKIP'
            '99f4b1b335d31cc8bb2eb7147d67b2c7f59ec4cf10bb83cdd9c3bf95e1dfd6ee')

pkgver() {
	cd Mensaplan
	printf %s.%s \
    $(./mvnw help:evaluate -Dexpression=project.version -q -DforceStdout | grep -v Warning) \
    $(git rev-parse --short HEAD)
}

build() {
  cd Mensaplan
  ./mvnw clean install
}

package() {
  install -Dm755 mensaplan.sh "${pkgdir}"/usr/bin/mensaplan

  cd Mensaplan
  install -Dm755 target/mensaplan-*-jar-with-dependencies.jar "${pkgdir}"/usr/share/java/${pkgname}/mensaplan.jar
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
