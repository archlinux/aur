# Maintainer: Kimiblock Moe

pkgname=field-monitor
pkgdesc="Remote-desktop client designed for the GNOME platform. Access virtual machines and other external screens."
url="https://github.com/theCapypara/field-monitor"
license=("GPL-3.0-or-later")
arch=("x86_64")
pkgver=48.0
pkgrel=1
makedepends=("rust" "cargo" "git" "blueprint-compiler" "meson" "libvirt" "libvirt-glib" "blueprint-compiler" "bubblewrap")
depends=(libadwaita gtk4 hicolor-icon-theme dconf gcc-libs glib2 glibc spice-gtk spice-protocol phodav python-pyparsing libcacard spice freerdp2 vte4 json-c libtirpc gtk-vnc)
source=("git+https://github.com/theCapypara/field-monitor#tag=v${pkgver}")
sha256sums=('cdb3461d9963d2f20d61b1988395f4de9f2c69bbe08f6bc1a79134034f8ad526')
options=(!lto)

function prepare() {
	export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
	meson subprojects download --sourcedir="${srcdir}/field-monitor"
}

function build() {
	export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
	export RUST_BACKTRACE=1
	arch-meson "${srcdir}/field-monitor" build
	meson compile -C build
}

function check() {
	export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"
	meson test -C build
	rm -rf "${srcdir}/install"
	mkdir -p "${srcdir}/install"
	export RUST_BACKTRACE=1
	export GIT_CONFIG_GLOBAL=""
	meson install -C build --destdir "${srcdir}/install"
}

function package() {
	cp -a \
		"${srcdir}/install"/* \
		"${pkgdir}/"
}
