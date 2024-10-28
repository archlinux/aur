# Maintainer: pkg_maintainer <archlinuxpackagemaintainer@gmail.com>
pkgname=tplay-git
pkgver=v0.5.0.r11.g44745fb
pkgrel=1
epoch=
pkgdesc="A terminal ASCII media player. View images, gifs, videos, webcam, YouTube, etc.. directly in the terminal as ASCII art."
arch=('x86_64')
url="https://github.com/maxcurzi/tplay.git"
license=('MIT')
groups=()
depends=(yt-dlp opencv clang mpv ffmpeg mold)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(tplay-git)
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd tplay
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd tplay
	# Improve the app performance by building it against the current cpu architecture.
	export RUSTFLAGS="-C target-cpu=native"

	# temporary fixes to resolve build failure until the PR https://github.com/maxcurzi/tplay/pull/46 gets resolved.
	sed -i "s/opencv = { version = \"0\.84\.4\"/opencv = { version = \"0\.93\.1\"/g" Cargo.toml
	sed -i "s/ffmpeg-next = \"6\.0\"/ffmpeg-next = \"7\.1\.0\"/g" Cargo.toml

	if [[ $(mpv --version | grep "mpv" | cut -d " " -f2 | cut -d "-" -f1 | cut -b 1-4) = '0.35' ]]; then
		mold -run cargo build -r --features="mpv_0_35" --no-default-features
	elif [[ $(mpv --version | grep "mpv" | cut -d " " -f2 | cut -d "-" -f1 | cut -b 1-4) = '0.34' ]]; then
		mold -run cargo build -r --features="mpv_0_34" --no-default-features
	else
		mold -run cargo build -r --features="rodio_audio" --no-default-features
	fi
}

package() {
	cd tplay
	install -Dm755 target/release/tplay "${pkgdir}/usr/bin/tplay"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
