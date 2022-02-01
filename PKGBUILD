# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: Leon De Andrade <leondeandrade@hotmail.com>
# Contributor: Christian Cornelssen <email@address.invalid>

pkgname=theia-electron
pkgver=1.22.1
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs-lts-erbium' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('bash>=5' 'curl' 'diffutils' 'jq'
             'yarn' 'make' 'gcc' 'pkgconf' 'python' 'node-gyp')
optdepends=('git: git support' 'libsecret: keytar support')
options=(!strip) #to speed up build

_tools_commit=8be3c952235a2f6e99038674f697b2f318ebb1ce
source=(
  "theia-electron.sh"
  "https://gitlab.com/ccorn/theia-packaging-tools/-/raw/$_tools_commit/make-package-json.sh"
  "extra-plugins.json"
  ".yarnclean"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE"
)
md5sums=('5a26cc7b1b461bec8533266dbe64c87e'
         '0ec27ba366785b8edb6dcd449254b4d5'
         '6aab47574fb82cf9b0172f78d977ceb7'
         '8a3461a9d1c50f6bfe60902d020bb797'
         'd387a0df41b11ba3d33360812bfbbe2c'
         '1dde0e422484895d3509f4ee9bb8d980'
         '84e52389f141be88a24bcfdd44c91a19')

prepare() {
  cd "$srcdir"
  bash make-package-json.sh "${pkgver/.next./-next.}" >package.json
}

build() {
  local FAKEHOME="$srcdir/.electron-gyp"
  mkdir -p "$FAKEHOME"

  # Disable yarn autoclean
  mv .yarnclean .yarnclean_
  HOME="$FAKEHOME" yarn install --cache-folder "$srcdir/yarn-cache"
  HOME="$FAKEHOME" yarn build
  # Enable yarn autoclean
  mv .yarnclean_ .yarnclean
  # Remove dev dependencies
  HOME="$FAKEHOME" yarn install --cache-folder "$srcdir/yarn-cache" --production --ignore-scripts --prefer-offline
}

package() {
  # Create directory
  install -dm755 "$pkgdir"/usr/lib/$pkgname

  # Source code (command-line symlinks dereferenced, if any) and plugins
  cp -RH --no-preserve=ownership --preserve=mode \
      src-gen lib node_modules package.json \
      plugins \
      "$pkgdir/usr/lib/$pkgname/"

  # Executable
  install -Dm755 theia-electron.sh "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
