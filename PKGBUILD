# Contributor: Bence Hornák <bence.hornak@gmail.com>
# Contributor: Leon De Andrade <leondeandrade@hotmail.com>
# Maintainer: Christian Cornelssen <email@address.invalid>

pkgname=theia-electron
pkgver=1.55.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs>=18.17.0' 'nodejs<21' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('bash>=5' 'curl' 'diffutils' 'jq'
             'gcc' 'make' 'node-gyp' 'npm' 'pkgconf' 'python-setuptools' 'yarn')
optdepends=('git: git support' 'libsecret: keytar support')
options=(!debug !strip)

_tools_commit=3a60f68f4fde1675c0860923e752f73f5664eb68
source=(
  "theia-electron.sh"
  "https://gitlab.com/ccorn/theia-packaging-tools/-/raw/$_tools_commit/make-package-json.sh"
  "extra-plugins.json"
  ".yarnclean"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-EPL"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-GPL-2.0-ONLY-CLASSPATH-EXCEPTION"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-vscode.txt"
)
sha256sums=('49dc3027c1bed942afde93608248765178d8f32145c1f8c75b68f4b191bf0af0'
            '201f033b3e445dca08066f5d636b961d45d2ffadd589908f3cc76bf2c2bd601a'
            '225dd1fa14a3b682852d734ad147d9ae3275d28244a0dbecf80afd94fd0ee7a9'
            'f43cc8aaf4738166acdf4e54817ad7e9c031c4dacf23eb8496f9edae33b3f1d0'
            '76f48bbc421d298113c73cee628c9d0fd8b14381590d871928f4f0bd87e812ce'
            'd9712e3b79a98d7b1d5fd64d709daa806be6944c3f0cebf22879cd0e3c08ce06'
            '8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c'
            '7d74322f208420b6886c40eda1c7d1bad618f12e067af934f02bc9bbfcc038ae'
            '39e379a27a642e8146a3c1a089fa96cf8221d2233a7f5821e33a91da7dacfc3b')

prepare() {
  cd "$srcdir"
  # Remove @theia/preview in favor of vscode.markdown*.
  # @theia/notebook not enabled for electron yet, work in progress anyway.
  # @theia/test: Not listed in the electron version.
  # Note: As of 1.41.0, those get pulled in anyway. Sigh.
  # 1.50.0: @theia/git removed from electron version
  # (presumably in favor of vscode.git{,-base})
  # Add upstream resolutions.
  bash make-package-json.sh "${pkgver/.next./-next.}" | \
  grep -vE "@theia/(git|notebook|preview|test)\b" | \
  sed '/^  }$/i\
  },\
  "resolutions": {\
    "**/@types/node": "18",\
    "**/nan": "2.20.0"' >package.json
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
  chmod -R a+rX,go-w "$pkgdir/usr/lib/$pkgname/"

  # Executable
  install -Dm755 theia-electron.sh "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-*
}
