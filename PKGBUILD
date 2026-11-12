# Maintainer: hyperpuncher
pkgname=spoti-git
pkgver=0.6.1.r4.gaa2c7de
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl' 'cairo' 'pango>=1.56' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'sdl3' 'sdl3_image'
	'systemd-libs' 'xdg-utils')
optdepends=('noto-fonts: additional script and symbol coverage'
	'noto-fonts-cjk: CJK characters'
	'noto-fonts-emoji: color emoji'
	'org.freedesktop.secrets: save login credentials')
provides=("spoti=$pkgver")
conflicts=('spoti')
makedepends=('git' 'just' 'odin>=dev_2026_10')
# The default Odin link cannot consume GCC LTO objects from the C text backend.
options=('!debug' '!lto')
source=("spoti::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/spoti"
	local _version
	if _version=$(git describe --tags --long --match 'v[0-9]*' --abbrev=7 2>/dev/null); then
		printf '%s\n' "${_version#v}" | sed 's/-/.r/;s/-/./g'
	else
		printf 'r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/spoti"
	just release
}

package() {
	cd "$srcdir/spoti"
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
