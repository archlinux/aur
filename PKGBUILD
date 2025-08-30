# Maintainer: kj_sh604

_modulename="libxml2"
_pyruntime=python2
pkgname="${_pyruntime}-${_modulename}"
pkgver=2.9.14
pkgrel=3
pkgdesc='Python 2 bindings for the XML parsing library v2'
_url="https://gitlab.gnome.org/GNOME/${_modulename}"
url="${_url}/-/wikis/home"
arch=(x86_64 aarch64 i686 armv7h)
license=(MIT)
depends=(
  glibc
  libxml2-legacy
  "${_pyruntime}"
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
sha256sums=('1a3880e1aeb825134f2dd61c5393a5a4529a8ba861dd1ba8e43bbb42f0f9102f'
            '3fc010d8c42b93e6d6f1fca6b598a561e9d2c8780ff3ca0c76a31efabaea404f'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

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
    --with-python="/usr/bin/${_pyruntime}"
    --with-icu
  )
  local _cflags=(
    "-I/usr/include/${_modulename}-2.9"
  )
  local _ldflags=(
    "-L/usr/lib/${_modulename}-2.9"
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

package() {
  make DESTDIR="${pkgdir}" -C build install
  "${_pyruntime}" -m compileall \
           -d /usr/lib "${pkgdir}/usr/lib"
  "${_pyruntime}" -O \
           -m compileall \
           -d /usr/lib "${pkgdir}/usr/lib"

  install -Dm 644 build/COPYING \
          -t "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/include/${_modulename}/libxml"
  rm -rf "${pkgdir}/usr/lib/cmake"
  rm -rf "${pkgdir}/usr/lib/${_modulename}"*
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/lib/xml2Conf.sh"
  rm -rf "${pkgdir}/usr/share/aclocal"
  rm -rf "${pkgdir}/usr/share/doc/${_modulename}"
  rm -rf "${pkgdir}/usr/share/doc/${_modulename}-${_pyruntime}-${pkgver}"
  rm -rf "${pkgdir}/usr/share/gtk-doc/html/${_modulename}"
  rm -rf "${pkgdir}/usr/share/man/man1"
  rm -rf "${pkgdir}/usr/share/man/man3"
}

# vim: ts=2 sw=2 et:
