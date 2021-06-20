pkgname=website-stalker
pkgver=0.7.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('LGPL-2.1-or-later')
depends=('git')
makedepends=('cargo')
provides=("${pkgname}")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('bfc073d6d94b9e426cb0cfe2d1cbad2851e0919fc4ac097ae65677e50275f460')

build() {
  cd $pkgname-$pkgver
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # migrate all /usr/local/lib thingies to /usr/lib
  sed -i "s/\/local\//\//g" systemd/*

  install -Dm644 "systemd/systemd.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "systemd/systemd.timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
  install -Dm644 "systemd/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "systemd/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
