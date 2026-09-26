# Build from this checkout with: makepkg -si
# scripts/prepare-aur.py sets the release source fields for AUR builds.

pkgname=omarchy-flux
pkgver='0.3.0'
pkgrel=1
pkgdesc='Connect an Omarchy computer to your phone with Flux for Android'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/flux'
# The repository has no license yet.
license=('LicenseRef-unknown')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'ttf-font-nerd' 'wl-clipboard' 'pipewire' 'sound-theme-freedesktop' 'avahi' 'xdg-utils')
optdepends=(
	'quickshell: the flux plugin for omarchy-shell'
	'ffmpeg: the phone as webcam'
	'v4l2loopback-dkms: the phone as webcam'
	'mpv: the phone screen mirror'
)
makedepends=('go>=1.27.1' 'cmake' 'ninja' 'git')
install=omarchy-flux.install

_source_url='https://github.com/bjarneo/flux/archive/refs/tags/v0.3.0.tar.gz'
_source_sha256='9c14ebb0efa19d7819aa5575497faa295ba62e68aa6b06fc4dfa75d6858f44a3'
_source_dir='flux-0.3.0'

if [[ -n $_source_url ]]; then
	source=("${pkgname}-${pkgver}.tar.gz::${_source_url}")
	sha256sums=("$_source_sha256")
else
	pkgver() {
		_src
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}
fi

_src() {
	if [[ -n $_source_url ]]; then
		cd "$srcdir/$_source_dir" || return 1
	else
		cd "$startdir/../.." || return 1
	fi
}

build() {
	_src
	make build VERSION="$pkgver"
}

check() {
	_src
	make test vet
}

package() {
	_src
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
