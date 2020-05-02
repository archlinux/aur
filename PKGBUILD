# Maintainer: Bence Hornák <bence.hornak@gmail.com>

pkgname=theia-electron
pkgver=1.1.0
pkgrel=1
arch=('any')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs-lts-dubnium' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('yarn' 'make' 'gcc' 'pkgconf' 'python2' 'node-gyp')
optdepends=('git: git support')
options=(!strip) #to speed up build

source=(
  "theia-electron"
  "package.json"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE"
)
md5sums=('c022f460c0d928df6c1ece9d3044b008'
         'eedf58bc5c40030b29610291718a960a'
         'b316dead79fa33f45c8d689a1c940dab'
         '1dde0e422484895d3509f4ee9bb8d980'
         '93f06061d9ad92aeaaccbc9b36421eb5')

build() {
  yarn install
  yarn build
  # Remove dev dependencies
  yarn install --production --ignore-scripts --prefer-offline
}

package() {
  # Create directory
  install -dm 755 "$pkgdir"/usr/lib/$pkgname

  # Source code (symlinks are not dereferenced)
  cp -r --no-preserve=ownership --preserve=mode \
      src-gen lib node_modules \
      "$pkgdir/usr/lib/$pkgname/"
  # package.json (should be dereferenced)
  install -Dm644 package.json "$pkgdir/usr/lib/$pkgname/"

  # Executable
  install -Dm755 theia-electron "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
