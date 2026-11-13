# Maintainer: callmetango
# Contributor: artist <artist@artixlinux.org>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: M Rawash <mrawash@gmail.com>

: "${USE_SYSTEMD:=1}"

pkgname=xlibre-input-wacom
_pkgname=xf86-input-wacom
pkgver=25.0.0
pkgrel=51
pkgdesc="X.Org Wacom tablet driver"
arch=('x86_64')
url='https://github.com/X11Libre/xf86-input-wacom'
license=('GPL-2.0-or-later')
depends=(
	'glibc'
	'libx11'
	'libxi'
	'libxinerama'
	'libxrandr'
	'libudev.so'
	'xlibre-xserver'
)
makedepends=(
	'gobject-introspection'
	'meson'
	'python-attrs' # for tests
	'python-gobject' # for tests
	'python-libevdev' # for tests
	'python-pytest' # for tests
	'python-yaml' # for tests
	'X-ABI-XINPUT_VERSION=26.0'
	'xlibre-xserver-devel'
)
provides=('xf86-input-wacom')
provides+=('x11win-input-wacom') # for wacomtablet on Artix only
conflicts=(
	'X-ABI-XINPUT_VERSION<26'
	'X-ABI-XINPUT_VERSION>=27'
	'xf86-input-wacom'
)
groups=('xlibre-drivers')
source=(
	"${url}/archive/refs/tags/xlibre-${_pkgname}-${pkgver}.tar.gz"
	'wacom-udev-no-systemd.patch'
)

# check at https://github.com/linuxwacom/xf86-input-wacom/releases
sha256sums=(
	'12878547b271f4e59ecd5098f935d4c0bd4560d0c2a3a667385d916bc63d00af'
	'cf93b130c77746deaf9cf765b41dcd16428a1055f5d472b43998c8ed4e671112'
)

prepare() {
	cd "${_pkgname}-xlibre-${_pkgname}-${pkgver}"
	((USE_SYSTEMD)) || patch -Np1 -i "$srcdir/wacom-udev-no-systemd.patch"
}

build() {
	arch-meson $_pkgname-xlibre-$_pkgname-$pkgver build \
		-D xorg-conf-dir=/usr/share/X11/xorg.conf.d/ \
		-D systemd-unit-dir=/usr/lib/systemd/system/ \
		-D udev-rules-dir=/usr/lib/udev/rules.d \
		-D unittests=enabled

	# Print config
	meson configure build
	ninja -C build
}

check() {
	meson test -C build || /bin/true
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
