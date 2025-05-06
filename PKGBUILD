# Maintainer: Swâmi Petaramesh <swami AT petaramesh DOT org>

pkgname=rudder-agent
pkgver=8.3.0
pkgrel=1
pkgdesc="Configuration management and audit tool - agent for Rudder managed systems"
arch=('x86_64' 'aarch64')
url="https://www.rudder.io"
license=('GPL-3.0-or-later')
depends=('acl' 'glibc' 'curl' 'gcc-libs' 'pam' 'pcre2' 'readline' 'openssl' 'systemd' 'systemd-libs' 'libxml2' 'libyaml' 'util-linux' 'dmidecode' 'cronie' 'net-tools' 'diffutils' 'perl' 'perl-xml-treepp' 'jq' 'libvirt' 'augeas' 'python' )
makedepends=('base-devel' 'gcc' 'rust' 'unzip' 'git')
install=".install"
source=("rudder-sources-${pkgver}.tar.bz2::https://repository.rudder.io/sources/${pkgver%.*}/rudder-sources-${pkgver}.tar.bz2"
	"git+https://github.com/Normation/rudder-packages.git")
noextract=("rudder-sources-${pkgver}.tar.bz2")
sha256sums=('6719b4270dc26c0d772a0be1e0829083ffb55c0d389fdda73db373fe2986adf5'
            'SKIP')

prepare() {
  cd ${srcdir}/rudder-packages/
  git checkout branches/rudder/${pkgver%.*}
  cd -
  cp rudder-sources-${pkgver}.tar.bz2 ${srcdir}/rudder-packages/rudder-agent/SOURCES/rudder-sources.tar.bz2
  sed -i -E -e "s/^RUDDER_VERSION_TO_PACKAGE =.*$/RUDDER_VERSION_TO_PACKAGE = ${pkgver}/i" \
	  -e 's/^([[:space:]]*)chown root fusion(.*)$/\1# chown root fusion\2/' ${srcdir}/rudder-packages/rudder-agent/SOURCES/Makefile.in
}

build() {
  cd ${srcdir}/rudder-packages/rudder-agent/SOURCES/
  ./configure --disable-apt --without-augeas
  make
}

package() {
  cd ${srcdir}/rudder-packages/rudder-agent/SOURCES/
  make DESTDIR="${pkgdir}/" install
  cp -aR "${pkgdir}/lib" "${pkgdir}/usr/"
  rm -rf "${pkgdir}/lib"
  find "${pkgdir}/opt/rudder/lib/perl5/" -name "*.so" -exec strip --strip-unneeded {} +
}
