# Maintainer: lilac <lilac@build.archlinuxcn.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: hexchain <i at hexchain.org>

pkgname=iease-music-git
_pkgname=iease-music
pkgver=613.a09864b
pkgrel=1
pkgdesc='Elegant neteaseMusic desktop app, Rock with NeteaseMusic.'
arch=('x86_64')
url="https://github.com/trazyn/ieaseMusic"
license=('MIT')
depends=('gconf' 'libnotify' 'nss' 'libxss' 'libappindicator-gtk3' 'libxtst')
makedepends=('git' 'npm')
provides=('iease-music')
conflicts=('iease-music')
source=("$_pkgname::git://github.com/trazyn/ieaseMusic.git"
	'iease-music.desktop'
	'iease-music.sh'
)
md5sums=('SKIP'
         '856fa5e3681d14e083161e3a97e31e38'
         '7034439d650b4a3828cd10e8287e969a')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  sed -i 's/^.*"electron".*$//;s/^.*"electron-builder".*$//' package.json
  npm install
}

package() {
  cd "$srcdir"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications/"

  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    	
  for size in 16 24 32 48 64 96 128 256; do
      target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
      mkdir -p $target
      install -Dm644 "resource/${size}x${size}.png" "$target/$_pkgname.png"
  done

  cd "$srcdir/$_pkgname/"
  mkdir -p "$pkgdir/opt/ieaseMusic/"
  cp -r --no-preserve='ownership' -- * "$pkgdir/opt/ieaseMusic/"
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}
