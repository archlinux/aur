# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist-git
pkgver=2.0.0alpha0.r529.g7031f5945
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL-2.0-only')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            '851cf71ad389679c2936a8a3c90c4d629d28206a0ca31a785073d83a358ad90c871d0e68deab09d595189cc6e4d9b43f269541f61b72d3b42bfc42d1975ec48b')
makedepends=('boost' 'cargo' 'clang' 'git' 'meson' 'lld' 'pandoc' 'python-virtualenv' 'python-yaml' 'ragel' 'systemd')
depends=('fstrm' 'gnutls' 'libbpf' 'libcap' 'libedit' 'libnghttp2' 'libsodium' 'libsystemd' 'libxdp' 'lmdb' 'luajit' 'net-snmp' 'openssl' 'quiche' 're2' 'tinycdb')
provides=('dnsdist')
conflicts=('dnsdist')
# We are actually enabling LTO via meson, but the -flto=auto option set up by makepkg conflicts with our -flto=thin
options=(!lto)

pkgver() {
  cd "${pkgname}"
  git describe --tags --match 'dnsdist-*' | sed 's/dnsdist-//;s/.\(\(rc\|alpha\|beta\)\d*\)/\1/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Note that adding RUSTFLAGS="-Z cf-protection=full" does not help with the
  # "ELF file ('usr/bin/dnsdist') lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK" warning
  # because Rust's standard library does not ship with CET enabled by default:
  # https://doc.rust-lang.org/beta/unstable-book/compiler-flags/cf-protection.html
  CC=clang \
  CXX=clang++ \
  CXX_LD=lld \
  CC_LD=lld \
  meson setup "${pkgname}/pdns/dnsdistdist" build \
    --prefix        /usr \
    --libexecdir    lib \
    --sbindir       bin \
    --auto-features enabled \
    --wrap-mode     nodownload \
    -Ddebug=true \
    -Doptimization=3 \
    -Db_lto=true \
    -Db_lto_mode=thin \
    -Db_pie=true \
    -Dauto-var-init=zero \
    -Ddns-over-http3=true \
    -Ddns-over-https=true \
    -Ddns-over-tls=true \
    -Ddns-over-quic=true \
    -Ddnscrypt=enabled \
    -Ddnstap=enabled \
    -Debpf=enabled \
    -Dfuzz-targets=true \
    -Dre2=enabled \
    -Dreproducible=true \
    -Dsnmp=true \
    -Dunit-tests=true \
    -Dxsk=enabled \
    -Dyaml=enabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/dnsdist.conf"
}
