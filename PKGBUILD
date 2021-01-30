# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Maintainer: MOTT <ted.jameson at pm dot me>
pkgname=telephant-git
pkgver=20210130
pkgrel=1
pkgdesc="A lightweight but modern Mastodon client, written in Go & QML"
arch=('x86_64')
url="https://github.com/muesli/telephant"
license=('MIT')
depends=('qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-multimedia')
makedepends=('go' 'pkgconf' 'qt5-tools' 'git' 'libpulse' 'glib2' 'mesa')
provides=("telephant")
conflicts=("telephant")
source=($pkgname::git://github.com/muesli/telephant.git)
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
