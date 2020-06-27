# Maintainer: Bence Hornák <bence.hornak@gmail.com>

pkgname=theia-electron
pkgver=1.3.0
pkgrel=2
arch=('any')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs-lts-dubnium' 'nss' 'gtk3' 'libxss' 'libxkbfile')
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
         'bba497da728fc3794e8382a095d07469'
         '54b30057095cf131ec7296b0d0bd2046'
         'b316dead79fa33f45c8d689a1c940dab'
         '1dde0e422484895d3509f4ee9bb8d980'
         '84e52389f141be88a24bcfdd44c91a19')

build() {
  yarn install --cache-folder "$srcdir/yarn-cache"
  yarn build
  # Remove dev dependencies
  yarn install --cache-folder "$srcdir/yarn-cache" --production --ignore-scripts --prefer-offline
}

package() {
  # Create directory
  install -dm 755 "$pkgdir"/usr/lib/$pkgname

  # Source code (symlinks are not dereferenced) and plugins
  cp -r --no-preserve=ownership --preserve=mode \
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
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
