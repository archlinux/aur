# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geforce-infinity
pkgver=1.2.0
pkgrel=2
_nodeversion=22
_electronversion=37
pkgdesc="A next-gen application designed to enhance the GeForce NOW experience."
arch=('x86_64')
url="https://geforce-infinity.xyz"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=('nvm')
source=("GeForce-Infinity-$pkgver.tar.gz::https://github.com/AstralVixen/GeForce-Infinity/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('0de53385a83797ec377173e30133a470cd3909d4cb027d20d9320cf63e788ed1'
            '426e8f155c4f2273201ad33d0c0521c35bbea2259a11cb018572d6ca8b40b82d'
            'ba47bbcd38d72e3b1f92a72aebb89a0dae5782b4650a749d476642f731230865')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "GeForce-Infinity-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "GeForce-Infinity-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  _ensure_local_nvm
  npm install
  npm install bun
  npm run build
  ./node_modules/.bin/electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "GeForce-Infinity-$pkgver"
  install -Dm644 builds/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/$pkgname/"
  cp -r builds/linux-unpacked/resources/{app.asar.unpacked,assets} -t \
    "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 dist/assets/resources/infinitylogo.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
