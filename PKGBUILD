# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: MarkWalters.pw <archlinux@markwalters.pw>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Tony Lambiris <tony@critialstack.com>

pkgbase=apt
pkgname=('apt' 'apt-docs')
pkgver=2.5.3
pkgrel=1
arch=('i686' 'x86_64')
url='https://salsa.debian.org/apt-team/apt'
license=('GPL2')
makedepends=('cmake' 'dpkg' 'docbook-xsl' 'doxygen' 'git' 'gtest' 'w3m' 'triehash'
             'perl-text-wrapi18n' 'perl-locale-gettext' 'perl-yaml-tiny'
             'perl-term-readkey' 'perl-sgmls' 'perl-module-build' 'perl-unicode-linebreak' 'perl-pod-parser' 'po4a' 'xxhash' 'gnupg')
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' 'apt-utils')
source=("https://salsa.debian.org/apt-team/apt/-/archive/$pkgver/apt-$pkgver.tar.bz2")
sha512sums=('f24789ac9502a0c9e5e2597e24142ca61f34a2a364771001349121d2bdc37b2a20395ec1afa0098a01d0c384f8d4fe9554ea8af2fe6064bd11c3db10e68131f6')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  # docbook xsl is stored with the version on Arch
  DOCBOOK_XSL_VER=$(find /usr/share/xml/docbook/xsl-stylesheets-* -maxdepth 1 -type d| sort | head -1 | xargs basename)

  cmake -B build \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DCMAKE_INSTALL_LIBEXECDIR='lib' \
    -DDOCBOOK_XSL="/usr/share/xml/docbook/${DOCBOOK_XSL_VER}-nons"

  sed -i -e "s|stylesheet/docbook-xsl|$DOCBOOK_XSL_VER=t|" build/doc/*.xsl
  sed -i -e "s|stylesheet/nwalsh|$DOCBOOK_XSL_VER=|" build/doc/*.xsl

  make -C build all
}

package_apt() {
  depends=('systemd-libs' 'libseccomp' 'perl' 'xxhash')
  pkgdesc='Command-line package manager used on Debian-based systems'
  cd "$srcdir/$pkgbase-$pkgver"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/doc"
  find "$pkgdir/usr/share/man" -type d -empty -delete
}

package_apt-docs() {
  arch=('any')
  pkgdesc='Documentation for apt'
  cd "$srcdir/$pkgbase-$pkgver"
  make -C build DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/var
  rm -rf "${pkgdir}"/usr/{bin,include,lib}
  rm -rf "${pkgdir}"/usr/share/{bash-completion,locale,man}
}

# vim:set ts=2 sw=2 et:
