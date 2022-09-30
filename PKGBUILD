# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Nakaya <eniehack at outlook dot jp>
pkgname=cskk-git
pkgver=v0.10.2.r0.0f72f82
pkgrel=1
pkgdesc="SKK (Simple Kana Kanji henkan) library"
arch=("x86_64")
url="https://github.com/naokiri/cskk"
license=('GPL3')
groups=()
depends=('libxkbcommon')
makedepends=('git' 'cargo' 'cbindgen' 'cargo-c' 'glibc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/naokiri/cskk.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  cargo fetch \
    --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  #cargo build \
  #  --release \
  #  --frozen \
  #  --all-features
  cargo cbuild \
    --destdir="$pkgdir" \
    --prefix=/usr \
    --pkgconfigdir=/usr/lib/pkgconfig \
    --libdir=/usr/lib \
    --includedir=/usr/include \
    --frozen \
    --release
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "$srcdir/${pkgname%-git}"
  cargo cinstall \
    --release \
    --frozen \
    --prefix=/usr \
    --destdir="$pkgdir"
}
