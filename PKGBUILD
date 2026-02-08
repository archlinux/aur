# Maintainer: Alexander Kirchberger <kirchbergeralex0@gmail.com>
pkgname='rsimg-git' # '-bzr', '-git', '-hg' or '-svn'
_pkgname='rsimg' 
pkgver='r17.33bf3a2'
pkgrel=1
pkgdesc="Terminal image viewer with unicode characters"
arch=('x86_64')
url="https://github.com/kirchberger/rsimg"
license=('GPL')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=('rsimg::git+https://github.com/kirchberger/rsimg.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
	cd "$_pkgname"

	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
	cd "$_pkgname"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
