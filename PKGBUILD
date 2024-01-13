# Maintainer:  [unassigned]
# Contributor: dreieck
# Contributor: Christian Muehlhaeuser (https://aur.archlinux.org/account/muesli)
# Contributor: MOTT (https://aur.archlinux.org/account/mott)

pkgname=telephant-git
epoch=1
pkgver=0.1+rc3+10.r316.20210130.da437b7
pkgrel=1
pkgdesc="A lightweight but modern Mastodon client, written in Go & QML"
arch=('x86_64')
url="https://github.com/muesli/telephant"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-multimedia')
makedepends=('go' 'pkgconf' 'qt5-tools' 'git' 'libpulse' 'glib2' 'mesa')
provides=("telephant")
conflicts=("telephant")
source=("$pkgname::git+https://github.com/muesli/telephant.git")
sha256sums=('SKIP')

build() {
  export GOPATH="$srcdir"/gopath
  export PATH="$GOPATH"/bin:$PATH
  export QT_PKG_CONFIG=true
  export QT_VERSION="5.15.2"

  # Create dirs
  mkdir -p "$GOPATH"

  # Qt Bindings
  GO111MODULE=off go get -v -tags=no_env github.com/therecipe/qt/cmd/...

  # Build bindings (not usually needed)
  # $(go env GOPATH)/bin/qtsetup -test=false

  # Build Telephant
  cd "$srcdir/$pkgname"

  go mod vendor
  $(go env GOPATH)/bin/qtdeploy build desktop .
}

pkgver() {
  cd "${srcdir}/${pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "deploy/linux/telephant-git" "$pkgdir/usr/bin/telephant"
  install -Dm644 "assets/telephant.desktop" "$pkgdir/usr/share/applications/telephant.desktop"

  for icon_size in 8 16 32 64 128 256 512; do
    icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "$icon_dir"
    install -m644 "assets/icons/telephant-${icon_size}.png" "$icon_dir/telephant.png"
  done
}
