# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeg at proton dot me>

pkgname=nyarchassistant-git
pkgver=0.9b.r37.g423f051
pkgrel=1
pkgdesc="Nyarch Linux Assistant (NyarchAssistant Fork)"
arch=("any")
url="https://github.com/NyarchLinux/NyarchAssistant"
license=('GPL')
depends=(
	"vte4"
	"python-requests"
	"python-pillow"
	"python-requests-toolbelt"
	"python-curl-cffi"
	"python-gpt4all"
	"python-gtts"
	"python-expandvars"
	"python-pyaudio"
	"python-speechrecognition"
	"python-openai"
	"python-voicevox-client"
	"python-livepng"
	"python-wordllama"
	"python-edge-tts"
	"python-scikit-learn"
	"python-pygame"
	"python-pylatexenc"
)

optdepends=(
	"python-ollama: Ollama support"
	"ollama: Ollama auto serve"
	"python-google-generativeai: Google Gemini support"
)

makedepends=("git" "meson")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd NyarchAssistant || return
	_tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
	_rev=$(git rev-list --count "$_tag"..HEAD)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
	if [ -d build ]; then
		rm -rf build
	fi
	arch-meson NyarchAssistant build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || :
}

package() {
	meson install -C build --destdir "$pkgdir"
	chmod +x "$pkgdir/usr/bin/nyarchassistant"
	cd NyarchAssistant || return
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
