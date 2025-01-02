# Maintainer: Devilish Crow <devilishcrow@mail14.serv00.net>
pkgname=openscap-git
pkgver=1.4
pkgrel=1
pkgdesc="NIST Certified SCAP 1.2 toolkit"
arch=('x86_64')
url="https://www.open-scap.org/tools/openscap-base/"
license=('LGPL-2.1-only')
depends=('dbus' 'acl' 'util-linux' 'libcap' 'curl' 'libgcrypt' 'libxml2' 'libxslt' 
	'attr' 'openldap' 'pcre2' 'perl' 'python3' 'rpm' 'swig' 'bzip2' 'yaml-cpp' 'xmlsec')
makedepends=('git' 'cmake' 'gcc')
provides=('openscap')
conflicts=('openscap')
source=("git+https://github.com/OpenSCAP/openscap.git")
sha256sums=('SKIP')

pkgver() {
    cd openscap
    git describe --long --tags | sed 's/-/./g' | sed 's/^v//'
}

build() {
  local cmake_options=(
    -B build
    -S openscap
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
 
  cd build
  make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
