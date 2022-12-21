# Maintainer: Bence Hornák <bence.hornak@gmail.com>
# Maintainer: Leon De Andrade <leondeandrade@hotmail.com>
# Contributor: Christian Cornelssen <email@address.invalid>

pkgname=theia-electron
pkgver=1.33.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
license=('EPL2')
depends=('nodejs>=12' 'nodejs<18' 'nss' 'gtk3' 'libxss' 'libxkbfile')
makedepends=('bash>=5' 'curl' 'diffutils' 'jq'
             'yarn' 'make' 'gcc' 'pkgconf' 'python' 'node-gyp')
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
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE"
)
sha256sums=('49dc3027c1bed942afde93608248765178d8f32145c1f8c75b68f4b191bf0af0'
            'a1d37799b39c75329d4ef8083e21282ccec02b4af7c0228c413f4e5359c67458'
            '330ad76b972458a6a28c35a933397e3f7fae69ab18c71b42726faa04bada08d7'
            'f43cc8aaf4738166acdf4e54817ad7e9c031c4dacf23eb8496f9edae33b3f1d0'
            '76f48bbc421d298113c73cee628c9d0fd8b14381590d871928f4f0bd87e812ce'
            '25f7748c49f29bd35a28b1f9509357367f2c83c5a275162a969e3c2210432d54'
            'ab3dbc4522d6f394431baa9a4e8355bb27594656d0985e17228a0976bbab1486')

prepare() {
  cd "$srcdir"
  # @theia/secondary-window as of 1.30.0 said to have issues with electron
  bash make-package-json.sh "${pkgver/.next./-next.}" | \
  grep -vF "@theia/secondary-window" >package.json
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
