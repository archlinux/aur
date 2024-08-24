# Maintainer: justbispo <aur.fyxy0@slmail.me>
pkgname=(
  vencord
  chromium-vencord
  firefox-vencord
  librewolf-vencord
)
pkgbase=vencord
_pkgname=Vencord
pkgver=1.9.8
pkgrel=1
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vendicated/Vencord"
license=(GPL3)
makedepends=(
  git
  pnpm
)
source=("git+$_ghurl.git#tag=v$pkgver")
sha256sums=('ddb7bd3c0542d04b1f3419913a27552ced0bf6dc1cacfb05b3fb0c9473e44c64')

prepare() {
  cd "$srcdir"/$_pkgname
  pnpm install --frozen-lockfile	
}

build() {
  cd "$srcdir"/$_pkgname
  pnpm buildStandalone && pnpm buildWeb
}

check() {
  cd "$srcdir"/$_pkgname
  pnpm test && pnpm testWeb
}

package_vencord() {
  depends=(vesktop)
  provides=(vencord)
  conflicts=(vencord)
  install=vencord.install
  
  cd "$srcdir"/$_pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgbase/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgbase/README.md
  cd dist/
  install -d "$pkgdir"/usr/lib/$pkgbase
  cp -r -- vencord* preload* patcher* renderer* "$pkgdir"/usr/lib/$pkgbase
}

package_chromium-vencord() {
  pkgdesc+=' (unpacked webextension)'
  optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
  provides=(chromium-vencord)
  conflicts=(chromium-vencord)
  install=vencord.install
  
  cd "$srcdir"/$_pkgname/dist/chromium-unpacked
  install -dm755 "$pkgdir"/usr/lib/"$pkgbase"-chromium
  cp -r -- * "$pkgdir"/usr/lib/"$pkgbase"-chromium
}

package_firefox-vencord() {
  depends=(firefox)
  provides=(firefox-vencord)
  conflicts=(firefox-vencord)
  install=vencord.install

  cd "$srcdir"/$_pkgname/dist
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_librewolf-vencord() {
  depends=(librewolf)
  provides=(librewolf-vencord)
  conflicts=(librewolf-vencord)
  install=vencord.install

  cd "$srcdir"/$_pkgname/dist
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/librewolf/browser/extensions/vencord-firefox@vendicated.dev.xpi
}
