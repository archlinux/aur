# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=synthos-bin
_pkgname=synthos
# epoch=1: с 20.09 по 23.09.2026 версией был голый номер сборки (268…278), и
# для pacman 278 > 0.2.278 — без epoch переход на 0.2.x считался бы откатом.
epoch=1
pkgver=0.2.281
pkgrel=1
pkgdesc="Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — native synaptix engine on any NVIDIA sm_80+ GPU, .syn and GGUF models (binary release)"
arch=("x86_64")
url="https://github.com/VitaminDB/synthos"
license=("MIT" "Apache-2.0")

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
    "nvidia-utils: GPU-инференс (CUDA-драйвер грузится в рантайме)"
    "cuda: ядра NVRTC компилируются на лету под карту (sm_80+), нужен CUDA-рантайм"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

source=("$_pkgname-$pkgver.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.zst")
sha256sums=('a6ac2dbd9c8a4d5e628070f50825a8d5ca21dffc51a4ed927962279bda4339e3')

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm755 "bin/synthos" "$pkgdir/usr/bin/synthos"
    install -Dm644 "share/applications/synthos.desktop" \
        "$pkgdir/usr/share/applications/synthos.desktop"
    install -Dm644 "share/icons/hicolor/scalable/apps/synthos.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/synthos.svg"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
