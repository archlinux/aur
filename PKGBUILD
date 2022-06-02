# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=gaalop-git
_pkgname=Gaalop
pkgver=r911.d752c334
pkgrel=1
pkgdesc='Geometic Algebra Algorithms Optimizer'
arch=('any')
url='https://github.com/CallForSanity/Gaalop'
license=('GPL3')
depends=('jre8-openjdk')
makedepends=('jdk8-openjdk' 'maven')
source=("${pkgname}::git+https://github.com/CallForSanity/Gaalop"
        'gaalop.desktop'
        'gaalop')
sha256sums=('SKIP'
            'c71c36ccb96d8a48882ea732f8de0de33718d96596e42e67e9de923e623258b7'
            '89614f248e87acda7478bb9b83b7cab9f823a69742a645dedda43f3bd068970e')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    mvn clean package
}

# Build Package
package() {
    cd ${srcdir}
    mkdir -p $pkgdir/usr/bin/
    cp -v gaalop $pkgdir/usr/bin/

    mkdir -p $pkgdir/usr/share/applications
    cp -v *.desktop $pkgdir/usr/share/applications

    cd ${pkgname}
    mkdir -p $pkgdir/usr/share/$_pkgname
    cp -v gui/src/main/resources/de/gaalop/gui/icon.png $pkgdir/usr/share/$_pkgname

    cd distribution/target/distribution-*-bin/
    rm -rv nativeLibraries start.bat

    cp -rv * $pkgdir/usr/share/$_pkgname
}
