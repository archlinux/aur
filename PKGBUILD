# Maintainer: edu4rdshl <edu4rdshl[dot]protonmail.com>
# Submitter: picokan <todaysoracle@protonmail.com>
pkgname=vesktop
_pkgname=Vesktop
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=1.5.0
pkgrel=4
arch=('x86_64' 'aarch64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('electron')
makedepends=('pnpm' 'git')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
provides=('vencord')
conflicts=('vencord')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'vesktop.desktop'
        'vesktop.sh')
sha256sums=('7f20edeb4612386ae98d5dccfa4b37ad1f5336d4551de3375c3b16e81925b10a'
            '14b9412013940a8e4ecd5b1552910c2b03ae84eab849b8ce721796abe9418072'
            'b1c9ce99ba545b0baaba0eb63e5bb7a2f88cf335f66d775f32fa139ce6b479ab')
prepare() {
  # Use system's electron
  sed '/linux/s/^/        "electronDist": "\/usr\/lib\/electron",\n/' "$srcdir/$_pkgname-$pkgver/package.json"
}

build() {
  cd "$_pkgname-$pkgver"

  pnpm i
  pnpm package:dir
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/lib/vencord
  cp -R "$_pkgname-$pkgver/dist/linux-unpacked" "${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 "./vesktop.sh" "$pkgdir/usr/bin/vesktop"

  install -Dm 644 "vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname-$pkgver/LICENSE"
}

