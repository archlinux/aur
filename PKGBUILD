# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=unsloth
pkgname="$_pkgbase-bin"
pkgver=0.1.803.beta
pkgrel=1
pkgdesc='Local UI to run and train LLMs and diffusion models'
arch=('x86_64')
url='https://github.com/unslothai/unsloth'
license=('Apache-2.0' 'AGPL-3.0-or-later')
depends=(
	'cairo'
	'curl'
	'dbus'
	'gcc-libs'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gtk3'
	'hicolor-icon-theme'
	'libsoup3'
	'webkit2gtk-4.1'
	'xdg-utils'
)
optdepends=(
	'libayatana-appindicator: system tray icon'
	'git: triton kernels training speedup and --local installs'
	'cmake: build llama.cpp from source instead of using the prebuilt engine'
	'gcc: build llama.cpp from source instead of using the prebuilt engine'
)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=('!strip' '!debug')
install=setup.install

_debver="${pkgver//./_}"
_debfile="Unsloth-Desktop-$_debver-Ubuntu.deb"
source=("$pkgname-$pkgver.deb::$url/releases/download/v${pkgver/.beta/-beta}/$_debfile")
noextract=("$pkgname-$pkgver.deb")
sha256sums=('c4be4f81753f2be67aa54200010efd8c3e64cca78a6207bc1ccdb13ee5495347')

prepare() {
	bsdtar -xOf "$pkgname-$pkgver.deb" data.tar.gz | bsdtar -x

	# Upstream ships an empty Categories key, which drops the entry into "Other".
	sed -i \
		-e 's|^Categories=$|Categories=Development;|' \
		-e '/^Categories=/a Keywords=LLM;AI;ML;fine-tuning;training;inference;unsloth;' \
		usr/share/applications/Unsloth.desktop
}

package() {
	# Tauri resolves its resource dir as <exe>/../lib/Unsloth, so install.sh has to
	# stay at /usr/lib/Unsloth/install.sh — that script builds the per-user Python
	# environment (~/.unsloth/studio) on first launch.
	install -Dm755 usr/bin/unsloth-studio "$pkgdir/usr/bin/unsloth-studio"
	install -Dm755 usr/lib/Unsloth/install.sh "$pkgdir/usr/lib/Unsloth/install.sh"

	install -Dm644 usr/share/applications/Unsloth.desktop \
		"$pkgdir/usr/share/applications/unsloth-studio.desktop"

	local _size
	for _size in 32x32 128x128; do
		install -Dm644 "usr/share/icons/hicolor/$_size/apps/unsloth-studio.png" \
			"$pkgdir/usr/share/icons/hicolor/$_size/apps/unsloth-studio.png"
	done
}
