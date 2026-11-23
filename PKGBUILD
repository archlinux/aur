# Maintainer: HanHaocheng <hanhaocheng@archlinux>
pkgname=deveco-cli
pkgver=1.3.12
pkgrel=3
pkgdesc='HarmonyOS application development command line tool (DevEco CLI)'
arch=('x86_64')
url='https://developer.huawei.com/consumer/cn/deveco-studio/'
license=('MIT')
depends=('nodejs>=22')
makedepends=('npm')
optdepends=(
  'deveco-commandline-tools: hvigorw/ohpm/hstack/hdc toolchain (>= 26.0.0); export DEVECO_CLI_CLT_PATH to enable'
  'python: bundled skill scripts (crash/dfx analysis)'
  'python-pillow: design2arkts UI reconstruction scoring'
)
options=('!strip' '!debug')
source=("https://registry.npmjs.org/@deveco/deveco-cli/-/deveco-cli-${pkgver}.tgz")
sha256sums=('SKIP')

build() {
  rm -rf "$srcdir/pkgroot"
  mkdir -p "$srcdir/pkgroot"
  cp -r "$srcdir/package/." "$srcdir/pkgroot/"
  cd "$srcdir/pkgroot"
  npm install --omit=dev --no-audit --no-fund --cache "$srcdir/npmcache" --registry https://registry.npmjs.org
}

package() {
  install -d "$pkgdir/usr/lib/deveco-cli"
  cp -r --no-preserve=ownership "$srcdir/pkgroot/." "$pkgdir/usr/lib/deveco-cli/"
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/devecocli" <<'EOF'
#!/bin/sh
# packaged for Arch: self-update would bypass pacman
export DEVECO_CLI_DISABLE_UPDATE=${DEVECO_CLI_DISABLE_UPDATE:-1}
export DEVECO_CLI_SKIP_VERSION_CHECK=${DEVECO_CLI_SKIP_VERSION_CHECK:-1}
exec node /usr/lib/deveco-cli/cli.js "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/devecocli"
  install -Dm644 "$srcdir/pkgroot/node_modules/@deveco/deveco-cli-common/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'DevEco CLI needs the Huawei Command Line Tools on Linux:' \
    '  - install AUR: deveco-commandline-tools (requires a login-gated zip)' \
    '  - or point at an existing toolchain:' \
    '      export DEVECO_CLI_CLT_PATH=/path/to/command-line-tools' \
    '  - the toolchain must report version >= 26.0.0, older 6.x builds are rejected' \
    > "$pkgdir/usr/share/doc/$pkgname/README"
}
