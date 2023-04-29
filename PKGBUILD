# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: Leon De Andrade <leondeandrade@hotmail.com>
# Contributor: Christian Cornelssen <email@address.invalid>

pkgname=theia-electron
pkgver=1.37.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs-lts-gallium' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('bash>=5' 'curl' 'diffutils' 'jq'
             'yarn' 'npm' 'make' 'gcc' 'pkgconf' 'python' 'node-gyp')
optdepends=('git: git support' 'libsecret: keytar support')
options=(!strip) #to speed up build

_tools_commit=abb4d9e36e2ccfc006a5c6853eb96024e48bb529
source=(
  "theia-electron.sh"
  "https://gitlab.com/ccorn/theia-packaging-tools/-/raw/$_tools_commit/make-package-json.sh"
  "extra-plugins.json"
  ".yarnclean"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-EPL"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-GPL"
)
sha256sums=('49dc3027c1bed942afde93608248765178d8f32145c1f8c75b68f4b191bf0af0'
            'a1d37799b39c75329d4ef8083e21282ccec02b4af7c0228c413f4e5359c67458'
            '0c630e6e0a41db9c8f4823d105cdd434324151e322b2ffca09ea0421ed7e3def'
            'f43cc8aaf4738166acdf4e54817ad7e9c031c4dacf23eb8496f9edae33b3f1d0'
            '76f48bbc421d298113c73cee628c9d0fd8b14381590d871928f4f0bd87e812ce'
            '25f7748c49f29bd35a28b1f9509357367f2c83c5a275162a969e3c2210432d54'
            '8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c'
            '67f01f629f5dbf31b343db44aa23d245d480fc3fd5ddf8dc9298e96d4eace28d')

prepare() {
  cd "$srcdir"
  # @theia/secondary-window as of 1.30.0 said to have issues with electron
  # Remove @theia/preview in favor of vscode.markdown*
  bash make-package-json.sh "${pkgver/.next./-next.}" | \
  grep -vE "@theia/(secondary-window|preview)\b" >package.json
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
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-[EG]PL
}
