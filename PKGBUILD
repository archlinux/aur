# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeg at proton dot me>

pkgname=nyarchassistant
pkgver=1.2.0.r1.ge6a4854
pkgrel=1
pkgdesc="Nyarch Assistant (Newelle Fork)"
arch=("any")
url="https://github.com/NyarchLinux/NyarchAssistant"
license=('GPL')
depends=(
  "python-edge-tts"
  "python-requests"
  "python-expandvars"
  "python-beautifulsoup4"
  "python-gobject"
	"python-livepng"
	"python-lxml-html-clean"
  "python-lxml"
  "python-hatch-fancy-pypi-readme"
  "python-hatchling"
	"python-newspaper"
	"python-openai"
	"python-pillow"
	"python-pyaudio"
	"python-pylatexenc"
  "python-tiktoken"
  "python-matplotlib"
  "python-markdownify"
  "python-mcp"
  "gtksourceview5"
	"vte4"
	"webkitgtk-6.0"
)

optdepends=(
	"python-ollama: Ollama support"
	"ollama: Ollama auto serve"
	"python-google-generativeai: Google Gemini support"
  "python-speechrecognition: Speech recognition support"
  "python-gtts: Google TTS"
)

makedepends=("git" "meson")
source=(
	"git+$url"
)
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
