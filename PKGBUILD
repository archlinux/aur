# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Sven-Hendrik Haase
# Contributor: Thomas Weißschuh

_upstreamname=libnbd
_pkgname=ocaml-nbd
pkgname="${_pkgname}-git"
pkgver=1.18.0+2.r2050.20230928.42a8518
_majorver="$(awk -F. '{print $1}' <<< "${pkgver}")"
_minorver="$(awk -F. '{print $2}' <<< "${pkgver}")"
_nextminorver="$(awk '{print $1+1}' <<< "${_minorver}")"
pkgrel=1
pkgdesc="OCaml bindings for libnbd."
arch=(
  'i686'
  'x86_64'
)
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL')
depends=(
  'glibc'
  "libnbd>=${_majorver}.${_minorver}"
  "libnbd<${_majorver}.${_nextminorver}"
  'ocaml'
)
makedepends=(
  'autoconf'
  'git'
  'perl'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_upstreamname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_upstreamname}"

  autoreconf -i
}

pkgver() {
  cd "${srcdir}/${_upstreamname}"

  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_upstreamname}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-fuse \
    --disable-ublk \
    --disable-libfuzzer \
    --enable-ocaml \
    --disable-python \
    --disable-golang \
    --disable-rust

  make
}

check() {
  cd "${srcdir}/${_upstreamname}"

  make -C ocaml check
}

package() {
  cd "${srcdir}/${_upstreamname}"

  make DESTDIR="${pkgdir}" -C ocaml install

  # /usr/share/man/man3/libnbd-ocaml.3.gz is already installed by `libnbd`, although it is built without OCaml support. So we remove it here to avoid conflict.
  rm -fv "${pkgdir}/usr/share/man/man3/libnbd-ocaml"*
}
