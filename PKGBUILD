# Maintainer:  Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Tony Lambiris <tony@critialstack.com>

pkgname=apt
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line package manager used on Debian-based systems"
arch=('i686' 'x86_64')
url="https://packages.debian.org"
license=('GPL2')
depends=('gnupg' 'curl' 'xz')
makedepends=('cmake' 'dpkg' 'docbook-xsl' 'doxygen' 'git' 'po4a' 'gtest' 'w3m' 'triehash')
checkdepends=()
optdepends=()
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' "apt-utils")
conflicts=(apt-git)
replaces=(apt-git)
backup=()
options=()
install=
changelog=
source=("git+https://salsa.debian.org/apt-team/apt.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  # docbook xsl is stored with the version on Arch
  DOCBOOK_XSL_VER=`ls -d /usr/share/xml/docbook/xsl-stylesheets-* | xargs basename`

  cmake \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DDOCBOOK_XSL="/usr/share/xml/docbook/${DOCBOOK_XSL_VER}" \
	.

  sed -i -e "s|stylesheet/docbook-xsl|$DOCBOOK_XSL_VER=t|" doc/*.xsl
  sed -i -e "s|stylesheet/nwalsh|$DOCBOOK_XSL_VER=|" doc/*.xsl

  make -j $(nproc) all
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
