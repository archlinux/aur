# Maintainer: Lorens Gwine <lorensgwine@gmail.com>
pkgname=tc-twitch-git
_pkgname=tc-twitch
pkgver=10.2.0.r0.ge8ed5df
pkgrel=1
pkgdesc="The chat client for Twitch™"
arch=('any')
url="https://github.com/mccxiv/${_pkgname}"
license=('custom')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git' 'npm')
source=("$pkgname::git+https://github.com/mccxiv/tc.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $srcdir/$pkgname
  rm -rf _dist
  rm -rf _build
  mkdir -p _build
  npm install
  npm install 7zip-bin-linux 
  node_modules/.bin/webpack
  cp src/tc-renderer/index.html _build/index.html
  cp src/package.json _build/package.json
  npm run dist:linux
  # license
  sed -n '/### License/,/You may not/p' README.md > LICENSE
}

package() {
  install -d "$pkgdir"/{usr/bin,opt}
  cp -a $srcdir/$pkgname/dist/linux-unpacked $pkgdir/opt/$_pkgname
  ln -s $pkgdit/opt/$_pkgname/Tc $pkgdir/usr/bin/tc-twitch
  install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
