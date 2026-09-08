# Maintainer: Jay Chu <tothesong@gmail.com>
pkgname=vite-plus-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='The Unified Toolchain for the Web'
arch=('x86_64')
url='https://viteplus.dev'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('npm')
provides=("vite-plus=$pkgver")
conflicts=('vite-plus')
options=('!strip' '!debug')
source=(
  'package.json'
  'package-lock.json'
  "https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-$pkgver.tgz"
)
sha256sums=('96ab26deeefcc9aed93f8a7bf10d3fa98ac36665374e63751ed9386b199c711a'
            '1ff3899c30681f599649a81a0c140e1f04b1241d202e248284cc95b657182f5a'
            '5e13716359487d987e3d437fcc0bef78a52f7db69ba128836135ace6be27e5f5')

prepare() {
  npm ci --cache "$srcdir/npm-cache" \
    --omit=dev --ignore-scripts --no-audit --no-fund
}

build() {
  local shell
  for shell in bash fish zsh; do
    PATH="$srcdir/package:$PATH" VP_COMPLETE="$shell" vp > "vp.$shell"
  done
}

check() {
  VP_NO_UPDATE_CHECK=1 ./package/vp toolchain --global
}

package() {
  install -Dm755 package/vp "$pkgdir/usr/lib/vite-plus/bin/vp"
  cp -a node_modules "$pkgdir/usr/lib/vite-plus/"

  install -d "$pkgdir/usr/bin"
  local cmd
  for cmd in vp vpr vpx; do
    ln -s ../lib/vite-plus/bin/vp "$pkgdir/usr/bin/$cmd"
  done

  install -Dm644 vp.bash "$pkgdir/usr/share/bash-completion/completions/vp"
  install -Dm644 vp.fish "$pkgdir/usr/share/fish/vendor_completions.d/vp.fish"
  install -Dm644 vp.zsh "$pkgdir/usr/share/zsh/site-functions/_vp"
  install -Dm644 node_modules/vite-plus/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
