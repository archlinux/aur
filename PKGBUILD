# Maintainer: Javad <ja7ad@live.com>

pkgname=gemini-cli-live-bin
_pkgname=gemini-cli
pkgver=0.34.0
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal (Live version)"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  libgcc
  libstdc++
  glib2
  glibc
  libsecret
  nodejs
)
makedepends=(
  git
  jq
  npm
)
checkdepends=(
  vim
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
  cd $_pkgname
  npm clean-install --ignore-scripts
}

build() {
  cd $_pkgname
  npm run bundle
  local bundled=$(jq '.dependencies + .optionalDependencies | keys' package.json)
  npm pkg set --json bundledDependencies="$bundled"
  npm pack
}

check() {
  cd $_pkgname
  npm run build
  npm test -- \
    --exclude='**/BuiltinCommandLoader.test.ts' \
    --exclude='**/config.integration.test.ts' \
    --exclude='**/mcp-client.test.ts'
}

package() {
  cd $_pkgname
  npm install --global --offline --prefix "$pkgdir/usr" \
    google-$_pkgname-$pkgver.tgz
  install -vDm644 -t "$pkgdir/usr/share/doc/$_pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}
