# Maintainer: kitasael-burakku
pkgname=maly
pkgver=1.17.0
pkgrel=1
pkgdesc="Local terminal music player (daemon + TUI + CLI) with mpv backend, gapless playback and MPRIS2"
arch=('x86_64' 'aarch64')
url="https://github.com/kitasael-burakku/Malody-Mallow"
license=('GPL-3.0-only')
depends=('mpv')
optdepends=(
	'yt-dlp: buscar y descargar música (maly get y ctrl+g en la TUI)'
	'ffmpeg: postprocesado de maly get y duraciones (ffprobe) en el escaneo'
	'pipewire: visualizador de espectro (pw-record)'
	'pulseaudio: visualizador de espectro (parec), alternativa a pipewire'
)
makedepends=('go' 'git')
_pkgsrc=Malody-Mallow
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "maly.service")
sha256sums=('1ac18fbd8d6a6c7f87797475d5032fc0224a4d6af59c89707f6e6932ded8a4d2'
            'cbcd9c2804135080db7d938ea839b985e41583e1849522fe5379b5b92b22c96a')

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

	# Generar las completions ACÁ, a archivos, para poder detectar un
	# fallo del binario: `install -Dm644 <(cmd) dest` en package() NO
	# propaga el código de salida de cmd — install devuelve 0 igual
	# aunque cmd muera, dejando un dest de 0 bytes sin que makepkg se
	# entere (probado en una terminal real). Con la redirección simple de
	# acá, un `go build` corrupto o un panic de `maly completions` sí
	# aborta el build (verificado: makepkg corta build() ante cualquier
	# comando que falle, salvo dentro de una sustitución de proceso).
	./build/maly completions bash > build/maly.bash
	./build/maly completions fish > build/maly.fish
	./build/maly completions zsh > build/maly.zsh
}

check() {
	cd "$_pkgsrc-$pkgver"
	# Mismo CGO_ENABLED que build(): sin esto, check() testea con el
	# CGO_ENABLED ambiente (típicamente 1, si hay gcc — base-devel lo
	# trae siempre), un build distinto del que package() empaqueta.
	export CGO_ENABLED=0
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

	install -Dm644 build/maly.bash "$pkgdir/usr/share/bash-completion/completions/maly"
	install -Dm644 build/maly.fish "$pkgdir/usr/share/fish/vendor_completions.d/maly.fish"
	install -Dm644 build/maly.zsh "$pkgdir/usr/share/zsh/site-functions/_maly"
}
