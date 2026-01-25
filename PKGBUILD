# Maintainer: Paul <pb.orzel@proton.me>
pkgname=amdgpu_top-git
_pkgname=amdgpu_top
pkgver=0.11.0.r25.gde0e906
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=("MIT")
depends=(
  "glibc"
  "libdrm"
)
makedepends=(
	"cargo"
	"git"
)
source=("git+$url")
conflicts=('amdgpu_top')
provides=('amdgpu_top')
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^[^0-9]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 target/release/amdgpu_top "$pkgdir/usr/bin/amdgpu_top"
	install -Dm644 assets/amdgpu_top.desktop "$pkgdir/usr/share/applications/amdgpu_top.desktop"
}
