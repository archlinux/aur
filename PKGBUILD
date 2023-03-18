# Maintainer: Andy Brennan <andy at beiwy dot com>
pkgname=apex-tux-git
pkgver=r25.17f41f5
pkgrel=1
pkgdesc="Support for Steelseries Apex keyboard OLED screens"
arch=('x86_64')
url="https://github.com/not-jan/apex-tux"
license=('Unlicense')
groups=()
depends=('libstatgrab' 'libusb' 'dbus')
makedepends=('git' 'cargo-nightly')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=("etc/${pkgname%-git}/settings.toml")
options=()
install=
source=(
  'git+https://github.com/brennana/apex-tux.git#branch=aur'
  'settings.toml'
  '98-steelseries.rules'
  'apex-tux.service'
)
noextract=()
sha256sums=(
  'SKIP'
  '14ef44861b2487852e88e91de89feb892cc8a89d5290d3ee07d903666af92f20'
  'ca08475ae39f3ee111e7363829f2bdce9e7ae0bfacd0a481009fc363308ddad2'
  '761cef629df24b01e92926590daa31aa0c562f5ffc09a390be8434085d6d7b93'
)

prepare() {
	cd "$srcdir/${pkgname%-git}"

	cargo update	
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	
	cargo build --frozen --release --features sysinfo
}

# check() {
# 	cd "$srcdir/${pkgname%-git}"
# 
#   cargo test --frozen --all-features
# }

package() {
	mkdir -p "$pkgdir/etc/udev/rules.d"
	mkdir -p "$pkgdir/etc/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/lib/systemd/user"

	cd "$srcdir"
	
	cp apex-tux.service "$pkgdir/usr/lib/systemd/user"
	cp 98-steelseries.rules "$pkgdir/etc/udev/rules.d"
	cp settings.toml "$pkgdir/etc/${pkgname%-git}"
	
	cd "$srcdir/${pkgname%-git}"

	mkdir -p "$pkgdir/usr/bin"
	
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
