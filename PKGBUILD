# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Chris O'Donnell <christopher.p.odonnell@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=clojure
pkgname=clojure-git
pkgver=1.11.0.alpha2.r1.gb8132f92
pkgrel=1
pkgdesc='LISP dialect for the JVM (development version)'
url='http://clojure.org'
arch=('i686' 'x86_64')
license=('CPL')
install=clojure-git.install
source=('git+https://github.com/clojure/clojure.git'
        'clj'
        'clojure.sh')
sha256sums=('SKIP'
            '0d0f9e7db77f4b5f507ee18e140c29138b7bff5c4ca9d0b963dfd657c6e3c157'
            'b3fa6257dad10fb39851e87563269b80b2473623126595d9c279bbd90e97f052')
depends=('java-environment' 'sh')
makedepends=('git' 'ant' 'maven')
optdepends=('leiningen: automate clojure projects'
            'rlwrap: friendly shell with readline support')
provides=('clojure')
conflicts=('clojure')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/^clojure.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Use maven to download and configure dependencies for ant.
  ./antsetup.sh
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Build it!
  ant jar
}

check() {
  cd "${srcdir}/${_pkgname}"

  # Run the test suite.
  ant test
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  install -Dm644 clojure.jar "${pkgdir}/usr/share/clojure/clojure.jar"
  install -Dm755 "${srcdir}/clj" "${pkgdir}/usr/bin/clj"

  # Install shell runtime files.
  install -Dm755 "${srcdir}/clojure.sh" "${pkgdir}/etc/profile.d/clojure.sh"
}
