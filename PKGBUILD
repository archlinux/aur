# Maintainer: Danilo Falcão <danilo@falcao.org>
pkgname=bind-utils-standalone
pkgver=9.20.27
pkgrel=1
pkgdesc="DNS client utilities from BIND: dig, host, nslookup, nsupdate, delv, mdig"
arch=('x86_64')
url="https://www.isc.org/software/bind/"
license=('MPL-2.0')
depends=(
  'glibc'
  'openssl'
  'libedit'
  'libidn2'
  'jemalloc'
  'zlib'
  'libnghttp2'
  'libuv'
  'libcap'
  'liburcu'
)
makedepends=('git' 'python-sphinx')
optdepends=('krb5: GSSAPI authentication for nsupdate')
provides=('bind-tools')
conflicts=('bind' 'bind-tools')
options=('!emptydirs')
source=("git+https://gitlab.isc.org/isc-projects/bind9.git#tag=v${pkgver}")
sha256sums=('a23a762a4cc591f28b6aa7fa5fe446996ee514e01cd69ec962110df705c4721b')

# Client tools to keep
_tools=(dig host nslookup nsupdate delv mdig)

prepare() {
  cd bind9
  autoreconf -fiv
}

build() {
  cd bind9
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-static \
    --with-openssl \
    --with-libidn2 \
    --without-json-c \
    --without-libxml2 \
    --without-lmdb \
    --without-maxminddb \
    --disable-geoip \
    --disable-dnsrps
  make
}

package() {
  cd bind9

  # Full install into a staging directory, then cherry-pick what we need
  make DESTDIR="${srcdir}/staging" install

  # Install only client tool binaries
  install -dm755 "${pkgdir}/usr/bin"
  for tool in "${_tools[@]}"; do
    install -Dm755 "${srcdir}/staging/usr/bin/${tool}" "${pkgdir}/usr/bin/${tool}"
  done

  # Install shared libraries (required by the tools at runtime)
  install -dm755 "${pkgdir}/usr/lib"
  for lib in "${srcdir}"/staging/usr/lib/*.so*; do
    [[ -L "${lib}" ]] && cp -d "${lib}" "${pkgdir}/usr/lib/"
    [[ -f "${lib}" && ! -L "${lib}" ]] && install -Dm755 "${lib}" "${pkgdir}/usr/lib/$(basename "${lib}")"
  done

  # Install man pages for client tools
  install -dm755 "${pkgdir}/usr/share/man/man1"
  for tool in "${_tools[@]}"; do
    if [[ -f "${srcdir}/staging/usr/share/man/man1/${tool}.1" ]]; then
      install -Dm644 "${srcdir}/staging/usr/share/man/man1/${tool}.1" \
        "${pkgdir}/usr/share/man/man1/${tool}.1"
    fi
  done

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}

