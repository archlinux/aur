# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: Leon De Andrade <leondeandrade@hotmail.com>

pkgname=theia-electron
pkgver=1.9.0
pkgrel=1
arch=('any')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs-lts-erbium' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('yarn' 'make' 'gcc' 'pkgconf' 'python2' 'node-gyp')
optdepends=('git: git support')
options=(!strip) #to speed up build

source=(
  "theia-electron.sh"
  "package.json"
  ".yarnclean"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE"
)
md5sums=('5a26cc7b1b461bec8533266dbe64c87e'
         'c308320e66044089fc2ce2301f817b4e'
         '8a3461a9d1c50f6bfe60902d020bb797'
         'd387a0df41b11ba3d33360812bfbbe2c'
         '1dde0e422484895d3509f4ee9bb8d980'
         '84e52389f141be88a24bcfdd44c91a19')

build() {
  local FAKEHOME="$srcdir/.electron-gyp"
  mkdir -p "$FAKEHOME"

  # Disable yarn autoclean
  mv .yarnclean .yarnclean_
  HOME="$FAKEHOME" yarn install --cache-folder "$srcdir/yarn-cache"
  HOME="$FAKEHOME" yarn build

  #Enable yarn autoclean
  mv .yarnclean_ .yarnclean
  # Remove dev dependencies
  HOME="$FAKEHOME" yarn install --cache-folder "$srcdir/yarn-cache" --production --ignore-scripts --prefer-offline
}

package() {
  # Create directory
  install -dm 755 "$pkgdir"/usr/lib/$pkgname

  # Source code (symlinks are not dereferenced) and plugins
  cp -r --no-preserve=ownership --preserve=mode \
      src-gen lib node_modules \
      plugins \
      "$pkgdir/usr/lib/$pkgname/"

  # package.json
  install -Dm755 package.json "$pkgdir/usr/lib/$pkgname/"

  # Executable
  install -Dm755 theia-electron.sh "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
