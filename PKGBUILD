# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>
# Maintainer: MOTT <ted.jameson at pm dot me>
pkgname=telephant-git
pkgver=20190525
pkgrel=1
epoch=
pkgdesc="A lightweight but modern Mastodon client, written in Go & QML"
arch=('x86_64')
url="https://github.com/muesli/telephant"
license=('MIT')
groups=()
depends=('qt5-base' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('go' 'pkgconf' 'qt5-tools' 'git' 'libpulse' 'glib2' 'mesa')
checkdepends=()
optdepends=()
provides=("telephant")
conflicts=("telephant")
replaces=()
backup=()
options=()
install=
noextract=()
#source=($pkgname::git://github.com/muesli/telephant.git)
#md5sums=("SKIP")

build() {
	export GOPATH="$srcdir"/gopath
	export QT_PKG_CONFIG=true
	export QT_DIR=/usr

	# Qt Bindings
	go get -u -v -tags=no_env github.com/therecipe/qt/cmd/...

	# Building Telephant
	go get -d -v github.com/muesli/telephant
	cd gopath/src/github.com/muesli/telephant
	$(go env GOPATH)/bin/qtdeploy build desktop .
}


package() {
	install -Dm755 "gopath/src/github.com/muesli/telephant/deploy/linux/telephant" "$pkgdir/usr/bin/telephant"
	install -Dm644 "gopath/src/github.com/muesli/telephant/assets/telephant.desktop" "$pkgdir/usr/share/applications/telephant.desktop"
	
	for icon_size in 8 16 32 64 128 256 512; do
		icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
		install -d "$icon_dir"
		install -m644 "gopath/src/github.com/muesli/telephant/assets/icons/telephant-${icon_size}.png" "$icon_dir/telephant.png"
	done
}
