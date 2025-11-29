# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=ntpd-rs-git
pkgver=r2899.g5a02a816
pkgrel=1
pkgdesc='A full-featured implementation of the Network Time Protocol, including NTS support, written in Rust.'
url='https://github.com/pendulum-project/ntpd-rs'
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
license=('Apache-2.0')
provides=(ntpd-rs)
conflicts=(
	ntpd-rs
	ntpd-rs-git
)
replaces=(ntpd-rs ntpd-rs-git)
changelog=CHANGELOG
source=(
  ${pkgname}::git+https://github.com/pendulum-project/ntpd-rs.git
  'ntpd-rs.service'
  'ntpd-rs-metrics.service')
backup=('etc/ntpd-rs/ntp.toml')
b2sums=('SKIP'
        '3bddde4990de7c1fb2b792cb2847d51ca00d00283bc337ab4b8786c2459cf0f0e62bc80cc09d4d76267e723e8c17a032c9d000d20e9ca8ba0a5eb2a6a1d980cd'
        '80355c29433138805efd4acbdb6c684a206afae43f75466d3996c100dea534d099049131279ad8d1e5c80ebaa6792b7101cccad91d085e5630c5356c295a3c22')

pkgver(){
  cd "${srcdir}/${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUST_BACKTRACE=1
  export CFLAGS+=" -ffat-lto-objects"

  cargo build --release --locked --target x86_64-unknown-linux-gnu
}

package() {
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ntpd-rs.service ntpd-rs-metrics.service
  echo "ntpd-rs.service" | install -Dm 644 /dev/stdin "${pkgdir}/usr/lib/systemd/ntp-units.d/50-ntpd-rs.list"

  cd "${srcdir}/${pkgname}"

  install -Dm644 docs/examples/conf/ntp.toml.default "${pkgdir}/etc/ntpd-rs/ntp.toml"
  install -Dm755 -t "${pkgdir}/usr/bin" target/x86_64-unknown-linux-gnu/release/{ntp-daemon,ntp-ctl,ntp-metrics-exporter}

  install -Dm755 -t "${pkgdir}/usr/share/man/man8" docs/precompiled/man/{ntp-daemon.8,ntp-ctl.8,ntp-metrics-exporter.8}
  install -Dm755 -t "${pkgdir}/usr/share/man/man5" docs/precompiled/man/ntp.toml.5
}
