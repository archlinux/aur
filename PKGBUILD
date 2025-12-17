# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=electronmail
pkgver=5.3.5
pkgrel=1
_nodeversion=22
_electronversion=39
pkgdesc="Unofficial ProtonMail Desktop App"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('GPL-3.0-or-later')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=(
  'clang'
  'git'
  'libxcrypt-compat'
  'lld'
  'nvm'
  'pnpm'
  'python-setuptools'
  'yarn'
)
optdepends=('org.freedesktop.secrets: password storage backend')
source=("git+https://github.com/vladimiry/ElectronMail.git#tag=v$pkgver"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('b45763b2b733aee2ed496f5f2e97293c71f6ab5c47aee567cb7b0bfd13df1cf0'
            'c95c69f1d0db27180236ff063d9563da8750ecce81883adfb217b73ac3bb974e'
            'e7e9dd6e065118ae5d9624c7c81328086719fab198d30a92b08979c29757a3b2')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd ElectronMail
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd ElectronMail
  export PNPM_HOME="$srcdir/pnpm-home"
  export npm_config_cache="$srcdir/npm_cache"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  _ensure_local_nvm
  pnpm install --frozen-lockfile
  pnpm app:dist
  npm run electron-builder:shortcut -- --linux pacman \
    -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd ElectronMail
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
  cp -r dist/linux-unpacked/resources/app.asar.unpacked -t "$pkgdir/usr/lib/$pkgname/"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 app/assets/icons/png/${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
