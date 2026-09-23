# Maintainer:  dreieck
# Contributor: Radek Podgorny <radek@podgorny.cz>
# Contributor: Thomas Haider <t.haider@deprecate.de>

pkgname=postsrsd-git
epoch=1
pkgver=2.4.0+4.r433.20260923.gae0454d
pkgrel=2
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
provides=("postsrsd=${pkgver}")
conflicts=("postsrsd")
arch=(
  'i686'
  'x86_64'
)
depends=(
  'glibc'
  'confuse'
  'hiredis'
  'libseccomp.so'
  'libsqlite3.so'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'coreutils' # for `base64` and `dd`
  'libseccomp'
  'sqlite3'
)
backup=(
  'etc/postsrsd/postsrsd.conf'
  'etc/postsrsd/postsrsd.secret'
)
url="https://github.com/roehling/postsrsd"
install=postsrsd.install
license=("GPL-3.0-only")
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
  'd6bfcfafdbb89adb8e340f652782924cf602de8a84f1026a4c337dd71953d444'
)
options=('emptydirs') # To keep `/var/lib` around, which `postsrsd` uses to `chroot()` into.

prepare() {
  cd "${srcdir}/postsrsd"

  git log > git.log

  if [ -d build ]; then
    rm -rf build
  fi

  cd "${srcdir}"

  # -DINSTALL_SYSTEMD_SYSUSERS=OFF: Install package bundled '/usr/lib/sysusers.d/postsrsd.conf' instead of upstream generated.
  cmake -B build -S postsrsd -G Ninja \
    -DFETCHCONTENT_QUIET=OFF \
    -DFETCHCONTENT_UPDATES_DISCONNECTED=ON \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DCPACK_BINARY_STGZ=OFF \
    -DCPACK_BINARY_TGZ=OFF \
    -DCPACK_BINARY_TZ=OFF \
    -DBUILD_TESTING=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DEXECUTABLE_WITH_ASAN=OFF \
    -DGENERATE_SRS_SECRET=OFF \
    -DINSTALL_SYSTEMD_SERVICE=ON \
    -DINSTALL_SYSTEMD_SYSUSERS=OFF \
    -DSYSTEMD_SYSUSERSDIR=/usr/lib/sysusers.d \
    -DSYSTEMD_UNITDIR=/usr/lib/systemd/system \
    -DWITH_REDIS=ON \
    -DWITH_SECCOMP=ON \
    -DWITH_SQLITE=ON \
    -DUSE_DOMAINS_FILE=OFF \
    -DUSE_DOMAINS_FILE_WATCH=OFF \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -Wno-dev
}

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

  # make -C build all
  cmake --build build
}

check() {
  cd "${srcdir}"

  # make -C build test
  ctest --test-dir build --output-on-failure --parallel $(nproc)
}

package() {
  cd "${srcdir}"
  # make DESTDIR="${pkgdir}/" -C build install
  DESTDIR="${pkgdir}/" cmake --install build

  mv -v "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

  cd "${srcdir}/build"
  install -Dvm644 "postsrsd.conf" "${pkgdir}/etc/postsrsd/postsrsd.conf"
  ### install -Dvm644 "sysusers.d/postsrsd.conf" "${pkgdir}/usr/lib/sysusers.d/postsrsd.conf" # DO NOT install this!, but use below line.
  install -Dvm644 "${srcdir}/sysusers.d-postsrsd.conf" "${pkgdir}/usr/lib/sysusers.d/postsrsd.conf" # Install package bundled '/usr/lib/sysusers.d/postsrsd.conf' instead of upstream generated.
  install -Dvm644 "${srcdir}/tmpfiles.d-postsrsd.conf" "${pkgdir}/usr/lib/tmpfiles.d/postsrsd.conf"

  cd "${srcdir}/postsrsd"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/postsrsd" git.log CHANGELOG.rst README.rst doc/packaging.rst
}
