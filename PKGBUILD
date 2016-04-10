# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# umldesigner
# Contributing: https://gitlab.com/aur-ci/umldesigner.git
# Builds: https://gitlab.com/aur-ci/umldesigner/builds
#pkgbase=
pkgname=umldesigner

# Version
pkgver=6.0.0
pkgrel=1
#epoch=

# Generic
pkgdesc="Graphical tooling to edit and visualize UML models"
arch=('i686' 'x86_64')
url="http://www.umldesigner.org/"
license=('EPL')
#groups=()

# Dependencies
#depends=('')
#optdepends=()
makedepends=('maven' 'ruby')
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=actor
changelog=changelog

# Sources
source=("https://github.com/ObeoNetwork/UML-Designer/archive/${pkgver}.tar.gz" "umldesigner.desktop")
#source_i686=()
#source_x86_64=()
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=('')
#sha1sums=()
sha256sums=('d79d0113e0913ecb638b59964c0c2031e6fc1de3c29c37c433c0fd4b4798ba80' 'SKIP')

#pkgver() {
#}

prepare() {
  gem install jekyll --version '= 1.5.1'
  gem install RedCloth
  export PATH="$PATH":~/.gem/ruby/$(ruby --version|cut -f2 -d' '|cut -f1 -d'p')/bin
}

build() {
  # Build documentation web site
  cd UML-Designer-${pkgver}/documentation
  jekyll build
  cd ../
  # Integrate the documentation to Eclipse
  rm -rf plugins/org.obeonetwork.dsl.uml2.design.doc/html
  cp -r documentation/_site plugins/org.obeonetwork.dsl.uml2.design.doc/html
  # Build uml designer
  mvn clean verify
  # Build uml designer products
  mvn clean package -f releng/org.obeonetwork.dsl.uml2.product.parent/pom.xml
}

#check() {
#}

package() {
  install -dm755 "$pkgdir/usr/share/applications/"
  install -dm755 "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/umldesigner.desktop" "$pkgdir/usr/share/applications/"
  if [[ "$CARCH" == "i686" ]]; then
    cp -r "${srcdir}/UML-Designer-${pkgver}/packaging/org.obeonetwork.dsl.uml2.product\
/target/products/org.obeonetwork.dsl.uml2.branding.product/linux/gtk/x86" "${pkgdir}/opt/"
  elif [[ "$CARCH" == "x86_64" ]]; then
    cp -r "${srcdir}/UML-Designer-${pkgver}/packaging/org.obeonetwork.dsl.uml2.product\
/target/products/org.obeonetwork.dsl.uml2.branding.product/linux/gtk/x86_64" "${pkgdir}/opt/"
  fi
  ln -s "/opt/UMLDesigner/UMLDesigner" "${pkgdir}/usr/bin/UMLDesigner"
}
