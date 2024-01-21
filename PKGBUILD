# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Sven-Hendrik Haase
# Contributor: Thomas Weißschuh

_upstreamname=libnbd
_pkgname="${_upstreamname}-ocaml"
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.19.4+3.r2089.20240120.c73832c
# _majorver="$(awk -F. '{print $1}' <<< "${pkgver}")"
# _minorver="$(awk -F. '{print $2}' <<< "${pkgver}")"
# _nextminorver="$(awk '{print $1+1}' <<< "${_minorver}")"
pkgrel=1
pkgdesc="NBD client library in userspace. Compiled with OCaml bindings. Latest git checkout."
arch=(
  'i686'
  'x86_64'
)
url="https://gitlab.com/nbdkit/libnbd"
license=('LGPL2.1')
depends=(
  'bash'
  'glibc'
  'gnutls'
  'libxml2'
)
makedepends=(
  'autoconf'
  'cargo'
  'fuse3'
  'git'
  'go'
  'ocaml'
  'perl'
  'ubdsrv'
)
optdepends=(
  'bash-completion: For bash completion support.'
  'fuse3: For nbdfuse support.'
  'ocaml: For OCaml bindings.'
  'python>=3: For python bindings.'
  'ubdsrv: For nbdublk.'
)
provides=(
  "${_upstreamname}=${pkgver}"
  "${_upstreamname}-git=${pkgver}"
  "${_upstreamname}-bash-completion=${pkgver}"

  # "cargo-nbd=${pkgver}"
  # "golang-nbd=${pkgver}"
  "ocaml-nbd=${pkgver}"
  "python-nbd=${pkgver}"
)
conflicts=(
  "${_upstreamname}"
  "${_pkgname}"
)
source=(
  "${_upstreamname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)
# LTO breaks linking into OCaml library, e.g. with building the package `virt-v2v`.
options+=('!lto')

prepare() {
  cd "${srcdir}/${_upstreamname}"

  autoreconf -i

  git log > git.log
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

  export CARGO_HOME="${srcdir}/.cargo"
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-fuse \
    --enable-ublk \
    --disable-libfuzzer \
    --enable-ocaml \
    --enable-python \
    --enable-golang \
    --enable-rust \
    --with-gnutls \
    --with-libxml2
  make
}

check() {
  cd "${srcdir}/${_upstreamname}"

  export CARGO_HOME="${srcdir}/.cargo"
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  #make check
}

package() {
  cd "${srcdir}/${_upstreamname}"

  export CARGO_HOME="${srcdir}/.cargo"
  export GOPATH="${srcdir}/.go"
  export GOBIN="${GOPATH}/bin"

  make DESTDIR="${pkgdir}" install

  for _docfile in git.log README.md SECURITY TODO; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/doc/${_upstreamname}/${_docfile}"
  done
  for _licensefile in COPYING.LIB; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}" "${pkgdir}/usr/share/doc/${_upstreamname}/${_licensefile}"
  done
}
