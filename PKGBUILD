# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: MarkWalters.pw <archlinux@markwalters.pw>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Tony Lambiris <tony@critialstack.com>

pkgbase=apt
pkgname=('apt' 'apt-docs')
pkgver=2.2.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://packages.debian.org"
license=('GPL2')
makedepends=('cmake' 'dpkg' 'docbook-xsl' 'doxygen' 'git' 'gtest' 'w3m' 'triehash'
             'perl-text-wrapi18n' 'perl-locale-gettext' 'perl-yaml-tiny'
             'perl-term-readkey' 'perl-sgmls' 'perl-module-build' 'perl-unicode-linebreak' 'perl-pod-parser' 'po4a' 'xxhash')
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' "apt-utils")
source=("git+https://salsa.debian.org/apt-team/apt.git#tag=${pkgver}"
	"https://github.com/mquinson/po4a/releases/download/v0.60/po4a-0.60.tar.gz")
sha256sums=('SKIP'
            'c8d9c28758fa007e8e2989b5820c55910a6533dab581208d0c8acf4d43027b59')

build() {
  # arch linux's po4a is too new to build apt, so build an older version
  # will likely be good to use system po4a when it's updated in sid
  msg2 "Building po4a 0.60..."
  cd "$srcdir/po4a-0.60"
  perl Build.PL installdirs=vendor create_packlist=0
  LC_ALL=en_US.UTF-8 perl Build
  [[ "$PATH" =~ /usr/bin/vendor_perl ]] || export PATH="$PATH:/usr/bin/vendor_perl"

  msg2 "Building apt..."
  cd "$srcdir/$pkgname"

  # docbook xsl is stored with the version on Arch
  DOCBOOK_XSL_VER=`ls -d /usr/share/xml/docbook/xsl-stylesheets-* | sort | head -1 | xargs basename`

  cmake -B build \
  	-DCMAKE_INSTALL_PREFIX="/usr" \
  	-DCMAKE_INSTALL_LIBDIR="lib" \
  	-DCMAKE_INSTALL_LIBEXECDIR="lib" \
	-DDOCBOOK_XSL="/usr/share/xml/docbook/${DOCBOOK_XSL_VER}-nons"

  sed -i -e "s|stylesheet/docbook-xsl|$DOCBOOK_XSL_VER=t|" build/doc/*.xsl
  sed -i -e "s|stylesheet/nwalsh|$DOCBOOK_XSL_VER=|" build/doc/*.xsl

  make -C build all
}

package_apt() {
  depends=('gnupg' 'curl' 'libseccomp' 'perl' 'xxhash')
  pkgdesc="Command-line package manager used on Debian-based systems"
  cd "$srcdir/$pkgbase"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/doc"
  find "$pkgdir/usr/share/man" -type d -empty -delete
}

package_apt-docs() {
  arch=('any')
  pkgdesc="Documentation for apt"
  cd "$srcdir/$pkgbase"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/var
  rm -rf "${pkgdir}"/usr/{bin,include,lib}
  rm -rf "${pkgdir}"/usr/share/{bash-completion,locale,man}
}

# vim:set ts=2 sw=2 et:
