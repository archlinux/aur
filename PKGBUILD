# Maintainer: Daniel Eklöf <daniel at ekloef dot se>

# Select PGO (Performance Guided Optimizations) build type.
#
#  - auto: choose best available option
#
#  - none: disable PGO
#
#  - full-current-session: run a “full” PGO build in an existing
#    Wayland session. This will pop up a foot window running a script
#    that generates random terminal output.
#
#  - full-headless-sway: run a “full” PGO build inside a headless Sway
#    instance. Requires Sway >= 1.7.
#
#  - full-headless-cage: run a “full” PGO build inside a headless Cage
#    instance. Requires cage to be installed. Will generate lots of
#    Cage warnings, but seems to produce a fully working (and well
#    optimized) foot build.
#
#  - partial: run a “partial” PGO build. This requires neither a
#    running Wayland session, nor an installed Wayland compositor, but
#    the resulting binary is slower compared to “full” PGO builds
#    (though still faster than regular release builds).
#
# Note that “full-*” (which “auto” will prefer) requires an UTF-8
# locale. Either make sure LC_CTYPE is set to an UTF-8 locale, or do a
# “partial” PGO build (or disable PGO altoghether).

PGO=auto

pkgdesc='Wayland terminal emulator - fast, lightweight and minimalistic'
pkgname=foot-fullscreen-transparency-git
pkgver=1.15.3.r53.g1c9d98d5
pkgrel=1
conflicts=('foot')
replaces=('foot-themes')
provides=('foot')
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/foot
license=(mit)
makedepends=('git' 'meson' 'ninja' 'scdoc' 'python' 'wayland-protocols' 'tllist') # ‘llvm’, for PGO with clang
checkdepends=('check')
depends=('libxkbcommon' 'wayland' 'pixman' 'fontconfig' 'libutf8proc' 'ncurses' 'fcft>=3.0.0')
optdepends=("foot-terminfo: alternative to ncurses' terminfo, with additional non-standard capabilities"
	"libnotify: desktop notifications"
	"xdg-utils: URI launching"
	"bash-completion: bash completions for foot itself")
source=(git+https://codeberg.org/dnkl/foot.git
	"0003-make-foot-great-again.patch")
sha256sums=('SKIP'
	'89c1d38a880b4e1620741f1cd00268293eb587c67d5e0a0e15b260f15835943c')

pkgver() {
	cd foot
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd foot

	patch -p1 <../0003-make-foot-great-again.patch

	./pgo/pgo.sh \
		${PGO} \
		. build \
		--prefix=/usr \
		--wrap-mode=nodownload \
		-Dterminfo=disabled \
		-Dfullscreen_alpha=true
}

check() {
	cd foot
	ninja -C build test
}

package() {
	cd foot
	DESTDIR="${pkgdir}/" ninja -C build install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/foot/LICENSE"
}
