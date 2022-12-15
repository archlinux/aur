# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=trust-dns-git
pkgver=0.22.0.r74.ge045743b
pkgrel=1
pkgdesc='Safe and secure authoritative DNS server'
arch=('x86_64')
url=https://trust-dns.org/
license=('MIT' 'Apache')
depends=('openssl')
makedepends=('git' 'cargo')
provides=('dns' 'dnskey-to-pem' 'get-root-ksks' 'pem-to-public-dnskey' 'trust-dns')
conflicts=('trust-dns' 'trust-dns-server')
backup=('etc/trust-dns/trust-dns.toml')
source=("$pkgname::git+https://github.com/bluejekyll/trust-dns.git#branch=main"
        'avoid-dns-over-https.patch'
        'trust-dns.sysusers'
        'trust-dns.toml'
        'trust-dns.service'
        'trust-dns.tmpfiles'
        'LICENSE-MIT'
        'LICENSE-APACHE')
b2sums=('SKIP'
        '4a17618671f6c9081bea19bcc65f90486fe876f9a2aada50a2241558b10eb62c32bbf29a399995b5d42a7bade6eb56733b1e73a1f9e54c5b88877828ad23a7c6'
        'b90629179b80f55cc8a2aad132c1e5286c6b799bb4522d94775096922860b3551f6a9dba02cfb6ed23641d8f69e7c9203783f78a4ecd30d08853893c9345d664'
        'd6a0bcc9994ff79181614ffe1a8b3c6c32f2936b2d41d6433adf4884d8afcca15867c2f72f9218a2d00e0edc0220503160c77fabed055d165c04a60406e31088'
        '496f5fad51db7bcd56c91fa5ae116dde79545de3dabd2794562179f3ee1c42590934d0c1c0b066d442982e67ce83662d36016dc8d513059cb7f6b5e3ce0d4100'
        'c440a924aca26f182c5e33b023ec227f67164a21ded61dd955f18fd10daeff27316449cc9f786ed696ea8bf9679ddbe2edc93a1dfccfd71e25c388b062162823'
        '6d9441ed33b024144ad01f16ffe0ca8959411654423e8a569db1595f7c954d0a031e02e9676f0a749e15b1e45b4fb22b96478da0676c4ca1e32267460698bf0a'
        'c2ea204fbf96ce09717327aed989dffaf8a536d96e578a14ecd245b4496afce25ef0f0d4e65c0f3c0c22910b350da1492aa44b9e902d6ca1eea8eca4c0c5b061')
pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/v//;s/-/.r/;s/-/./'
}
prepare() {
  cd $pkgname
  patch -Np1 -i ../"avoid-dns-over-https.patch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}
check() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}
package() {
  mkdir -p "$pkgdir/etc/trust-dns"
  mkdir -p "$pkgdir/var/lib/trust-dns"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/dns"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/dnskey-to-pem"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/get-root-ksks"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/pem-to-public-dnskey"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname/target/release/trust-dns"
  install -Dm644 "${srcdir}/trust-dns.sysusers" "${pkgdir}/usr/lib/sysusers.d/trust-dns.conf"
  install -Dm644 "${srcdir}/trust-dns.toml" "${pkgdir}/etc/trust-dns/trust-dns.toml"
  install -Dm644 "${srcdir}/trust-dns.service" "$pkgdir/etc/systemd/system/trust-dns.service"
  install -Dm644 "${srcdir}/trust-dns.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/trust-dns.conf"
  install -Dm644 "${srcdir}/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 "${srcdir}/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
