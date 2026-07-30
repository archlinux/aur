# Maintainer: kitasael-burakku
pkgname=maly
pkgver=1.11.0
pkgrel=1
pkgdesc="Local terminal music player (daemon + TUI + CLI) with mpv backend, gapless playback and MPRIS2"
arch=('x86_64' 'aarch64')
url="https://github.com/kitasael-burakku/Malody-Mallow"
license=('GPL-3.0-only')
depends=('mpv')
optdepends=(
	'yt-dlp: descargar audio con maly get'
	'ffmpeg: postprocesado de maly get y duraciones (ffprobe) en el escaneo'
	'pipewire: visualizador de espectro (pw-record)'
	'pulseaudio: visualizador de espectro (parec), alternativa a pipewire'
)
makedepends=('go' 'git')
_pkgsrc=Malody-Mallow
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "maly.service")
sha256sums=('1ce9ba8e54cf56697ba6c9446fb16c86628a43422acf8d74aae36e3d8320f45c'
            '5a16d1b26028debb995d4a3b0ee4beeca41d292507378be735ce4c189d305080')

prepare() {
	cd "$_pkgsrc-$pkgver"
	export GOPATH="$srcdir/go"
	go mod download -modcacherw
}

build() {
	cd "$_pkgsrc-$pkgver"
	# maly no usa CGo (SQLite es modernc.org/sqlite, puro Go) — sin flags
	# CGO_CPPFLAGS/CFLAGS/LDFLAGS de por medio, a diferencia del ejemplo
	# genérico de la ArchWiki.
	export CGO_ENABLED=0
	export GOPATH="$srcdir/go"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build/maly ./cmd/maly
}

check() {
	cd "$_pkgsrc-$pkgver"
	export GOPATH="$srcdir/go"
	export GOFLAGS="-mod=readonly -modcacherw"
	go vet ./...
	# El daemon usa mpv real y se auto-salta con t.Skip si no está en el
	# entorno de build (chroot limpio); en un sistema con mpv corre entero.
	go test ./...
}

package() {
	cd "$_pkgsrc-$pkgver"
	install -Dm755 build/maly "$pkgdir/usr/bin/maly"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/maly.service" "$pkgdir/usr/lib/systemd/user/maly.service"

	install -Dm644 <("$pkgdir/usr/bin/maly" completions bash) \
		"$pkgdir/usr/share/bash-completion/completions/maly"
	install -Dm644 <("$pkgdir/usr/bin/maly" completions fish) \
		"$pkgdir/usr/share/fish/vendor_completions.d/maly.fish"
	install -Dm644 <("$pkgdir/usr/bin/maly" completions zsh) \
		"$pkgdir/usr/share/zsh/site-functions/_maly"
}
