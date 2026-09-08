# Maintainer: Jeff Cook <jeff@jeffcook.io>

pkgname=libvslvm-git
_pkgname=libvslvm
pkgver=20260901.r0.g80bbcdd
pkgrel=1
pkgdesc="Library and tools to access Linux Logical Volume Manager (LVM) volumes"
arch=('x86_64')
url="https://github.com/libyal/libvslvm"
license=('LGPL-3.0-or-later')
depends=('fuse3' 'python')
makedepends=('autoconf' 'automake' 'gettext' 'git' 'libtool' 'pkgconf' 'python-setuptools')
provides=("libvslvm=${pkgver}")
conflicts=('libvslvm')
source=(
  'libvslvm::git+https://github.com/libyal/libvslvm.git'
  'libbfio::git+https://github.com/libyal/libbfio.git'
  'libcdata::git+https://github.com/libyal/libcdata.git'
  'libcerror::git+https://github.com/libyal/libcerror.git'
  'libcfile::git+https://github.com/libyal/libcfile.git'
  'libclocale::git+https://github.com/libyal/libclocale.git'
  'libcnotify::git+https://github.com/libyal/libcnotify.git'
  'libcpath::git+https://github.com/libyal/libcpath.git'
  'libcsplit::git+https://github.com/libyal/libcsplit.git'
  'libcthreads::git+https://github.com/libyal/libcthreads.git'
  'libfcache::git+https://github.com/libyal/libfcache.git'
  'libfdata::git+https://github.com/libyal/libfdata.git'
  'libfvalue::git+https://github.com/libyal/libfvalue.git'
  'libuna::git+https://github.com/libyal/libuna.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --always \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # Upstream's sync script normally clones these during prepare(). Point it at
  # makepkg's declared sources so the build phase performs no network fetches.
  sed -i \
    -e "s|^GIT_URL_PREFIX=.*|GIT_URL_PREFIX=\"file://${srcdir}\";|" \
    -e 's|/${LOCAL_LIB}\.git|/${LOCAL_LIB}|' \
    synclibs.sh

  ./synclibs.sh
  ./autogen.sh
}

build() {
  cd "${_pkgname}"
  ./configure \
    --prefix=/usr \
    --enable-python \
    --enable-wide-character-type \
    --with-libbfio=no
  make
}

check() {
  cd "${_pkgname}"
  make check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install

  # Neither libtool metadata nor a static Python extension is useful at runtime.
  find "${pkgdir}" -type f \( -name '*.la' -o -name '*.a' \) -delete
}
