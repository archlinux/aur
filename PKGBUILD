# Maintainer: dreieck
# Contributor: BrainDamage

_pkgname="authsae"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=1.3.1+r440.20190806.73f31dd
epoch=5
pkgdesc="Authsae provides secure password-based authentication for 802.11s mesh networking."
arch=('x86' 'x86_64')
url="https://github.com/cozybit/${_pkgname}"
license=("BSD")
depends=("openssl" "libconfig")
makedepends=("git" "cmake")
provides=("authsae")
conflicts=("authsae")
md5sums=("SKIP")
source=("${_pkgname}::git+https://github.com/cozybit/authsae.git")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^v||' | sed 's|\-[^-]*$||' | tr '-' '_')"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  else
    error "Could not determine version."
    return 1
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  msg2 "Removing '-Werror' from 'CMakeLists.txt'"
  sed -e 's|\-Werror||' -i CMakeLists.txt
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Configuring with 'cmake' ..."
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DENABLE_LINUX_TARGETS=ON \
    .

  # FIXME: the cmake script does something very wrong and attempts to install the config file in prefix+/etc, submit patch to upstream to allow to change that
  msg2 "Fixing a cmake script fault: Place config in '/etc/', not '/usr/etc/' ..."
  sed -i 's|/usr/etc/|/etc|' cmake_install.cmake

  msg2 "Running 'make' ..."
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  for _docfile in 'PORTING.md' 'README.md'; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
}
