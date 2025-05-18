# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Noah Heller <softwareenginer@pm.me>
_emsdk=3.1.71
pkgname=advantagescope-git
pkgver=4.1.6.r23.gbc9dd3a
pkgrel=1
epoch=
pkgdesc="robot diagnostics, log review/analysis, and data visualization application tool"
arch=(x86_64)
url="https://github.com/Mechanical-Advantage/AdvantageScope.git"
license=('MIT')
groups=()
depends=(nspr libxdamage dbus nss libxcb libxext glib2 libxrandr mesa libxfixes alsa-lib alsa-lib glibc gcc-libs libcups libxkbcommon cairo at-spi2-core pango expat libx11 gtk3 libdrm libxcomposite hicolor-icon-theme)
makedepends=(sudo jq curl git npm tar)
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
sha256sums=('SKIP' 'ea1bbd1974a3323710fc6e585aad20b056fed634df11db2ee3556bfd18e96afd')
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
  jq '. + { homepage: "https://github.com/Mechanical-Advantage/AdvantageScope" }' package.json >temp.json && mv temp.json package.json
  npm run build -- --linux --config.linux.target=pacman
  curl -OL https://raw.githubusercontent.com/Mechanical-Advantage/AdvantageScope/refs/heads/main/LICENSE
  cd dist
  tar xvf advantagescope-$(git describe --tags | cut -c2- | sed 's+-+.r+' | sed 's/[a-zA-Z].*//')pacman
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
