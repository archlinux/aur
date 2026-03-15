# Maintainer: Repeater <fakeroration@gmail.com>
pkgname=omniget-git
_pkgname=${pkgname%-git}
pkgver=0.3.6.r1.32c91a3
pkgrel=1
options=('!buildflags')
pkgdesc="Free,open source desktop app for downloading videos and media from the internet"
arch=('x86_64')
url="discord.gg/jgdxyPy7Vn"
license=('GPL-3.0-or-later')
groups=()
depends=('webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('git' 'curl' 'wget' 'patchelf' 'rustup' 'pnpm' 'nodejs>=18' 'llvm')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
install=
source=("$_pkgname::git+https://github.com/tonhowtf/omniget.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$srcdir/$_pkgname"
	pnpm install
}

build() {
	cd "$srcdir/$_pkgname"
	pnpm tauri build --no-bundle
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "src-tauri/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=OmniGet
Comment=${pkgdesc}
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Network;FileTransfer;
EOF
	install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
