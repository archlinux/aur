# Maintainer: Lukas "DerGeneralFluff" Lichten <lichtenrider@hotmail.de>

_pkgbase=acc-setupmanager
pkgname="${_pkgbase}-git"
pkgver=v0.2.0.r14.44c6615
pkgrel=1
pkgdesc="Setupmanager for Assetto Corsa Competizione using fltk and rust"
arch=('x86_64')
url="https://gitlab.com/LukasLichten/${_pkgbase}"
license=('AGPL-3.0')
# depends=('libx11' 'libxext' 'libxft' 'libxinerama' 'libxcursor' 'libxrender' 'libxfixes') # Already included in fltk
depends=('fltk' 'pango' 'cairo' 'wayland' 'wayland-protocols' 'dbus' 'libxkbcommon')
makedepends=('git' 'cargo')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}=${pkgver}")
source=(
  "git+${url}"
  "acc-setupmanager.desktop"
)
md5sums=(
  SKIP
  ca9d91f12b1fae6f0accafe932ffbd4a
)

pkgver() {
	cd "$srcdir/${_pkgbase}"

	# Git, with tags available
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count $(git describe --tags --abbrev=0)..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgbase}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build () {
  cd "$srcdir/${_pkgbase}"

  cargo build --release
}

package() {
  cd $srcdir/${_pkgbase}

  install -Dm755 target/release/acc_setupmanager "${pkgdir}/usr/bin/acc-setupmanager"
  install -Dm644 "src/assets/logo.svg" "${pkgdir}/usr/share/pixmaps/com.gitlab.lukaslichten.acc-setupmanager.svg"

  install -Dm644 "${srcdir}/acc-setupmanager.desktop" "${pkgdir}/usr/share/applications/com.gitlab.lukaslichten.acc-setupmanager.desktop"

}
