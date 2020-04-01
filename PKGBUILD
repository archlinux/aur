# Maintainer: Lorens Gwine <lorensgwine@gmail.com>
pkgname=tc-twitch-git
_pkgname=tc-twitch
_realname=tc
_icons_dir="additional-icons"
pkgver=15.7.0.r0.g78d57b7
pkgrel=1
pkgdesc="The chat client for Twitch™"
arch=('any')
url="https://github.com/mccxiv/${_realname}"
license=('custom:ISC')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('gconf')
makedepends=('git' 'npm')
source=("$_pkgname.desktop" "$_icons_dir.tar.gz" "$pkgname::git+https://github.com/mccxiv/tc.git")
md5sums=('72e3fe4d7076cd6e7c26d5d3819b1c0a'
         '3c4992d5dcc6f5e2fb212fa95e96e99f'
         'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $srcdir/$pkgname
  rm -rf _dist
  rm -rf _build
  mkdir -p _build
  npm install electron@^2.0.0
  npm install
  node_modules/.bin/webpack
  cp src/tc-renderer/index.html _build/index.html
  cp src/package.json _build/package.json
  npm run dist:linux
}

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  cp -a $srcdir/$pkgname/dist/linux-unpacked $pkgdir/opt/$_pkgname
  ln -s $pkgdit/opt/$_pkgname/tc $pkgdir/usr/bin/tc-twitch
  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm644 $srcdir/$pkgname/LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/LICENSE
  # icons
  install -Dm644 $srcdir/$pkgname/src/assets/icon16.png $pkgdir/usr/share/icons/hicolor/16x16/apps/$_pkgname.png
  install -Dm644 $srcdir/$pkgname/src/assets/icon256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png
  # additional icons
  for i in 22 24 32 36 48 64 72 96 128 192; do
	install -Dm644 $srcdir/$_icons_dir/icon$i.png $pkgdir/usr/share/icons/hicolor/$ix$i/apps/$_pkgname.png
  done 
}
