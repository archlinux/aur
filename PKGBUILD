# Maintainer: bipin kumar <kbipinkumar@pm.me>

pkgname=mhap
pkgver=2.1.3
pkgrel=2
pkgdesc='A locality-sensitive hashing to detect long-read overlaps. https://doi.org/10.1038/nbt.3238'
arch=('any')
url=https://github.com/marbl/MHAP
license=('Apache')
makedepends=('java-environment' 'maven' 'git' 'python' 'python-sphinx')
depends=('java-runtime')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marbl/MHAP/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9472e966221ecd44f25a4e8664c36e4d618fbdae99c04ba001c36edffd867b5c')

prepare() {
  cd MHAP-${pkgver}/docs
  # use correct sphinx binary location for making manpages
  sed -i 's/sphinx-build-2.7/sphinx-build/g' Makefile 
}

build() {
  cd MHAP-${pkgver}

  # compile pkg
  mvn package
  # compile manpages
  cd docs
  make man
}

package() {
    cd MHAP-${pkgver}/target
    mv mhap-${pkgver}.jar mhap.jar
    # create binary wrapper for jar file
    echo "java -jar /usr/share/$pkgname/mhap.jar" >> $pkgname
    chmod +x ${pkgname}
    # create folders
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mkdir -p ${pkgdir}/usr/share/man/man1/
    # install jar and wrapper
    cp mhap.jar /$pkgdir/usr/share/${pkgname}/
    install -Dm755 $pkgname  $pkgdir/usr/bin/$pkgname
    # install manpages
    cd ../docs/build/man
    mv  minhashalignmentprocessmhap.1 ${pkgdir}/usr/share/man/man1/mhap.1
}
