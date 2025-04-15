# Maintainer: Magi3r <magier dot mit dot f3erball at gmail dot com>
pkgname=nyarchassistant
_pkgname=NyarchAssistant
pkgver=0.9.0
pkgrel=1
pkgdesc="Nyarch Linux Assistant (Newelle Fork)"
arch=("any")
url="https://github.com/NyarchLinux/NyarchAssistant"
license=('GPL')
depends=(
	"git"
	"vte4"
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
	"python-pylatexenc"
)

optdepends=(
	"python-ollama: Ollama support"
	"ollama: Ollama auto serve"
	"python-google-generativeai: Google Gemini support"
)

makedepends=("meson")
conflicts=("newelle")

smart_prompts_ver="0.3"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/NyarchLinux/NyarchAssistant/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-dataset.csv::https://github.com/NyarchLinux/Smart-Prompts/releases/download/$smart_prompts_ver/dataset.csv"
	"$pkgname-$pkgver-NyaMedium_0.3_256.pkl::https://github.com/NyarchLinux/Smart-Prompts/releases/download/$smart_prompts_ver/NyaMedium_0.3_256.pkl"
	"$pkgname-$pkgver-l2_supercat_tokenizer_config.json::https://huggingface.co/dleemiller/word-llama-l2-supercat/resolve/main/l2_supercat_tokenizer_config.json"
	"$pkgname-$pkgver-live2d-lipsync-viewer.tar.xz::https://github.com/NyarchLinux/live2d-lipsync-viewer/releases/download/0.4/pack.tar.xz"
	"$pkgname-$pkgver-arch-chan.png::https://avatars.githubusercontent.com/u/95960775?v=4"
)
sha256sums=('663af403726b52e772ccbeeebe05656008c9ed35c0bb812c97ddfdbcd94a6906'
            '7c40ecee34ea02e4dcad2c479e5036cf417366752f85902cb76360f3303341f0'
            '79c9d3526f84143ddc9d6f7033a5f3e403c4c92937a3aa4bcaca1db5393b75ee'
            'bf467c9e0f536bda271283c6ef85eb1a943e3196b621c8a912d64953b205df83'
            '380910cde93ea659cab090e5f5febc8c4c9fffc0e39b7294bd3505646a2dc7cc'
            '86a403388436d421fd255c451ddf79a47b2f723a70407da81b7676962e08f1e1')
# prepare() {
#   	cd "$_pkgname-$pkgver"
# 	patch -p1 <"$srcdir/$pkgname-$pkgver.patch"
# }


build() {
  	cd "$_pkgname-$pkgver"
	meson setup --prefix=/usr _builddir
	meson compile -C _builddir
}

check() {
	cd "$_pkgname-$pkgver"
	# meson test -C _builddir
}

package() {
	local _datadir="$pkgdir/usr/share/nyarchassistant"
	mkdir -p "$_datadir/data/smart-prompts"
	mv "$pkgname-$pkgver-dataset.csv" "$_datadir/dataset.csv"
	mv "$pkgname-$pkgver-NyaMedium_0.3_256.pkl" "$_datadir/data/smart-prompts/NyaMedium_0.3_256.pkl"
	mv "$pkgname-$pkgver-l2_supercat_tokenizer_config.json" "$_datadir/data/smart-prompts/l2_supercat_tokenizer_config.json"
	mkdir -p "$_datadir/data/live2d/web"
	bsdtar -xJf "$pkgname-$pkgver-live2d-lipsync-viewer.tar.xz" -C "$_datadir/data/live2d/web" --no-same-owner
	mv "$pkgname-$pkgver-arch-chan.png" "$_datadir/data/live2d/web/arch-chan.png"

	cd "$_pkgname-$pkgver"
	meson install -C _builddir --destdir="$pkgdir/"
	chmod 755 "$pkgdir/usr/bin/nyarchassistant"
}
