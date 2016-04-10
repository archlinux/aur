# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# umldesigner-git
# Contributing: https://gitlab.com/aur-ci/umldesigner-git.git
# Builds: https://gitlab.com/aur-ci/umldesigner-git/builds
#pkgbase=
pkgname=umldesigner-git

# Version
pkgver=6.0.0.r52.gcd3eb24
pkgrel=1
#epoch=

# Generic
pkgdesc="Graphical tooling to edit and visualize UML models - Git version"
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
#changelog=changelog

# Sources
source=("git+https://github.com/ObeoNetwork/UML-Designer.git" "umldesigner.desktop")
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=('')
#md5sums_i686=('')
#md5sums_x86_64=('')
#sha1sums=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "UML-Designer"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  gem install jekyll --version '= 1.5.1'
  gem install RedCloth
  export PATH="$PATH":~/.gem/ruby/$(ruby --version|cut -f2 -d' '|cut -f1 -d'p')/bin
}

build() {
  # Build documentation web site
  cd UML-Designer/documentation
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
    cp -r "${srcdir}/UML-Designer/packaging/org.obeonetwork.dsl.uml2.product\
/target/products/org.obeonetwork.dsl.uml2.branding.product/linux/gtk/x86" "${pkgdir}/opt/"
  elif [[ "$CARCH" == "x86_64" ]]; then
    cp -r "${srcdir}/UML-Designer/packaging/org.obeonetwork.dsl.uml2.product\
/target/products/org.obeonetwork.dsl.uml2.branding.product/linux/gtk/x86_64" "${pkgdir}/opt/"
  fi
  ln -s "/opt/UMLDesigner/UMLDesigner" "${pkgdir}/usr/bin/UMLDesigner"
}
