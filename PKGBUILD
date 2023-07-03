# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: MarsSeed <marcell.meszaros@runbox.eu>

_py="python2"
_pkg="libxml2"
pkgname="${_py}-${_pkg}"
pkgver=2.9.14
_pkgver=2.9.10
pkgrel=1
pkgdesc='XML parsing library, version 2'
_url="https://gitlab.gnome.org/GNOME/${_pkg}"
url="${_url}/-/wikis/home"
arch=(
  x86_64
  aarch64
  i686
  pentium4
  armv7h
  armv6l
)
license=(MIT)
depends=(
  icu
  ncurses
  "${_py}"
  "${_pkg}=${_pkgver}"
  readline
  xz
  zlib
)
makedepends=(
  git
)
_commit=7846b0a677f8d3ce72486125fa281e92ac9970e8  # tags/v2.9.14^0
_w3_tests="https://www.w3.org/XML/Test/xmlts20130923.tar.gz"
source=(
  "${pkgname}::git+${_url}.git#commit=$_commit"
  no-fuzz.diff # Do not run fuzzing tests
  "${_w3_tests}"
)
sha256sums=(
  'SKIP'
  '3fc010d8c42b93e6d6f1fca6b598a561e9d2c8780ff3ca0c76a31efabaea404f'
  '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f'
)

pkgver() {
  cd "${pkgname}"
  git describe --tags \
    | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  local _msg="Use xmlconf from conformance test suite"
  mkdir -p build
  ln -s xmlconf build/xmlconf || echo "${_msg}"

  cd "${pkgname}"

  # Take patches from https://src.fedoraproject.org/rpms/libxml2/tree/master
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ "${src}" = *.diff ]] || continue
    echo "Applying patch ${src}..."
    git apply -3 "../${src}"
  done

  autoreconf -fiv
}

build() (
  local _configure="../${pkgname}/configure"
  local _configure_opts=(
    --prefix=/usr
    --with-threads
    --with-history
    --with-python="/usr/bin/${_py}"
    --with-icu
  )
  local _cflags=(
    "-I/usr/include/${_pkg}-2.9"
  )
  local _ldflags=(
    "-L/usr/lib/${_pkg}-2.9"
  )

  cd build

  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
    "../${pkgname}/configure" "${_configure_opts[@]}"

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool

  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
    make

  find doc -type f -exec chmod 0644 {} +
)

check() {
  CFLAGS="${_cflags[*]}" \
  LDFLAGS="${_ldflags[*]}" \
  make -C build check
}

package() {
  make DESTDIR="${pkgdir}" -C build install
  "${_py}" -m compileall \
           -d /usr/lib "${pkgdir}/usr/lib"
  "${_py}" -O \
           -m compileall \
           -d /usr/lib "${pkgdir}/usr/lib"

  install -Dm 644 build/COPYING \
          -t "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/include/${_pkg}/libxml"
  rm -rf "${pkgdir}/usr/lib/cmake"
  rm -rf "${pkgdir}/usr/lib/${_pkg}"*
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/lib/xml2Conf.sh"
  rm -rf "${pkgdir}/usr/share/aclocal"
  rm -rf "${pkgdir}/usr/share/doc/${_pkg}"
  rm -rf "${pkgdir}/usr/share/doc/${_pkg}-python-${pkgver}"
  rm -rf "${pkgdir}/usr/share/gtk-doc/html/${_pkg}"
  rm -rf "${pkgdir}/usr/share/man/man1"
  rm -rf "${pkgdir}/usr/share/man/man3"
}

# vim: ts=2 sw=2 et:
