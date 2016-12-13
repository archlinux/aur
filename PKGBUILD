# Maintainer:  Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Tony Lambiris <tony@critialstack.com>

pkgname=apt-git
pkgver=1.4_beta2.r2.gf47f4b1
pkgrel=1
pkgdesc="Command-line package manager used on Debian-based systems (git-latest)"
arch=('i686' 'x86_64')
url="http://packages.debian.org"
license=('GPL2')
depends=('gnupg' 'curl' 'xz')
makedepends=('cmake' 'dpkg' 'docbook-xsl' 'doxygen' 'po4a' 'gtest' 'w3m')
checkdepends=()
optdepends=()
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' "apt-utils")
conflicts=(apt)
replaces=(apt)
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://anonscm.debian.org/git/apt/apt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  # docbook xsl is stored with the version on Arch
  DOCBOOK_XSL_VER=$(pacman -Q docbook-xsl | sed 's/docbook-xsl //;s/\-.*//')

  cmake \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib" \
	-DDOCBOOK_XSL="/usr/share/xml/docbook/xsl-stylesheets-${DOCBOOK_XSL_VER}" \
	.

  _stylesheet=`ls -d /usr/share/xml/docbook/xsl-stylesheets-* | xargs basename`
  sed -i -e "s|stylesheet/docbook-xsl|$_stylesheet|" doc/*.xsl
  sed -i -e "s|stylesheet/nwalsh|$_stylesheet|" doc/*.xsl

  make -j $(nproc) all
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
