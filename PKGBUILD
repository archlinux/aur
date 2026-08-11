# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dane_without_root"
backup=(etc/dane-proxy/dane-proxy.conf)
pkgver='0.1.32'
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'riscv64')
pkgdesc="Provide multiples DANE tools that does not use the root '.' DNS server for validation"
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
depends=(
  dnssec_without_root
  openssl
  libgcc 
  glibc
)
makedepends=(cargo git curl pkgconf openssl)
sha256sums=('8168b97023e57546966e6317d7fdac7c64f0b279405414536b2c5b543e5d0761')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root?signed#tag=dane-${pkgver}")
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
backup=(
'etc/dane-proxy/dane-proxy.conf'
)
install='proxy_certificate.install'

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false 

# Use LTO 
export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export CFLAGS+=' -ffat-lto-objects'

prepare() {
    cd "$srcdir/dane_without_root"
    cargo fetch --locked
    cargo install cargo-c
}
build() {
   cd "$srcdir/dane_without_root"
   cargo build --frozen --release --bin dane-without-root-client --features client,logging,tofu
   cargo build --frozen --release --bin dane-without-root-proxy --features proxy,logging,tofu
   cargo cinstall --frozen --release --lib --features tofu --destdir=./target/release/ --prefix=/usr
}
check() {
    cd "$srcdir/dane_without_root"
    DANE_WITHOUT_ROOT_SYSTEM_VALID_DOMAIN_FILE=./implementation/valid_dane_domain.txt \
    DNSSEC_WITHOUT_ROOT_DIRECTORY=./dnssec_keys/usr/share/dnssec-keys/ \
    cargo test --frozen --release --features logging,capi,wrapper_rustls,wrapper_openssl,client,tofu
}
package() {
   cd "$srcdir/dane_without_root/implementation/"
   install -vDm 0644 dane-proxy.service -t             "$pkgdir"/usr/lib/systemd/system
   install -vDm 0644 dane-proxy.sysusers               "$pkgdir"/usr/lib/sysusers.d/dane-proxy.conf
   install -vDm 0644 dane-proxy.tmpfiles               "$pkgdir"/usr/lib/tmpfiles.d/dane-proxy.conf
   install -vDm 0644 dane-without-root-client.1        "$pkgdir"/usr/share/man/man1/dane-without-root-client.1
   install -vDm 0644 dane-without-root-proxy.1         "$pkgdir"/usr/share/man/man1/dane-without-root-proxy.1
   install -vDm 0755 -t "$pkgdir/usr/bin/"             "../target/release/$pkgname-proxy"
   install -vDm 0755 -t "$pkgdir/usr/bin/"             "../target/release/$pkgname-client"
   install -vDm 0644 -t "$pkgdir/usr/include/"         ../target/release/usr/include/dane_without_root/dane_without_root.h
   install -vDm 0644 -t "$pkgdir/usr/lib/"             ../target/release/usr/lib/libdane_without_root.so.0.1.32
   install -vDm 0644 -t "$pkgdir/usr/lib/"             ../target/release/usr/lib/libdane_without_root.a
   install -vDm 0644 -t "$pkgdir/usr/lib/pkgconfig/"   ../target/release/usr/lib/pkgconfig/dane_without_root.pc
   install -vdm 0755 "$pkgdir"/etc/dane-proxy
   install -vDm 0644 dane-proxy.conf                   "$pkgdir"/etc/dane-proxy/dane-proxy.conf
   install -vDm 0644 valid_dane_domain.txt -t          "$pkgdir"/usr/share/dane-without-root
   ln -sf "/usr/lib/libdane_without_root.so.0.1.32"    "$pkgdir/usr/lib/libdane_without_root.so.0.1"
   ln -sf "/usr/lib/libdane_without_root.so.0.1.32"    "$pkgdir/usr/lib/libdane_without_root.so"
   touch "$pkgdir/etc/dane-proxy/valid_dane_domain.txt"
   touch "$pkgdir/etc/dane-proxy/known_hosts"
}
