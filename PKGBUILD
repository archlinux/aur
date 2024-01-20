# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=crankshaft
_app_id="space.$pkgname.Crankshaft"
pkgver=0.2.5
pkgrel=2
pkgdesc="A Steam client plugin manager and framework."
arch=('x86_64')
url="https://crankshaft.space"
license=('GPL-3.0-or-later')
depends=('libappindicator-gtk3' 'python-jsbeautifier' 'xdg-utils')
makedepends=('git' 'go' 'setconf' 'yarn')
checkdepends=('appstream-glib' 'desktop-file-utils')
_commit=e8e69525d9a649fbd1759ee727f7a3baf33012da  #tags/0.2.5^0
source=("git+https://git.sr.ht/~avery/crankshaft#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"

  go mod download -x

  pushd injected
  yarn install
  popd

  mkdir -p rpc/inject/scripts
  mkdir -p build

  setconf "autostart/$pkgname.service" ExecStart "$pkgname"
  setconf "autostart/$pkgname.service" ExecStopPost "$pkgname -cleanup"

  # Don't display title in system tray
  sed -i '/systray.SetTitle/d' tray/tray.go
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go run -v cmd/bundle-scripts/main.go
  cp .build/* rpc/inject/scripts
  go build -v -o build ./cmd/...

  # Clean module cache for makepkg -C
  go clean -modcache
}

check() {
  cd "$pkgname"
  desktop-file-validate "desktop/${_app_id}.desktop"
  appstream-util validate-relax --nonet "desktop/${_app_id}.metainfo.xml"
}

package() {
  cd "$pkgname"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "desktop/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "desktop/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "autostart/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"

  for icon_size in 32 64 128; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -Dm644 desktop/logo.${icon_size}.png \
      "$pkgdir/${icons_dir}/${_app_id}.png"
  done
  install -Dm644 desktop/logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
}
