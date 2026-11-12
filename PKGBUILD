# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=synthos-bin
_pkgname=synthos
# epoch=1: с 20.09 по 23.09.2026 версией был голый номер сборки (268…278), и
# для pacman 278 > 0.2.278 — без epoch переход на 0.2.x считался бы откатом.
epoch=1
pkgver=0.2.321
pkgrel=1
pkgdesc="Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — native synaptix engine on any NVIDIA sm_80+ GPU, .syn and GGUF models (binary release)"
arch=("x86_64")
url="https://github.com/VitaminDB/synthos"
license=("GPL-3.0-only")

# Рантайм. ffmpeg по soname: мажорный апдейт меняет soname, и pacman обязан
# поймать рассинхрон, а не отдать пользователю падающий бинарь.
depends=(
    "alsa-lib"
    "fontconfig"
    "vulkan-icd-loader"
    "libxkbcommon"
    "wayland"
    "gtk3"
    "libavutil.so=61-64"
    "libavcodec.so=63-64"
    "libavformat.so=63-64"
    "libswscale.so=10-64"
    "libswresample.so=7-64"
)
optdepends=(
    "nvidia-utils: нейросети на видеокарте NVIDIA (драйвер CUDA грузится в рантайме)"
    "cuda: компилятор ядер NVRTC — ядра собираются на лету под карту (sm_80+)"
    "openvino-intel-npu-plugin: нейросети на Intel NPU"
    "intel-npu-driver: драйвер Intel NPU"
    "intel-npu-compiler: компилятор моделей для Intel NPU"
    "synaptix: системная служба synaptixd — synthos подключается к ней и делит загруженные модели с synshell; без неё работает свой встроенный движок"
    "synshell-ai: ассистент synshell — ставит службу synaptix, с которой synthos делит модели"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

source=("$_pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.zst")
sha256sums=('6c8ad3d04c4fe2b8c585dd2e994d4ccadbf65301b65a312aae9eb09cef446f64')

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm755 "bin/synthos" "$pkgdir/usr/bin/synthos"
    install -Dm644 "share/applications/synthos.desktop" \
        "$pkgdir/usr/share/applications/synthos.desktop"
    install -Dm644 "share/icons/hicolor/scalable/apps/synthos.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/synthos.svg"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE LICENSE-COMMERCIAL.md LICENSE-EXCEPTION.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
