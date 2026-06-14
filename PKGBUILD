# Maintainer: manganeese <mangoiscute95@gmail.com>
# Contributor: Noah Heller <softwareenginer@pm.me>
_emsdk=4.0.12
pkgname=advantagescope-git
pkgver=26.0.2.r60.gc550d0de
pkgrel=1
epoch=
pkgdesc="robot diagnostics, log review/analysis, and data visualization application tool"
arch=(x86_64)
url="https://github.com/Mechanical-Advantage/AdvantageScope.git"
license=("LicenseRef-BSD-3.0-Clause-Noninfringement")
groups=()
depends=(nspr libxdamage dbus nss libxcb libxext glib2 libxrandr mesa libxfixes alsa-lib alsa-lib glibc gcc-libs libcups libxkbcommon cairo at-spi2-core pango expat libx11 gtk3 libdrm libxcomposite hicolor-icon-theme)
makedepends=(jq curl git npm tar python libcrypt.so=1)
checkdepends=()
optdepends=()
provides=()
conflicts=(advantagescope)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url" "emsdk-$pkgver.tar.gz::https://github.com/emscripten-core/emsdk/archive/refs/tags/$_emsdk.tar.gz")
noextract=()
sha256sums=('SKIP' 'd972bf0909718f155aeb5627429230471c94b2a8a3047ee696e2690ec73961cb')
validpgpkeys=()

prepare() {
  cd emsdk-$_emsdk
  ./emsdk install latest
}

pkgver() {
  cd "AdvantageScope"
  printf "%s" "$(git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .)"
}
build() {
  cd AdvantageScope
  "$srcdir"/emsdk-$_emsdk/emsdk activate latest
  source "$srcdir"/emsdk-$_emsdk/emsdk_env.sh
  npm install
  jq '. + { homepage: "https://github.com/Mechanical-Advantage/AdvantageScope", version: "'"${pkgver/.r/+r}"'" }' package.json >temp.json && mv temp.json package.json
  npm run build -- --linux --config.linux.target=pacman
  cd dist
  tar xvf advantagescope-${pkgver/.r/+r}.pacman
}

package() {
  cd AdvantageScope
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  cd dist
  cp -rf opt "$pkgdir"
  cp -rf usr "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/AdvantageScope/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
