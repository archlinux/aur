# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgbase=vscode-powershell
# A package per editor package, as each installs its built-in extensions somewhere else
pkgname=(
  code-powershell
  visual-studio-code-bin-powershell
  vscodium-powershell
  vscodium-bin-powershell
)
pkgver=2026.1.2preview
pkgrel=1
pkgdesc="PowerShell extension for Visual Studio Code, using powershell-editor-services"
arch=('any')
url='https://github.com/PowerShell/vscode-powershell'
license=('MIT')
# The extension of the version that bundles PowerShell Editor Services 4.7.0, which upstream
# released together
depends=(
  powershell
  'powershell-editor-services>=4.7.0'
)
makedepends=(
  npm
)
# The tests run in Code - OSS, the editor in the repositories
checkdepends=(
  code
  xorg-server-xvfb
)
install="$pkgbase.install"
# Upstream versions the pre-releases (odd minor versions) as -preview
_tag="v${pkgver/preview/-preview}"
# The editor version the extension requires (engines.vscode in package.json)
_editorver=1.114.0
source=("vscode-powershell-$_tag.tar.gz::$url/archive/$_tag.tar.gz")
sha512sums=('b8e9fe217265d95bced8ff5dff315449f54b3cb8f8ebb579fa126aaf1faa62de57c74efbf5a78034a29df5206d525449115df4614481145513bc8d8b75747933')
b2sums=('9818181f73af82cd97a93af2c977fce4b69f803604da21ef2efeb7d29e6e5fdfbb4195e43e3d314fc6e4145fde6e7534c58f265b4fad1b471079b067d60508df')

prepare() {
  cd "vscode-powershell-${_tag#v}" || exit
  # With the npm registry instead of upstream's mirror on Azure Artifacts (.npmrc), the lockfile
  # pins the integrity of the packages
  npm ci --cache "$srcdir/npm-cache" --registry https://registry.npmjs.org/ --no-audit --no-fund
  # The modules of PowerShell Editor Services and PSScriptAnalyzer, which upstream bundles, come from
  # powershell-editor-services. Upstream links them like this to build from its repository as well.
  ln -sfn /usr/share/powershell/Modules modules
  # The tests run in the installed Code - OSS instead of a downloaded VS Code Insiders. They start
  # its Electron directly, as /usr/bin/code only starts it in the background. Code - OSS has
  # vscode.powershell built in, which test-cli would install in a downloaded VS Code.
  sed -i -E \
    -e '/It may break CI/d' \
    -e 's|version: "insiders",|useInstallation: { fromPath: process.env.CODE_ELECTRON },\n    skipExtensionDependencies: true,|' \
    -e 's|^    launchArgs: \[|&\n        "/usr/lib/code/code.mjs",|' \
    .vscode-test.mjs
}

build() {
  cd "vscode-powershell-${_tag#v}" || exit
  # Like the release build (vscode-powershell.build.ps1)
  npm run compile -- --minify
}

check() {
  cd "vscode-powershell-${_tag#v}" || exit
  # The Electron /usr/bin/code runs Code - OSS with
  local _electron
  _electron=$(sed -n -E 's/^name=(electron[0-9]+).*/\1/p' /usr/bin/code)
  # Without npm test, whose pretest would replace the release build with a debug build. With the
  # user's data of Code - OSS in $srcdir.
  HOME="$srcdir/home" CODE_ELECTRON="/usr/lib/$_electron/electron" \
    xvfb-run --auto-servernum npx vscode-test
}

# Installs the files of the extension package (.vscodeignore) as a built-in extension into the
# given directory of built-in extensions. The editors prefer an installed extension only if it's
# newer.
_package_extension() {
  # Without cd, which namcap's restricted shell doesn't allow when it runs the package functions
  local _src="$srcdir/vscode-powershell-${_tag#v}"
  local _extdir="$pkgdir/$1/ms-vscode.powershell"
  install -dm755 "$_extdir/dist"
  install -m644 "$_src/package.json" "$_src"/*.md "$_src"/*.txt -t "$_extdir/"
  install -m644 "$_src/dist/extension.js" -t "$_extdir/dist/"
  cp -r --no-preserve=ownership "$_src"/{docs,examples,media,snippets,themes} "$_extdir/"
  cp -a "$_src/modules" "$_extdir/"
  # The package of the calling package function
  install -Dm644 "$_src/LICENSE.txt" -t "$pkgdir/usr/share/licenses/${FUNCNAME[1]#package_}/"
}

package_code-powershell() {
  pkgdesc="${pkgdesc/Visual Studio Code/Code - OSS}"
  depends+=("code>=$_editorver")
  _package_extension usr/lib/code/extensions
}

package_visual-studio-code-bin-powershell() {
  pkgdesc+=" (for visual-studio-code-bin)"
  depends+=("visual-studio-code-bin>=$_editorver")
  _package_extension usr/share/code/resources/app/extensions
}

package_vscodium-powershell() {
  pkgdesc="${pkgdesc/Visual Studio Code/VSCodium}"
  depends+=("vscodium>=$_editorver")
  _package_extension usr/share/vscodium/resources/app/extensions
}

package_vscodium-bin-powershell() {
  pkgdesc="${pkgdesc/Visual Studio Code/VSCodium} (for vscodium-bin)"
  depends+=("vscodium-bin>=$_editorver")
  _package_extension opt/vscodium-bin/resources/app/extensions
}
