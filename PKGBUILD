# Maintainer: Nixuge
# Contributor: Noah Vogt <noah@noahvogt.com>

pkgname=localsend-git
pkgver=v1.14.0.r42.gc04684a
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop '
url=https://github.com/localsend/localsend
arch=(x86_64)
license=(MIT)
options=(!debug)
depends=(zenity xdg-user-dirs libayatana-appindicator)
conflicts=('localsend')
provides=('localsend')
makedepends=('cmake' 'ninja' 'git' 'fvm' 'clang')
source=("git+https://github.com/localsend/localsend" "${pkgname%-*}.desktop")
sha256sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${pkgname%-*}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"

	# Kinda sketch I admit it
	# Only have one "safe.directory=/opt/flutter" in the git config
	export GITCONF=$(git config --list --global)
	if ! [[ "$GITCONF" == *"safe.directory=/opt/flutter"* ]]; then
		git config --global --add safe.directory /opt/flutter
	fi

	cd "app"

	# Install the required flutter version without a prompt
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
