
# Maintainer: yuhldr <yuhldr@gmail.com>
pkgname=cosmic-ext-applet-minimon-git
_pkgname=minimon-applet
pkgver=0.6.0.r3.g78d77c3
pkgrel=1
pkgdesc="A COSMIC applet for displaying CPU/Memory/Network/Disk/GPU usage in the Panel or Dock.."
arch=('x86_64')
url="https://github.com/cosmic-utils/${_pkgname}"
license=('GPL-3.0')
depends=(
	'cosmic-applets'
	'libxkbcommon'
)
makedepends=(
    'cargo'
    'git'
    'just'
)
provides=(${_pkgname})
conflicts=("${pkgname%-git}" "minimon-applet-for-cosmic")
source=("git+https://github.com/cosmic-utils/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_pkgname}

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    just build-release
}

package() {
    cd ${_pkgname}
    just rootdir="$pkgdir" install

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
