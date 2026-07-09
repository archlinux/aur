# Maintainer: kanya-approve
pkgname=fingertip-git
_pkgname=fingertip
pkgver=0.0.4.beta2.r27.g364f9ff
pkgrel=1
pkgdesc='Menubar app running a lightweight decentralized Handshake resolver with stateless DANE (bundles hnsd)'
arch=(x86_64)
url=https://github.com/randomlogin/fingertip
license=(Apache-2.0 MIT)
depends=(getdns gtk3 libappindicator-gtk3 unbound)
makedepends=(git go)
provides=(fingertip)
conflicts=(fingertip)
source=(git+https://github.com/randomlogin/fingertip.git
        git+https://github.com/handshake-org/hnsd.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export GOFLAGS='-mod=readonly -modcacherw'
  go mod download
}

build() {
  cd hnsd
  ./autogen.sh
  ./configure
  make

  cd "../$_pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -o fingertip .
}

package() {
  install -Dm755 hnsd/hnsd "$pkgdir/usr/lib/$_pkgname/hnsd"
  install -Dm644 hnsd/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.hnsd"

  cd "$_pkgname"
  install -Dm755 fingertip "$pkgdir/usr/lib/$_pkgname/fingertip"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/fingertip" "$pkgdir/usr/bin/fingertip"
  install -Dm644 builds/linux/appdir/usr/share/applications/fingertip.desktop -t "$pkgdir/usr/share/applications"
  local s
  for s in 48 256; do
    install -Dm644 "builds/linux/appdir/usr/share/icons/hicolor/${s}x${s}/apps/fingertip.png" \
      "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/fingertip.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
