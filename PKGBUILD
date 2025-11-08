# Contributor: Bence Hornák <bence.hornak@gmail.com>
# Contributor: Leon De Andrade <leondeandrade@hotmail.com>
# Maintainer: Christian Cornelssen <email@address.invalid>

pkgname=theia-electron
pkgver=1.66.1
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url='https://www.theia-ide.org/'
pkgdesc="Cloud & Desktop IDE Platform"
#license=('EPL-2.0' 'GPL-2.0-only WITH Classpath-exception-2.0' 'MIT' 'LicenseRef-LICENSE-vscode.txt')
#license=('EPL-2.0 AND GPL-2.0-only WITH Classpath-exception-2.0 AND MIT AND LicenseRef-LICENSE-vscode.txt')
_license_files=(LICENSE-EPL LICENSE-GPL-2.0-ONLY-CLASSPATH-EXCEPTION LICENSE-MIT.txt LICENSE-vscode.txt)
#_licenses="${_license_files[*]/#/LicenseRef-}"
#license=("${_licenses//${IFS:0:1}/ AND }")
license=("${_license_files[@]/#/LicenseRef-}")
depends=('nodejs-lts-jod' 'nss' 'gtk3' 'libxss' 'libxkbfile' 'ripgrep')
makedepends=('bash>=5' 'curl' 'diffutils' 'jq'
             'gcc' 'git' 'make' 'node-gyp' 'npm' 'pkgconf' 'python-setuptools' 'yarn')
optdepends=('git: git support' 'libsecret: keytar support')
options=(!debug !strip)

_tools_commit=9d62c805f48a53b9bd7aafc2304fbb6c1fea8a21
source=(
  "theia-electron.sh"
  "https://gitlab.com/ccorn/theia-packaging-tools/-/raw/$_tools_commit/make-package-json.sh"
  "extra-plugins.json"
  ".yarnclean"
  "theia-electron.desktop"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/logo/theia.svg"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-EPL"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-GPL-2.0-ONLY-CLASSPATH-EXCEPTION"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-MIT.txt"
  "https://raw.githubusercontent.com/eclipse-theia/theia/v$pkgver/LICENSE-vscode.txt"
)
sha256sums=('49dc3027c1bed942afde93608248765178d8f32145c1f8c75b68f4b191bf0af0'
            '590086824e60c5a7f6b8796f876b6a3ad0521ab252ed739206a46bc94543b762'
            '0f92aca453800b0a5b554333975f2a22634eea85f25d0ae8930e1e49077735c3'
            'f43cc8aaf4738166acdf4e54817ad7e9c031c4dacf23eb8496f9edae33b3f1d0'
            '76f48bbc421d298113c73cee628c9d0fd8b14381590d871928f4f0bd87e812ce'
            'd9712e3b79a98d7b1d5fd64d709daa806be6944c3f0cebf22879cd0e3c08ce06'
            '8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c'
            '7d74322f208420b6886c40eda1c7d1bad618f12e067af934f02bc9bbfcc038ae'
            'cfca8e97a3cb58c3a8004c4642dfec191b09d3e76a322c232d0b7edf3d66aa7c'
            '39e379a27a642e8146a3c1a089fa96cf8221d2233a7f5821e33a91da7dacfc3b')

prepare() {
  cd "$srcdir"
  # Remove @theia/preview in favor of vscode.markdown*.
  # @theia/notebook not enabled for electron yet, work in progress anyway.
  # @theia/test: Not listed in the electron version.
  # Note: As of 1.41.0, those get pulled in anyway. Sigh.
  # 1.50.0: @theia/git removed from electron version
  # (presumably in favor of vscode.git{,-base}).
  # Removing @theia/ai-vercel-ai because it pulls in opentelemetry.
  # Add postinstall script.
  bash make-package-json.sh "${pkgver/.next./-next.}" | \
  grep -vE "@theia/(ai-vercel-ai|git|notebook|plugin[-0-9_a-z]*|preview|test)\b" | \
  jq '.scripts.postinstall = "theia-patch"' >package.json
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
  install -dm755 "$pkgdir/usr/lib/$pkgname"

  # Source code (command-line symlinks dereferenced, if any) and plugins
  cp -RH --no-preserve=ownership --preserve=mode \
      src-gen lib node_modules package.json \
      plugins \
      "$pkgdir/usr/lib/$pkgname/"
  chmod -R a+rX,go-w "$pkgdir/usr/lib/$pkgname"
  # Replace ripgrep binaries with system version
  find "$pkgdir/usr/lib/$pkgname" -name rg -type f -exec ln -sfv /usr/bin/rg {} \;

  # Executable
  install -Dm755 theia-electron.sh "$pkgdir/usr/bin/$pkgname"
  # Desktop file
  install -Dm644 theia-electron.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # Icon
  install -Dm644 theia.svg "$pkgdir"/usr/share/pixmaps/theia.svg

  # License
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-*
}
