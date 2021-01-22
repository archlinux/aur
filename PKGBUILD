# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=picard-tools
pkgver=2.24.1
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=(x86_64)
url="https://github.com/broadinstitute/picard"
license=(MIT)
depends=('java-runtime=8')
makedepends=(gradle)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/broadinstitute/picard/archive/${pkgver}.tar.gz")
sha256sums=('90a81f5df465d874e1b5a28a0fb4e2efafb872b5d5e0d726b8a81d3b6f9bb04b')

prepare(){
  cd picard-${pkgver}

  # disable git repo check
  sed -i '/file(".git").isDirectory() || (file(".git").exists() && file(".git").text.startsWith("gitdir"))/c\true' -i build.gradle
  
  # make the launch script
  cat <<EOF > picard
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/picard-tools/picard.jar' "\$@"
EOF
}

build() {
  cd picard-${pkgver}
  gradle shadowJar
}

check(){
  cd picard-${pkgver}
  gradle test
}

package() {
  cd picard-${pkgver}

  install -Dt "${pkgdir}"/usr/share/java/picard-tools -m644 build/libs/picard.jar
  install -Dt "${pkgdir}"/usr/bin -m755 picard

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE.txt
}
