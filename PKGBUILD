# Maintainer: Swâmi Petaramesh <swami AT petaramesh DOT org>

pkgname=rudder-agent
pkgver=9.0.0
pkgrel=5
pkgdesc='Configuration management and audit tool - agent for Rudder managed systems'
arch=('x86_64' 'aarch64')
url='https://www.rudder.io'
license=('GPL-3.0-or-later')
depends=('acl' 'glibc' 'curl' 'gcc-libs' 'pam' 'pcre2' 'readline' 'openssl' 'systemd'
	'systemd-libs' 'libxml2' 'libyaml' 'util-linux' 'dmidecode' 'cronie' 'net-tools'
	'diffutils' 'perl' 'perl-xml-treepp' 'jq' 'libvirt' 'augeas' 'python' 'lmdb')
makedepends=('base-devel' 'gcc' 'rust' 'unzip' 'git' 'clang' 'patchelf')
install='.install'
#
# For released sources
source=("rudder-packages-${pkgver}::git+https://github.com/Normation/rudder-packages.git#branch=branches/rudder/${pkgver%.*}"
	"rudder-sources-${pkgver}.tar.bz2::https://repository.rudder.io/sources/${pkgver%.*}/rudder-sources-${pkgver}.tar.bz2")
#
# For nightly sources
# source=("rudder-packages-${pkgver}::git+https://github.com/Normation/rudder-packages.git#branch=branches/rudder/${pkgver%.*}"
# 	"rudder-sources-${pkgver}.tar.bz2::https://repository.rudder.io/sources/${pkgver%.*}-nightly/rudder-sources-${pkgver}.tar.bz2")
noextract=("rudder-sources-${pkgver}.tar.bz2")
sha256sums=('SKIP'
            '6bfb76e97fcb59ff84c11aca463cff182b27f9aa3eaa46bc21348f9c83c14868')

prepare() {
  # Example using the souces tarball without further patching
  mv rudder-sources-${pkgver}.tar.bz2 ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/rudder-sources.tar.bz2
  touch ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/rudder-sources.tar.bz2
  #
  # Example applying patch only to cfengine source code
  # cp ${srcdir}/../9901_cfengine_manjaro-os.patch ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/patches/cfengine/
  #
  # Untarring source tarball for applying additional build patches
  # tar -jf ${srcdir}/../rudder-sources-${pkgver}.tar.bz2 -C ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/ -x
  # Move extracted source dir to final build location
  # mv ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/rudder-sources-${pkgver} ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/rudder-sources
  # Applying patches to source tree
  # patch -d ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES -p1 < ${srcdir}/../9902_cfengine_manjaro-os.patch || exit 1
  # Touch source tree so it appears more recent than anything else here
  # touch ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/rudder-sources/rudder-sources
  #
  # Edit Makefile.in to
  # - Update package version to build
  # - Comment out downloading of source code and overwriting it, as we already provided it
  sed -i -E -e "s/^RUDDER_VERSION_TO_PACKAGE =.*$/RUDDER_VERSION_TO_PACKAGE = ${pkgver}/i" \
	  -e 's/^([[:space:]]*)chown root fusion(.*)$/\1# chown root fusion\2/' \
	  ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/Makefile.in
  #
  # Edit Makefile.in to
  # - Update package version to build
  # - Comment out downloading of source code and overwriting it, as we already provided it
  # sed -i -E -e "s/^RUDDER_VERSION_TO_PACKAGE =.*$/RUDDER_VERSION_TO_PACKAGE = ${pkgver}/i" \
  #         -e 's/^([[:space:]]*)chown root fusion(.*)$/\1# chown root fusion\2/' \
  #         -e 's/^rudder-sources: rudder-sources.tar.bz2/rudder-sources:/' \
  #         -e 's/^([[:space:]]*)bunzip2 < rudder-sources.tar.bz2(.*)$/\1# bunzip2 < rudder-sources.tar.bz2\2/' \
  #         -e 's/^([[:space:]]*)(mv rudder-sources-\$\(RUDDER_VERSION_TO_PACKAGE\)\*\/ rudder-sources\/)(.*)$/\1# \2\3/' \
  #         ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/Makefile.in
}

build() {
  cd ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/
  ./configure --disable-apt --without-augeas
  make
}

package() {
  cd ${srcdir}/rudder-packages-${pkgver}/rudder-agent/SOURCES/
  make DESTDIR="${pkgdir}/" install
  chmod 700 "${pkgdir}/var/rudder/reports/ready/"
  chmod 700 "${pkgdir}/var/rudder/tmp/"
  cp -aR "${pkgdir}/lib" "${pkgdir}/usr/"
  rm -rf "${pkgdir}/lib"
  rm -rf "${pkgdir}/opt/rudder/share/man"
  find "${pkgdir}/opt/rudder/lib/perl5/" -name "*.so" -exec strip --strip-unneeded {} +
  for _executable in $(find "${pkgdir}/opt/rudder/bin/" "${pkgdir}/opt/rudder/lib/" -type f -executable) ; do
  	if _old_rpath="$(patchelf --print-rpath ${_executable} 2>/dev/null)" && \
		echo "${_old_rpath}" | grep -q "${srcdir}"; then
  		_new_rpath=$(echo "$_old_rpath" | tr ':' '\n' | grep -v "${srcdir}" | paste -sd:)
  		patchelf --set-rpath "$_new_rpath" ${_executable}
  	fi
  done
  install -d -m 0755 -o root -g root "${pkgdir}/opt/rudder/share/doc/server-patches"
  install -m 0644 -o root -g root ${srcdir}/../9900_rudder-server_postinstall_cfengine_paths.patch "${pkgdir}/opt/rudder/share/doc/server-patches/"
}
