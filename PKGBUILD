# Maintainer: Peter Cai <peter at typeblog dot net>

pkgname=pofwjs
pkgver=1.0.2
pkgrel=1
pkgdesc="A port forwarding tool implemented in Node.Js"
arch=('i686' 'x86_64')
url="https://github.com/PeterCxy/pofw.js"
license=('WTFPL')
depends=(
  'nodejs'
  'bash'
)
makedepends=(
  'npm'
  'coffee-script'
)
backup=(
  'etc/pofwjs/config.json'
)

source=(
  "https://github.com/PeterCxy/pofw.js/archive/${pkgver}.tar.gz"
  "pofwjs.service"
  "config.json"
)
md5sums=('e143c1fd6909fee0be95749cdf8b5934'
         '689439125b8cb4266d6a939933b7989d'
         'edf8fc78149b537cd3d01b22cdb52941')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir"
  cp -R "$srcdir/pofw.js-$pkgver" "$_npmdir/pofw.js"
  local _systemddir="$pkgdir/usr/lib/systemd/system"
  mkdir -p "$_systemddir"
  cp pofwjs.service "$_systemddir"
  local _confdir="$pkgdir/etc/pofwjs"
  mkdir -p "$_confdir" && chmod 777 "$_confdir"
  cp config.json "$_confdir"
  cd "$_npmdir/pofw.js" && npm install --production && npm run prepublish && rm -rf node_modules/.bin
  rm -rf example
  local _bindir="$pkgdir/usr/bin"
  mkdir -p "$_bindir"
  ln -s /usr/lib/node_modules/pofw.js/bin/pofwjs "$_bindir/pofwjs"
}

