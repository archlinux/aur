# Maintainer: enzomtp <contact@enzomtp.party>
pkgname=pawtop
_pkgname=Pawtop
pkgdesc="Pawtop is a custom Discord desktop app"
pkgver=3.1.2
# Reminder for devs: don't forget to update the electron version on pawtop.sh
pkgrel=1
electron=electron
arch=('x86_64' 'aarch64')
url="https://github.com/enzomtpYT/Pawtop"
license=('GPL3')
install=pawtop.install
depends=("${electron}")
makedepends=('cmake' 'gcc' 'nodejs' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!strip')
conflicts=('pawtop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'io.github.enzomtpyt.pawtop.desktop'
        'pawtop.sh'
        'pawtop.install')
sha256sums=('5948ca532121e4d1ff98893f30bc22281fb3c41ac8b694ab261fca4d41bb31bd'
            'fbe5a63a2233fb21d14d9f2a66e991aa0395670964f853497566b20fc36867e5'
            '6ba1d7bc3343acb6bfad85b7edea6d8e49805221b136fc9890e0a5c607423bba'
            '79c7b3772ad2344b49a4cda0537e3f6daca6a1c2865cafea9569a9de2fad9cee')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  #  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
  
  # Fix git hash retrieval
  sed -i "s/const gitHash = execSync(\"git rev-parse HEAD\", { encoding: \"utf-8\" }).trim();/const gitHash = \"v${pkgver}\";/" scripts/build/build.mts
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

  install -Dm 644 "io.github.enzomtpyt.pawtop.desktop" "$pkgdir/usr/share/applications/io.github.enzomtpyt.pawtop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
