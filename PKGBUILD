# Maintainer: dreieck
# Contributors:
#   Radek Podgorny <radek@podgorny.cz>
#   Thomas Haider <t.haider@deprecate.de>

pkgname=postsrsd-git
epoch=1
pkgver=1.11+2.r177.20210713.gafa2ca1
pkgrel=2
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
provides=("postsrsd=${pkgver}")
conflicts=("postsrsd")
arch=(
  'i686'
  'x86_64'
)
depends=(
  'bash'
  'glibc'
  'openssl'
)
makedepends=(
  'cmake'
  'coreutils' # for `base64` and `dd`
  'git'
  'help2man'
)
backup=(
  'etc/postsrsd/postsrsd.conf'
  'etc/default/postsrsd'
)
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=(GPL2)
source=(
  'git+https://github.com/roehling/postsrsd.git'
  "sysusers.d-postsrsd.conf"
  "tmpfiles.d-postsrsd.conf"
  "${install}"
)
sha256sums=(
  'SKIP'
  'f3d61362ed64e9ad33427b23b471c028b613b7eedd51dc01a203c8ba1c0e3427'
  '8613b3c1a6eec65d0137d97781c8919a84879c49be137b48f8bd29ee3b96cd08'
  '996ab88e39abbe2ef870c69624be1f404945545b42c7826b36a25aff8abcb62c'
)
#options=('emptydirs')

pkgver() {
  cd "${srcdir}/postsrsd"
  _ver="$(git describe --tags | sed 's|^[vV]||' | sed -E 's|\-g[0-9a-f]+$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short HEAD)"
  printf '%s\n' "${_ver}.r${_rev}.${_date}.g${_hash}"
}

build() {
  cd "${srcdir}"
  ###sed -e 's|${SYSCONF_DIR}/systemd/system|/usr/lib/systemd/system|g' -i postsrsd/postinstall.cmake.in
  rm -rf build
  mkdir build
  cd build

  cmake ../postsrsd \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGENERATE_SRS_SECRET=OFF \
    -DINIT_FLAVOR=. \
    -DUSE_APPARMOR=OFF \
    -DUSE_SELINUX=OFF

  make all
}

check() {
  cd "${srcdir}/build"
  make test
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install

  #rm -rf ${pkgdir}/usr/lib
  mv -v "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
  sed -e 's/^\(RUN_AS=\)nobody/#\1postsrsd/;s/\(\/etc\/postsrsd\)\(\.secret\)/\1\/postsrsd\2/' \
      -e 's/^\(# is \).*$/\1localhost\.localdomain/' < postsrsd.default > postsrsd.conf
  install -D -v -m644 "postsrsd.conf" "${pkgdir}/etc/postsrsd/postsrsd.conf"
  install -D -v -m644 "postsrsd.systemd" "${pkgdir}/usr/lib/systemd/system/postsrsd.service"
  install -D -v -m644 "${srcdir}/sysusers.d-postsrsd.conf" "${pkgdir}/usr/lib/sysusers.d/postsrsd.conf"
  install -D -v -m644 "${srcdir}/tmpfiles.d-postsrsd.conf" "${pkgdir}/usr/lib/tmpfiles.d/postsrsd.conf"

  for _docfile in README.md README.exim.md README_UPGRADE.md CODE_OF_CONDUCT.md; do
    install -D -v -m644 "${srcdir}/postsrsd/${_docfile}" "${pkgdir}/usr/share/doc/${_docfile}"
  done
  for _exampleexecutable in run_postsrsd_tests.bats ; do
    install -D -v -m755 "${srcdir}/postsrsd/${_exampleexecutable}" "${pkgdir}/usr/share/doc/${_exampleexecutable}"
  done
}
