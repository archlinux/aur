# Build from this checkout with: makepkg -si
# scripts/prepare-aur.py sets the release source fields for AUR builds.

pkgname=omarchy-flux
pkgver='0.9.0'
pkgrel=1
pkgdesc='Connect an Omarchy computer to your phone with Flux for Android'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/flux'
# The repository has no license yet.
license=('LicenseRef-unknown')
depends=('qt6-base>=6.6' 'qt6-declarative>=6.6' 'qt6-svg' 'qt6-wayland' 'ttf-font-nerd' 'wl-clipboard' 'pipewire' 'avahi' 'xdg-utils')
optdepends=(
	'quickshell: the flux plugin for omarchy-shell'
	'ffmpeg: the phone as webcam'
	'v4l2loopback-dkms: the phone as webcam'
	'mpv: the phone screen mirror'
	'wtype: the phone keyboard'
	'gpu-screen-recorder: the remote desktop on the phone'
)
makedepends=('go>=1.27.1' 'cmake' 'ninja' 'git')
install=omarchy-flux.install

_source_url='https://github.com/bjarneo/flux/archive/refs/tags/v0.9.0.tar.gz'
_source_sha256='211b7db745a7fae7679080fab4de5421bfb8707674eafac627982e6d2aabfa99'
_source_dir='flux-0.9.0'

if [[ -n $_source_url ]]; then
	source=("${pkgname}-${pkgver}.tar.gz::${_source_url}")
	sha256sums=("$_source_sha256")
else
	# The last release tag and the commits after it, such as
	# 0.6.0.r3.g1a2b3c4. fluxd compares this version with the releases.
	pkgver() {
		_src
		local tag
		if tag=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null); then
			printf '%s' "$tag" | sed 's/^v//;s/-\([0-9]*\)-g/.r\1.g/'
		else
			printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
		fi
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

# Only the tests. CI also runs go vet, gofmt, and the race detector, which
# can fail with a newer Go than the Go of CI.
check() {
	_src
	go test ./cmd/... ./internal/...
}

package() {
	_src
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
