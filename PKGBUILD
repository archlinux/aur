# Maintainer: justbispo <aur.fyxy0@slmail.me>
pkgname=(
  vencord-git
  chromium-vencord-git
  firefox-vencord-git
  firefox-developer-edition-vencord-git
  librewolf-vencord-git
)
pkgbase=vencord-git
_pkgname=Vencord
pkgver=1.10.4.r0.g013c8d0
pkgrel=2
pkgdesc="The cutest Discord client mod"
arch=(any)
url=https://vencord.dev
_ghurl="https://github.com/Vendicated/Vencord"
license=(GPL3)
makedepends=(
  git
  pnpm
)
source=("git+$_ghurl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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

package_vencord-git() {
  depends=(vesktop)
  provides=(vencord)
  conflicts=(vencord)
  install=vencord.install
  
  cd "$srcdir"/$_pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vencord/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/vencord/README.md
  cd dist/
  install -d "$pkgdir"/usr/lib/vencord
  cp -r -- vencord* preload* patcher* renderer* "$pkgdir"/usr/lib/vencord
}

package_chromium-vencord-git() {
  pkgdesc+=' (unpacked webextension)'
  optdepends=(chromium vivaldi google-chrome opera brave ungoogled-chromium)
  provides=(chromium-vencord)
  conflicts=(chromium-vencord)
  install=vencord.install
  
  cd "$srcdir"/$_pkgname/dist/chromium-unpacked
  install -dm755 "$pkgdir"/usr/lib/vencord-chromium
  cp -r -- * "$pkgdir"/usr/lib/vencord-chromium
}

package_firefox-vencord-git() {
  depends=(firefox)
  provides=(firefox-vencord)
  conflicts=(firefox-vencord)
  install=vencord.install

  cd "$srcdir"/$_pkgname/dist
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_firefox-developer-edition-vencord-git() {
  depends=(firefox-developer-edition)
  provides=(firefox-vencord)
  conflicts=(firefox-vencord)
  install=vencord.install

  cd "$srcdir"/$_pkgname/dist
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/firefox-developer-edition/browser/extensions/vencord-firefox@vendicated.dev.xpi
}

package_librewolf-vencord-git() {
  depends=(librewolf)
  provides=(librewolf-vencord)
  conflicts=(librewolf-vencord)
  install=vencord.install

  cd "$srcdir"/$_pkgname/dist
  install -Dm644 extension-firefox.zip "$pkgdir"/usr/lib/librewolf/browser/extensions/vencord-firefox@vendicated.dev.xpi
}
