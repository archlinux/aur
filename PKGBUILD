# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=zen-adblocker
pkgver=0.25.0
pkgrel=1
_nodeversion=24
pkgdesc="Simple, free and efficient ad-blocker and privacy guard"
arch=('x86_64' 'aarch64')
url="https://irbis.sh/zen"
license=('MIT')
depends=(
  'ca-certificates-utils'
  'coreutils'
  'gtk3'
  'libsoup3'
  'networkmanager'
  'p11-kit'
  'webkit2gtk-4.1'
)
makedepends=(
  'git'
  'go'
  'nvm'
  'wails'
)
optdepends=('libayatana-appindicator: tray icon')
source=("git+https://github.com/ZenPrivacy/zen-desktop.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('6e303394b531051dce5b1e03402da02b558a2f3d7699c782547acf469c811832'
            'ddbea3e9cd09c395c3c0056fad8b72d791be7f6f3ca0f07f9ced0020881b29d9')

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
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  cd zen-desktop
  export npm_config_cache="$srcdir/npm_cache"
  npm install --prefix frontend
}

build() {
  cd zen-desktop
  _instance_id="$(node -e 'const {randomUUID}=require("node:crypto");console.log(randomUUID());')"
  export npm_config_cache="$srcdir/npm_cache"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"
  _ensure_local_nvm
  wails build \
    -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" \
      -X 'github.com/ZenPrivacy/zen-desktop/internal/cfg.Version=${pkgver}' \
      -X 'github.com/ZenPrivacy/zen-desktop/internal/constants.InstanceID=${_instance_id}' \
      -X 'github.com/ZenPrivacy/zen-desktop/internal/selfupdate.NoSelfUpdate=true'" \
    -m -skipbindings \
    -tags prod,webkit2_41 \
    -o "$pkgname"

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd zen-desktop
  install -Dm755 "build/bin/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 assets/logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
