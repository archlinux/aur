# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=nyarchassistant
_pkgname=NyarchAssistant
pkgver=0.5.0
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
)
optdepends=(
	"python-ollama: Ollama support"
	"python-google-generativeai: Google Gemini support"
)

makedepends=("meson")

smart_prompts_ver="0.3"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/NyarchLinux/NyarchAssistant/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-dataset.csv::https://github.com/NyarchLinux/Smart-Prompts/releases/download/$smart_prompts_ver/dataset.csv"
	"$pkgname-$pkgver-NyaMedium_0.3_256.pkl::https://github.com/NyarchLinux/Smart-Prompts/releases/download/$smart_prompts_ver/NyaMedium_0.3_256.pkl"
	"$pkgname-$pkgver-l2_supercat_tokenizer_config.json::https://huggingface.co/dleemiller/word-llama-l2-supercat/resolve/main/l2_supercat_tokenizer_config.json"
	# This patch is nessecary for v0.5.0 only, as the fixes are not released yet
	"$pkgname-$pkgver.patch::https://github.com/NyarchLinux/NyarchAssistant/compare/0.5.0..fffe37d8c612d4f780ababf41b808b1640893f4a.diff"
)
sha256sums=('7f195df36c39681d3b9e69f39bdafa8af13aa8bd3b552e37c1cf840ccd86569d'
            '7c40ecee34ea02e4dcad2c479e5036cf417366752f85902cb76360f3303341f0'
            '79c9d3526f84143ddc9d6f7033a5f3e403c4c92937a3aa4bcaca1db5393b75ee'
            'bf467c9e0f536bda271283c6ef85eb1a943e3196b621c8a912d64953b205df83'
            '86281470b5996f99c66e3133d7d08fb18b73a34bc1c241c878f7bbf72297b73e')

prepare() {
  	cd "$_pkgname-$pkgver"
	patch -p1 <"$srcdir/$pkgname-$pkgver.patch"
}


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
