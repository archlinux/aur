# Maintainer: dreieck
_pkgname=libusbpp
pkgname="${_pkgname}-hg"
pkgver=date20170116_r24.8797ece29e62
pkgrel=1
pkgdesc="A simple C++ wrapper around libusb providing some additional convenience functions."
arch=('i686' 'x86_64')
url="http://bitbucket.org/stativ/libusbpp"
license=('GPL3')
depends=(
  'libusb'
)
makedepends=(
  'cmake'
  'mercurial'
)
provides=(
  "${_pkgname}"
  "testhid-hg"
  "testhid"
)
conflicts=(
  "${_pkgname}"
  "testhid-hg"
  "testhid"
)
source=(
  "${_pkgname}::hg+http://bitbucket.org/stativ/libusbpp"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver='latest'
  _date="$(hg log -l 1 -b . -T '{date|shortdate}' | tr -d '-')"
  _rev="$(hg identify -n)"
  _hash="$(hg identify -i)"

  # if [ -z "${_ver}" ]; then
  #   printf "%s %s." "Error in 'pkgver()': Could not determine" "version" > /dev/stderr
  #   return 11
  # fi
  if [ -z "${_date}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "latest commit date" > /dev/stderr
    return 13
  fi
  if [ -z "${_rev}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "commit count" > /dev/stderr
    return 12
  fi
  if [ -z "${_hash}" ]; then
    printf "%s %s." "Error in 'pkgver()': Could not determine" "global revision ID" > /dev/stderr
    return 14
  fi

  printf "date%s_r%s.%s" "${_date}" "${_rev}" "${_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Creating mercurial commit log ..."
  hg log -b . --style changelog > "ChangeLog-mercurial.txt"
}

build() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Running 'cmake' ..."
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_COLOR_MAKEFILE=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON

  msg2 "Running 'make' ..."
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Installation of main software.
  msg2 "Running 'make install' ..."
  make DESTDIR="${pkgdir}/" install

  # Install documentation
  msg2 "Inatalling documentation ..."
  for _docfile in ChangeLog-mercurial.txt README; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  # Install license file.
  msg2 "Installing license file ..."
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
  install -Dvm644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER.txt"
}
