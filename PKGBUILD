# Maintainer: enzomtp
pkgname=pawtop
_pkgname=Pawtop
pkgdesc="A custom Discord desktop app with PawsomeVencord pre-installed"
pkgver=3.2.1
# Reminder for devs: don't forget to update the electron version on pawtop.sh
pkgrel=1
electron=electron40
arch=('x86_64' 'aarch64')
url="https://github.com/enzomtpYT/Pawtop"
license=('GPL3')
depends=("${electron}")
makedepends=('bun' 'cmake' 'gcc' 'nodejs' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!strip')
conflicts=('pawtop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'pawtop.desktop'
        'pawtop.sh')
sha256sums=('6bbfd3dd35bb9ec32faa4fd02112b5b2a61365769d9613eec99f0a852b78b630'
            'a95ff89d3fd1767cb9144ddebb90094bb3d2cdea2c9b0943514ec1cca8716fbf'
            'dda94a9d7934b7f146106521aa9117fa2357fc1cc22fa92b1d86a1aaf578ba04')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  #  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
}

build() {
  cd "$_pkgname-$pkgver"

  export SKIP_BUN_DOWNLOAD=true
  CI=true bun install
  bun run buildLibVesktop
  bun run package:dir
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/"
  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app-update.yml" "${pkgdir}/usr/lib/${pkgname}/"
  cp -r "$_pkgname-$pkgver/dist/linux-unpacked/resources/arrpc" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 "./pawtop.sh" "$pkgdir/usr/bin/pawtop"

  install -Dm 644 "pawtop.desktop" "$pkgdir/usr/share/applications/pawtop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
