# Maintainer: robertfoster

pkgname=openbazaar-git
pkgver=v2.4.10.r0.gf724cf15
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon (Latest devel version)"
arch=(i686 x86_64)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('electron6')
optdepends=('openbazaard-git: server daemon occasionally needed by front-end')
makedepends=('git' 'npm')
conflicts=('openbazaar')
source=("${pkgname%%-git}::git+https://github.com/OpenBazaar/openbazaar-desktop.git"
  "${pkgname%%-git}.js"
  "${pkgname%%-git}.desktop"
)
install=${pkgname%%-git}.install
options=('!strip')

prepare() {
  cd $srcdir/${pkgname%%-git}
  sed -i '/electron/d' package.json
  npm install --save node-sass@5.0.0
  npm install --silent
}

build() {
  cd $srcdir/${pkgname%%-git}
  npm run build
}

package() {
  cd $srcdir
  appdir="usr/lib/${pkgname%%-git}"

  install -d $pkgdir/${appdir%%/${pkgname%%-git}}
  cp -rf ${pkgname%%-git} $pkgdir/$appdir
  install -Dm755 ${pkgname%%-git}.js $pkgdir/usr/bin/${pkgname%%-git}
  install -Dm644 ${pkgname%%-git}/imgs/icon.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}2.png
  install -Dm644 ${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop

  cd $pkgdir/$appdir
  rm -rf .git*
  rm -rf .travis
  cp -rf prod/* js/
  find "${pkgdir}"/${appdir} \
    -name "bin" -prune -exec rm -r '{}' \; \
    -or -name "example" -prune -exec rm -r '{}' \; \
    -or -name "examples" -prune -exec rm -r '{}' \; \
    -or -name "test" -prune -exec rm -r '{}' \;
  pathtoreplace=$(echo ${srcdir}/ | sed 's:/:\\\/:g')
  find "$pkgdir/$appdir/node_modules/" -name "*.json" -exec \
    sed -i "s/$pathtoreplace//g" {} +
}

pkgver() {
  cd $srcdir/${pkgname%%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
  '8359716a04cff2fd8499406408b6c590'
  'a278f17aa965510cadb534df49b245dd')
