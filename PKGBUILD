# Maintainer: Luytan <luytan@khora.me>

_pkgname=cardwire
pkgname="${_pkgname}-git"
pkgver=r520.96dffa5
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL-3.0-only')
depends=('hwdata' 'dbus' 'sqlite' 'systemd' 'upower')
makedepends=('git' 'rust' 'rust-src' 'bpf-linker' 'libxcb')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked
  # This is a workaround to get cardwire-ebpf building
	# bpf-linker linked to llvm 22 or built with llvm 22 cannot compile the crate
	# the official binstall ship a llvm 23 static linked bpf-linker, this is what is used
	cargo binstall --locked --no-confirm \
		--root "${srcdir}/cardwire-tools"\
	       --version 0.11.0 bpf-linker
}

build() {
  cd "$srcdir/$_pkgname"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export RUSTC_BOOTSTRAP=1
  export CARGO_TARGET_DIR=target
  export PATH="${srcdir}/cardwire-tools/bin:$PATH"
  cargo build --frozen --release --bins
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/cardwire "$pkgdir/usr/bin/cardwire"
  install -Dm755 target/release/cardwired "$pkgdir/usr/bin/cardwired"
  install -Dm755 target/release/cardwire-gui "$pkgdir/usr/bin/cardwire-gui"

  install -Dm644 assets/cardwired.service \
    "$pkgdir/usr/lib/systemd/system/cardwired.service"
  install -Dm644 assets/org.opengamingcollective.cardwire.conf \
    "$pkgdir/usr/share/dbus-1/system.d/org.opengamingcollective.cardwire.conf"
  install -Dm644 assets/cardwire-gui.desktop \
    "$pkgdir/usr/share/applications/cardwire-gui.desktop"


  install -Dm644 assets/org.opengamingcollective.cardwire.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.opengamingcollective.cardwire.metainfo.xml"

  for icon in assets/icons/*.svg; do
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}