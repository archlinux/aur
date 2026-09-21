# Maintainer: Danilo Falcão <danilo@falcao.org>
pkgname=bind-utils-standalone
pkgver=9.21.26
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
  'liburcu'
  'json-c'
  'libxml2'
  'lmdb'
  'krb5'
)
makedepends=('git' 'python-sphinx' 'meson' 'ninja')
provides=('bind-tools')
conflicts=('bind' 'bind-tools')
options=('!emptydirs')
source=("git+https://gitlab.isc.org/isc-projects/bind9.git#tag=v${pkgver}")
sha256sums=('d437b2abc88de4c206bdc911c7837bda17f37409b936ef337a5bee44a46e1ade')

# Client tools to keep
_tools=(dig host nslookup nsupdate delv mdig)

build() {
  cd bind9
  meson setup build \
    --prefix=/usr \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    -Dgeoip=disabled \
    -Ddnstap=disabled
  ninja -C build
}

package() {
  cd bind9

  # Full install into a staging directory, then cherry-pick what we need
  DESTDIR="${srcdir}/staging" meson install -C build

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

  # Install license (from the BIND source tree, keeping the AUR repo minimal)
  install -Dm644 "${srcdir}/bind9/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/bind9/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}

