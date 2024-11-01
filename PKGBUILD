# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=nyarchassistant
_pkgname=NyarchAssistant
pkgver=0.4.4
pkgrel=1
pkgdesc="Nyarch Linux Assistant (Newelle Fork)"
arch=("any")
url="https://github.com/NyarchLinux/NyarchAssistant"
license=('GPL')
depends=(
	"git"
	"gnome-shell"
	"python"
	"python-requests"
	"python-requests-toolbelt"
	"python-gtts"
	"python-expandvars"
	"python-pyaudio"
	"python-openai"
	"python-scikit-learn"
	"python-pygame"
	"python-g4f"
	"python-curl-cffi"
	"python-gpt4all"
	"python-speechrecognition"
	"python-edge-tts"
	"python-voicevox-client"
	"python-livepng"
	"python-wordllama"
	"python-pillow"
)
optdepends=(
	"python-ollama: Ollama support"
	"python-google-generativeai: Google Gemini support"
)

makedepends=("meson")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/NyarchLinux/NyarchAssistant/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-dataset.csv::https://github.com/NyarchLinux/Smart-Prompts/releases/download/0.3/dataset.csv"
	"$pkgname-$pkgver-NyaMedium_0.3_256.pkl::https://github.com/NyarchLinux/Smart-Prompts/releases/download/0.3/NyaMedium_0.3_256.pkl"
	"$pkgname-$pkgver-l2_supercat_tokenizer_config.json::https://huggingface.co/dleemiller/word-llama-l2-supercat/resolve/main/l2_supercat_tokenizer_config.json"
)
sha256sums=(
	'8fd563c0ece3debfad29f2c6f958df4f3c32bad84edb5a18d750c2cb78d8662e'
	'7c40ecee34ea02e4dcad2c479e5036cf417366752f85902cb76360f3303341f0'
	'79c9d3526f84143ddc9d6f7033a5f3e403c4c92937a3aa4bcaca1db5393b75ee'
	'bf467c9e0f536bda271283c6ef85eb1a943e3196b621c8a912d64953b205df83'
)


build() {
  	cd "$_pkgname-$pkgver"
	meson setup --prefix=/usr _builddir
	meson compile -C _builddir
}

check() {
	cd "$_pkgname-$pkgver"
	meson test -C _builddir
}

package() {
	local _datadir="$pkgdir/usr/share/nyarchassistant/"
	mkdir -p "$_datadir/data/smart-prompts"
	mv "$pkgname-$pkgver-dataset.csv" "$_datadir/dataset.csv"
	mv "$pkgname-$pkgver-NyaMedium_0.3_256.pkl" "$_datadir/data/smart-prompts/NyaMedium_0.3_256.pkl"
	mv "$pkgname-$pkgver-l2_supercat_tokenizer_config.json" "$_datadir/data/smart-prompts/l2_supercat_tokenizer_config.json"
	
	cd "$_pkgname-$pkgver"
	meson install -C _builddir --destdir="$pkgdir/"
	chmod 755 "$pkgdir/usr/bin/nyarchassistant"
}
