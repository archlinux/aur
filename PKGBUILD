# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_adwaita_commit=c88c9aad4ee20d6712d44ac9a7e39d585e59e83d
_logos_commit=33af350009a44b7b56f878635d0b88b2ecacc454
_octicons_commit=7b5d10a4f3af617084b6bd6bc33700b8e04c2470

pkgname=firefox-awesome-rss
pkgver=1.3.5
pkgrel=1
pkgdesc="Puts an RSS/Atom subscribe button back in URL bar"
arch=('any')
url="https://github.com/shgysk8zer0/awesome-rss"
license=('GPL')
groups=('firefox-addons')
makedepends=('git' 'jq' 'npm')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "git+https://github.com/shgysk8zer0/adwaita-icons.git#commit=$_adwaita_commit"
  "git+https://github.com/shgysk8zer0/logos.git#commit=$_logos_commit"
  "git+https://github.com/primer/octicons.git#commit=$_octicons_commit"
)
sha512sums=(
  'd1c2506685233965761ad8ccdf2c393d9829a3ff3944ac4305381caa2a4157060c4be326e729f25b0a4f900acd668af22f25232b0df670714a255ece1901954a'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  cd "awesome-rss-$pkgver"

  # Remove preinstall and postinstall scripts
  jq 'del(.scripts|(.preinstall, .postinstall))' package.json > package.json.new
  mv -f package.json.new package.json

  # Link git submodules
  rmdir img/{adwaita-icons,logos,octicons}
  ln -s "$srcdir"/{adwaita-icons,logos,octicons} img/
}

build() {
  cd "awesome-rss-$pkgver"
  npm ci --cache "$srcdir/npm-cache"
  npm run build
}

package() {
  cd "awesome-rss-$pkgver"
  install -Dm 644 "web-ext-artifacts/awesome_rss-$pkgver.zip" \
      "$pkgdir"/usr/lib/firefox/browser/extensions/'{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}'.xpi
}
