# Maintainer: Stuart Reilly <stu@reilly-family.co.uk>
pkgname=socksy-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.1.0r1.959a710
pkgrel=1
pkgdesc="Dirt simple SOCKS5 CONNECT proxy which binds a network interface"
arch=('x86_64')
url="https://github.com/themadprofessor/socksy"
license=('MIT')
groups=()
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/themadprofessor/socksy')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING git SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%sr%s.%s" "$(grep "^version" Cargo.toml | cut -d ' ' -f 3 | tr -d '"')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/system/" "dist/socksy@.service"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/socksy-git/" "LICENSE"
}
