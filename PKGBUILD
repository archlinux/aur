# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeg at proton dot me>

pkgname=newelle-git
pkgver=0.9.0.r20.g92d1411
pkgrel=1
pkgdesc="Your Ultimate Virtual Assistant"
url="https://github.com/qwersyk/Newelle"
license=('GPL-3.0-or-later')
arch=('any')
depends=('gtksourceview5' 'libadwaita' 'portaudio' 'python-expandvars' 'python-gobject' 'python-gpt4all' 'python-gtts' 'python-matplotlib' 'python-numpy' 'python-pillow' 'python-pyaudio' 'python-pygame' 'python-pylatexenc' 'python-requests' 'python-speechrecognition' 'vte4')
makedepends=('git' 'meson')
optdepends=(
	"python-ollama: Ollama support"
	"ollama: Ollama auto serve"
	"python-google-generativeai: Google Gemini support"
)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd Newelle || return
	_tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
	_rev=$(git rev-list --count "$_tag"..HEAD)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
	arch-meson Newelle build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || :
}

package() {
	meson install -C build --destdir "$pkgdir"
	chmod +x "$pkgdir/usr/bin/$pkgname"
	cd Newelle || return
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
