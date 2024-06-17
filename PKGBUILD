# Maintainer: Cortex
# Forked from Vesktop
pkgname=sunroof
_pkgname=Sunroof
pkgdesc="Sunroof is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=1.6.0
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/verticalsync/Sunroof"
license=('GPL3')
makedepends=('pnpm' 'nodejs')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
conflicts=('sunroof-bin')
source=("https://github.com/verticalsync/Sunroof/archive/refs/tags/v${pkgver}.tar.gz"
        'me.verticalsync.sunroof.desktop'
        'sunroof.sh')
sha256sums=('32766adf1140df048da03c191f2e50421f8360d14dc3bc405479a087be96b0ec'
            '959683d191af774e3b3f35d2b2edf85d029628dff8b0a989cdaa1b4604f3fba9'
            '1bdc4d3b8454d3bffc0c454685b45179893fff5e1cfafde00417e839addb1685')

# Temporary fix until https://github.com/Vencord/Vesktop/commit/d11a9a04ff42ff8f2baa694c9747f8570aa48f58
# gets into a release
prepare() {
  cd "$_pkgname-$pkgver"

  sed -i 's/pnpm@8.11.0/pnpm@9.1.0/' package.json
}

build() {
  cd "$_pkgname-$pkgver"

  pnpm i
  pnpm package:dir
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/"{lib,bin}

  cp -a "$_pkgname-$pkgver/dist/linux-unpacked" "${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 "./sunroof.sh" "$pkgdir/usr/bin/sunroof"

  install -Dm 644 "me.verticalsync.sunroof.desktop" "$pkgdir/usr/share/applications/me.verticalsync.sunroof.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

