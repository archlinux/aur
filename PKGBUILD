# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=geforce-infinity
_app_id=net.astralvixen.geforceinfinity
pkgver=1.2.1
pkgrel=1
_nodeversion=22
_electronversion=37
pkgdesc="A next-gen application designed to enhance the GeForce NOW experience."
arch=('x86_64')
url="https://geforce-infinity.xyz"
license=('MIT')
depends=("electron${_electronversion}")
makedepends=(
  'bun'
  'git'
  'nvm'
  'python-setuptools'
)
source=("GeForce-Infinity-$pkgver.tar.gz::https://github.com/AstralVixen/GeForce-Infinity/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('d5a9c8885aa87769a0e1353b09668e20bd6036a6561cc3a89f31530e8df8a24b'
            '426e8f155c4f2273201ad33d0c0521c35bbea2259a11cb018572d6ca8b40b82d')

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

  desktop-file-edit --set-key=Exec --set-value="$pkgname" \
    "com.github.astralvixen.$pkgname.desktop"
}

build() {
  cd "GeForce-Infinity-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  _ensure_local_nvm
  bun install
  bun run build
  bun electron-builder --linux --x64 --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

check() {
  cd "GeForce-Infinity-$pkgver"
  desktop-file-validate "com.github.astralvixen.$pkgname.desktop"
}

package() {
  cd "GeForce-Infinity-$pkgver"
  install -Dm644 builds/linux-unpacked/resources/app.asar -t \
    "$pkgdir/usr/lib/$pkgname/"
  cp -r builds/linux-unpacked/resources/{app.asar.unpacked,assets} -t \
    "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 dist/assets/resources/infinitylogo.png \
    "$pkgdir/usr/share/pixmaps/${_app_id}.png"
  install -Dm644 "com.github.astralvixen.$pkgname.desktop" \
    "$pkgdir/usr/share/applications/${_app_id}.desktop"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
