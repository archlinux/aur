# Maintainer: hyperpuncher
pkgname=spoti-git
pkgver=0.1.0.r0
pkgrel=1
pkgdesc='lightweight native Spotify client'
arch=('x86_64')
url='https://github.com/hyperpuncher/spoti'
license=('MIT AND Zlib AND ISC AND OFL-1.1 AND Unicode-3.0')
depends=('curl>=7.86' 'fontconfig' 'glib2' 'glibc' 'hicolor-icon-theme'
	'libsecret' 'libvorbis' 'libwebp' 'sdl3>=3.4' 'sdl3_ttf>=3.2.2'
	'systemd-libs' 'xdg-utils')
optdepends=('noto-fonts: additional script and symbol coverage'
	'noto-fonts-cjk: CJK characters'
	'noto-fonts-emoji: color emoji'
	'org.freedesktop.secrets: save login credentials')
provides=("spoti=$pkgver")
conflicts=('spoti')
makedepends=('git' 'just' 'odin>=dev_2026_10')
source=("spoti::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/spoti"
	if version=$(git describe --tags --long --match 'v[0-9]*' --abbrev=7 2>/dev/null); then
		printf '%s\n' "${version#v}" | sed 's/-/.r/;s/-/./'
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
