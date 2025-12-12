_pkgname=slimevr-gui
pkgname=${_pkgname}-git
pkgver=v18.1.0.r0.f01f59952
pkgrel=2
pkgdesc="web GUI for SlimeVR Full Body Tracking System"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server"
license=('MIT' 'Apache-2.0')
groups=()
depends=("python")
makedepends=("nodejs" "pnpm")
checkdepends=()
optdepends=()
provides=("slimevr-gui")
conflicts=("slimevr-gui")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git" "slimevr-gui" "slimevr-gui.desktop")
noextract=()
sha512sums=('SKIP'
            'bebbb17d5d87359f1b593ce8f8e6aeace579a0d2a44f39408a0a9ae96c1e41061b91f8356b068dfa8d707619745ffd93fa79a109775eb67376d636abbbc6a50f'
            'f42c9f9c3275342af6a09cd5136dda0e59ce8eafcea5555eea22cf79d80008802a1df586b1bc0a1f4c45c63842d517ee223772561a09a33e4c82cc5fb68f5f36')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/SlimeVR-Server"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/SlimeVR-Server"
	git submodule update --init --recursive
}

build() {
  cd "${srcdir}/SlimeVR-Server/solarxr-protocol"
  pnpm install --ignore-scripts
  pnpm run build

  cd "${srcdir}/SlimeVR-Server/gui"
  pnpm install --ignore-scripts
  pnpm run build
}

package() {
  install -Dm755 "slimevr-gui" -t "${pkgdir}/usr/bin"
  install -Dm644 "slimevr-gui.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${srcdir}/SlimeVR-Server"
  install -Dm644 "LICENSE-MIT" "LICENSE-APACHE" -t "${pkgdir}/opt/${_pkgname}"

  cd "${srcdir}/SlimeVR-Server/gui/dist"
  find . -type f -exec install -vDm 644 {} "${pkgdir}/opt/${_pkgname}/{}" \;

  install -Dm644 "${srcdir}/SlimeVR-Server/gui/src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/SlimeVR-Server/gui/src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  install -Dm644 "${srcdir}/SlimeVR-Server/gui/src-tauri/icons/ios/AppIcon-512@2x.png" "${pkgdir}/usr/share/icons/hicolor/512x512@2x/apps/${_pkgname}.png"
}
