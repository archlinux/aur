# Maintainer: SoftExpert <softexpert at gmail dot com>

pkgname=ntpd-rs-git
_pkgname=ntpd-rs
pkgver=r3119.gcc4e20bf
pkgrel=2
pkgdesc='A full-featured implementation of the Network Time Protocol, including NTS support, written in Rust.'
url='https://github.com/pendulum-project/ntpd-rs'
arch=('x86_64')
depends=('gcc-libs' 'glibc' 'libgcc')
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
  'ntpd-rs-metrics.service'
  'ntpd-rs.sysuser'
  'ntpd-rs.dinit'
  'ntpd-rs-pre.dinit')
backup=('etc/ntpd-rs/ntp.toml')
b2sums=('SKIP'
        '3bddde4990de7c1fb2b792cb2847d51ca00d00283bc337ab4b8786c2459cf0f0e62bc80cc09d4d76267e723e8c17a032c9d000d20e9ca8ba0a5eb2a6a1d980cd'
        '80355c29433138805efd4acbdb6c684a206afae43f75466d3996c100dea534d099049131279ad8d1e5c80ebaa6792b7101cccad91d085e5630c5356c295a3c22'
        '8f0d70c85e477f3c2e7ba00ec91dbfd1c1fd5d60a0674cbdafbd4e505e27b98b9c5d64e821e3b242bfe02dd389b19eceb685c21df30ccf6eea91d90caeea8a04'
        'df821f8c0d34e84dcf8928b5dc5a6f8b106d812c9eb214617314db632a985125dfd2aa74c66e9b6383d71e4a20f193df7df0b44feb0eb20dab608fb388af6612'
        '64ae639cafe50089cc97e01f17b8b6b413341b31a9b7e1b92391e776c400ec2e71cff1e416172699d9140bb22b0bf33aa70c1e30b71f95f2c9640a4fbe8d89a0')

install=${_pkgname}.install

pkgver(){
  cd "${pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  echo "::: ntpd-rs-git - setting envvironment variables"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUST_BACKTRACE=1
  export CFLAGS+=" -ffat-lto-objects"

  echo "::: ntpd-rs-git - starting to build"
  cargo build --release --target x86_64-unknown-linux-gnu
  echo "::: ntpd-rs-git - build done"
}

package() {
  local _targetpath="/usr/share/${_pkgname}"
 
  echo "::: Installing systemd files"
  install -Dm644 ntpd-rs.sysuser "${pkgdir}${_targetpath}/ntpd-rs.sysuser" 
  install -Dm644 ntpd-rs.service "${pkgdir}${_targetpath}/ntpd-rs.service" 
  install -Dm644 ntpd-rs-metrics.service "${pkgdir}${_targetpath}/ntpd-rs-metrics.service" 
  # echo "ntpd-rs.service" | install -Dm 644 /dev/stdin "${pkgdir}/usr/lib/systemd/ntp-units.d/50-ntpd-rs.list"

  echo "::: Installing dinit files"
  install -Dm644 ntpd-rs-pre.dinit "${pkgdir}${_targetpath}/ntpd-rs-pre.dinit" 
  install -Dm644 ntpd-rs.dinit "${pkgdir}${_targetpath}/ntpd-rs.dinit" 

  cd "${pkgname}"
  
  echo "::: Installing config file"
  install -Dm644 docs/examples/conf/ntp.toml.default "${pkgdir}/etc/ntpd-rs/ntp.toml"

  echo "::: Installing binaries"
  install -Dm755 -t "${pkgdir}/usr/bin" target/x86_64-unknown-linux-gnu/release/{ntp-daemon,ntp-ctl,ntp-metrics-exporter}

  echo "::: Installing man files"
  install -Dm755 -t "${pkgdir}/usr/share/man/man8" docs/precompiled/man/{ntp-daemon.8,ntp-ctl.8,ntp-metrics-exporter.8}
  install -Dm755 -t "${pkgdir}/usr/share/man/man5" docs/precompiled/man/ntp.toml.5  

  echo "::: Done installing"
}
