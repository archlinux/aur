# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Based on Fedora's packaging
_fedora_rel=13.beta.12.6.fc21

pkgname=werken-xpath
pkgver=0.9.4
pkgrel=4
pkgdesc="XPath implementation using JDOM"
arch=(any)
url="http://sourceforge.net/projects/werken-xpath/"
license=(Apache)
depends=(java-jdom1)
makedepends=(antlr2 apache-ant java-xml-commons-external xerces2-java)
source=("http://kojipkgs.fedoraproject.org//packages/werken-xpath/${pkgver}/${_fedora_rel}/src/werken-xpath-${pkgver}-${_fedora_rel}.src.rpm")
sha512sums=('ea58195dd2ae7b3601df61f3df6268348f3e3f6fc65e974d4db0fe55cbba04415672674cc7d6ba013e8ab897978342f25cbfd957bfb2ebb6c9028f0a65ab1514')

build() {
  tar xvf werken-xpath-0.9.4.tar.xz

  cd werken-xpath-${pkgver}

  # Apply Fedora's patches
  for i in $(grep ^Patch ../werken-xpath.spec | \
             awk -F '%{name}' '{print $2}'); do
    patch -p0 -i "../${pkgname}${i}"
  done

  find . -name '*.jar' -o -name '*.class' -delete

  cp ../werken-xpath-${pkgver}.pom .

  export CLASSPATH="/usr/share/java/jdom/jdom.jar:/usr/share/java/antlr2.jar"
  ant -Dbuild.compiler=modern package compile-test
  #ant package
}

check() {
  cd werken-xpath-${pkgver}
  export CLASSPATH="${CLASSPATH}:./build/werken.xpath.jar:build/test/classes"
  sh runtests.sh
}

package() {
  cd werken-xpath-${pkgver}

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 build/werken.xpath.jar "${pkgdir}/usr/share/java/"
}
