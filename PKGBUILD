# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=zen-adblocker
pkgver=0.15.1
pkgrel=1
_nodeversion=22
pkgdesc="Simple, free and efficient ad-blocker and privacy guard"
arch=('x86_64' 'aarch64')
url="https://zenprivacy.net"
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
source=("git+https://github.com/ZenPrivacy/zen-desktop.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('50e1ac68a91072ea935264bb3e6eec0097852211f7793ab78aa21e2841b1a856'
            '83ba6731812f400d32e595b893e8b1e42a8df5c32d11637976c39dad40e243cf')

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
  cd zen-desktop
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  nvm install "${_nodeversion}"
  npm install --prefix frontend
}

build() {
  cd zen-desktop
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  wails build \
    -ldflags "-X 'github.com/ZenPrivacy/zen-desktop/internal/cfg.Version=${pkgver}' \
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
  install -Dm644 assets/appicon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
