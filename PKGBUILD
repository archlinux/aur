# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=crankshaft
_app_id="space.$pkgname.Crankshaft"
pkgver=0.2.4
pkgrel=1
pkgdesc="A manager and framework for Steam client plugins."
arch=('x86_64')
url="https://crankshaft.space"
license=('GPL3')
depends=('libappindicator-gtk3' 'python-jsbeautifier' 'steam')
makedepends=('git' 'go' 'setconf' 'yarn')
checkdepends=('appstream-glib' 'desktop-file-utils')
_commit=646a9f2908bee629d3a3f78243010834ac69cd10
source=("git+https://git.sr.ht/~avery/crankshaft#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/gopath"
  go mod tidy

  pushd injected
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  popd

  mkdir -p rpc/inject/scripts

  setconf "autostart/$pkgname.service" ExecStart "$pkgname"
  setconf "autostart/$pkgname.service" ExecStopPost "$pkgname -cleanup"
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go run -v cmd/bundle-scripts/main.go
  cp .build/* rpc/inject/scripts
  go build -v -o ".dist/$pkgname" "cmd/$pkgname/$pkgname.go"

  # Clean module cache for makepkg -C
  go clean -modcache
}

check() {
  cd "$srcdir/$pkgname"
  desktop-file-validate "desktop/${_app_id}.desktop"
  appstream-util validate-relax --nonet "desktop/${_app_id}.metainfo.xml"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ".dist/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "desktop/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "desktop/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "autostart/$pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"

  for icon_size in 32 64 128; do
    icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
    install -d "$pkgdir/${icons_dir}"
    install -m644 desktop/logo.${icon_size}.png \
      "$pkgdir/${icons_dir}/${_app_id}.png"
  done
  install -Dm644 desktop/logo.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
}
