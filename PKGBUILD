_pkgname=slimevr-gui
pkgname=${_pkgname}-git
pkgver=v0.11.0.r0.5ff5f81a
pkgrel=1
pkgdesc="web GUI for SlimeVR Full Body Tracking System"
arch=('x86_64')
url="https://github.com/SlimeVR/SlimeVR-Server"
license=('MIT' 'Apache-2.0')
groups=()
depends=("python")
makedepends=("nodejs" "npm")
checkdepends=()
optdepends=()
provides=("slimevr-gui")
conflicts=("slimevr-gui")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git" "slimevr-gui")
noextract=()
sha512sums=('SKIP'
            'bebbb17d5d87359f1b593ce8f8e6aeace579a0d2a44f39408a0a9ae96c1e41061b91f8356b068dfa8d707619745ffd93fa79a109775eb67376d636abbbc6a50f')
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
  cd SlimeVR-Server
  npm install --include=dev

  cd gui
  npm install --include=dev
  npm run build

  cd ${srcdir}/SlimeVR-Server/target/release/bundle/deb/slimevr_*/data/
  sed -i 's#slimevr#slimevr-gui#' usr/share/applications/slimevr.desktop
}

package() {
  install -Dm755 "slimevr-gui" -t "${pkgdir}/usr/bin"

  cd "${srcdir}/SlimeVR-Server"
  install -Dm644 "LICENSE-MIT" "LICENSE-APACHE" -t "${pkgdir}/opt/${_pkgname}"

  cd "${srcdir}/SlimeVR-Server/gui/dist"
  find . -type f -exec install -vDm 644 {} "${pkgdir}/opt/${_pkgname}/{}" \;

  cd ${srcdir}/SlimeVR-Server/target/release/bundle/deb/slimevr_*/data/
  install -Dm644 "usr/share/applications/slimevr.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  for i in 32x32 128x128 256x256@2; do
    install -Dm644 "usr/share/icons/hicolor/$i/apps/slimevr.png" "${pkgdir}/usr/share/icons/hicolor/$i/apps/${_pkgname}.png"
  done
}
