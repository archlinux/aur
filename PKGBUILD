# Maintainer: Daniel Dimijian <jetfrog28@yahoo.com>
_prjctname=GodotPckTool
pkgname=godotpcktool
pkgver=2.1
pkgrel=1
pkgdesc="A standalone executable for unpacking and packing Godot .pck files"
arch=('x86_64')
url="https://github.com/hhyyrylainen/GodotPckTool"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'cxxopts' 'nlohmann-json' 'git')
# source unsigned.  git commits are signed, but I can't find the public key for the tagged commits
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"git+https://github.com/CommanderBubble/MD5#commit=552ad5a446a6b22c21e8c7856cfe967e10d5b364")
sha256sums=('de39b561950fa0f0e543283fbdd4b3b95707bca187ffd8625e0bd7c47ef0f528'
            '642c45efc1ee2a233249ba26b0bcc9f0300c7d033e176249e675ac215bc1b8f0')

# Arch now sets pack-relative-relocs flag by default in LDFLAGS (RFC 0023).
# ld.gold is incompatible with the pack-relative-relocs flag, and is explicitly
# set by upstream in src/CMakeLists (line 32).
LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs}

prepare() {
	rmdir "$_prjctname-$pkgver/third_party/MD5"
	mv MD5 "$_prjctname-$pkgver/third_party/MD5"
}

build() {
	cd "$_prjctname-$pkgver"
	make install-local
}

package() {
	cd "$_prjctname-$pkgver"
	install -Dm755 "install/bin/godotpcktool" "$pkgdir/usr/bin/godotpcktool"
	install -Dm644 "install/bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
