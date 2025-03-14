# Maintainer: Nixuge
# Contributor: Noah Vogt <noah@noahvogt.com>

pkgname=localsend-git
pkgver=v1.17.0.r12.g24aea067
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop '
url=https://github.com/localsend/localsend
arch=(x86_64)
license=(MIT)
options=(!debug)
depends=(zenity xdg-user-dirs libayatana-appindicator)
conflicts=('localsend')
provides=('localsend')
makedepends=('cmake' 'ninja' 'git' 'fvm' 'clang' 'rustup')
source=("git+https://github.com/localsend/localsend" "${pkgname%-*}.desktop")
sha256sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	# set -x
	cd "${srcdir}/${pkgname%-*}"
	cd "app"

	# ===== Various fixes to get the build to work =====
	# By default the builds fails on warn.
	# Problem is localsend is using deprecated things which throw warnings while building.
	# This just disables fails while building.
	sed -i "s/target_compile_options(\${TARGET} PRIVATE -Wall -Werror)/target_compile_options(\${TARGET} PRIVATE -Wall)/" linux/CMakeLists.txt
	# Exact same thing in Rust
	# NOTE: KINDA DIRTY, but for some reason the pkg does not build without that (makepkg specific variables). To investigate.
	unset CFLAGS
	unset CXXFLAGS
	unset DEBUG_RUSTFLAGS
	unset LDFLAGS
	unset RUSTFLAGS
	# Furthermore, I seemed to be getting (not anymore?) this error:
	# error: The `http3` feature is unstable, and requires the `RUSTFLAGS='--cfg reqwest_unstable'` environment variable to be set.
	# So just in case
	export RUSTFLAGS='--cfg reqwest_unstable'

	fvm install

	fvm flutter pub get

	fvm flutter build linux
}

package() {
	# Make opt dir
	install -dm755 "${pkgdir}/opt/${pkgname%-*}/"
    cd "${srcdir}/${pkgname%-*}/app/build/linux/x64/release/bundle"

	# Executable install
	install -Dm755 \
		"localsend_app" \
		"${pkgdir}/opt/${pkgname%-*}/${pkgname%-*}"

	# Folders install
	cp -r lib/ "${pkgdir}/opt/${pkgname%-*}/"
	cp -r data/ "${pkgdir}/opt/${pkgname%-*}/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${pkgname%-*}/${pkgname%-*}" \
		"${pkgdir}/usr/bin/${pkgname%-*}"

	# Icon files
    for size in 32 128 256 512; do
        install -Dm644 \
            "${srcdir}/${pkgname%-*}/app/build/flutter_assets/assets/img/logo-$size.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/localsend.png"
    done

	# .desktop file
	install -Dm644 "${srcdir}/${pkgname%-*}.desktop" -t "${pkgdir}/usr/share/applications"
}
