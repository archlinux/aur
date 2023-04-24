# Maintainer: Nixuge

pkgname=localsend-git
_pkgname=localsend
pkgver=v1.9.0.r1.gb9002a0
pkgrel=1
pkgdesc='An open source cross-platform alternative to AirDrop '
url=https://github.com/localsend/localsend
arch=(x86_64)
license=(MIT)
depends=(zenity xdg-user-dirs libayatana-appindicator)
conflicts=('localsend-bin')
provides=('localsend')
makedepends=('flutter' 'git')
source=("git+https://github.com/localsend/localsend" "${_pkgname}.desktop")
sha256sums=('SKIP' 'SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	
	flutter pub get
	flutter pub run build_runner build
	flutter build linux
}

package() {
	# Make opt dir
	install -dm755 "${pkgdir}/opt/${_pkgname}/"
    cd "${srcdir}/${_pkgname}/build/linux/x64/release/bundle"

	# Executable install
	install -Dm755 \
		"localsend_app" \
		"${pkgdir}/opt/${_pkgname}/${_pkgname}"

	# Folders install
	cp -r lib/ "${pkgdir}/opt/${_pkgname}/"
	cp -r data/ "${pkgdir}/opt/${_pkgname}/"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s \
		"/opt/${_pkgname}/${_pkgname}" \
		"${pkgdir}/usr/bin/${_pkgname}"
	
	# Icon for .desktop 
	install -Dm644 \
		"${srcdir}/${_pkgname}/build/flutter_assets/assets/img/logo-512.png" \
		"${pkgdir}/usr/share/icons/localsend.png"

	# .desktop file
	install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}