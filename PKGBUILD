# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flowgger-git
pkgver=0.2.9
pkgrel=1
pkgdesc="Flowgger is a fast, simple and lightweight data collector written in Rust"
url="https://github.com/awslabs/flowgger"
provides=('flowgger')
makedepends=('git' 'cargo' 'pkgconf' 'snappy' 'capnproto')
arch=('x86_64')
license=('GPL-3.0')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/flowgger"
    sed '4,4!d' Cargo.toml |  egrep -o "([0-9]{1,}\.)+[0-9]{1,}"
}

build() {
  cd "flowgger"
  cargo build --release --features="syslog kafka-output file redis tls gelf ltsv"
}

package() {
  cd "flowgger"
  install -Dm644 flowgger.toml "$pkgdir/etc/conf.d/flowgger.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/flowgger/LICENSE"
  cd target/release
  install -Dm755 flowgger "$pkgdir/usr/bin/flowgger"
}