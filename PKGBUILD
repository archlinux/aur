# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>

pkgname=umldesigner
pkgver=8.0.0
pkgrel=1
pkgdesc="Graphical tooling to edit and visualize UML models"
arch=('i686' 'x86_64')
url="http://www.umldesigner.org/"
license=('EPL')
makedepends=('maven' 'ruby')
changelog=changelog
source=("https://github.com/ObeoNetwork/UML-Designer/archive/${pkgver}.tar.gz" "umldesigner.desktop")
sha256sums=('60cc5e13b1d3e909139fd5731e30576fa3c8b2aa2edd5dc61de6d06858394928' 'SKIP')

prepare() {
  # TODO: The dependencies are broken, so we need to add it here. That is
  # not the fine art of packaging and need to be removed as fasts as passible.
  gem install jekyll
  gem install jekyll-paginate
  gem install jekyll-gist
  gem install pygments.rb
  gem install RedCloth
  export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
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
  #mvn clean verify

  # Build uml designer products
  #mvn clean package -f releng/org.obeonetwork.dsl.uml2.product.parent/pom.xml
}

package() {
  install -dm755 "$pkgdir/usr/share/applications/"
  install -dm755 "$pkgdir/usr/bin/"
  install -Dm755 "$srcdir/umldesigner.desktop" "$pkgdir/usr/share/applications/"

  ln -s "/opt/UMLDesigner/UMLDesigner" "${pkgdir}/usr/bin/UMLDesigner"
}
