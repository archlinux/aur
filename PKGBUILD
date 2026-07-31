# Maintainer: kitasael-burakku
pkgname=maly
pkgver=1.11.1
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
sha256sums=('5c4feaea199ac5cde63828c0d6b3297561fee5a41734b5c0788bcaac88ee211e'
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
	# -X marca el binario como empaquetado (internal/version.Channel): así
	# `maly update` no intenta instalar una segunda copia por detrás de
	# pacman y en cambio remite al gestor. Version (la const de versión)
	# no se toca: -X solo puede asignar variables de paquete, no consts.
	go build -ldflags "-X maly/internal/version.Channel=pacman" -o build/maly ./cmd/maly
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
