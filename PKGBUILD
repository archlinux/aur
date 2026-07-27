# Maintainer: spiriwind <spirwind at gmail dot com>
pkgname=speech-dispatcher-mimo-git
pkgrel=1
pkgdesc="speech-dispatcher output module that uses Xiaomi MiMo API for high-quality Chinese/English neural TTS (git version)"
arch=('any')
url="https://platform.xiaomimimo.com"
license=('MIT')
install=speech-dispatcher-mimo.install
depends=(
    'python'
    'python-redis'
    'sox'
    'speech-dispatcher'
)
makedepends=(
    'git'
)
optdepends=(
    'valkey: for TTS response caching'
)
source=("git+https://github.com/spiriwind/speech-dispatcher-mimo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Native module (bypasses sd_generic for proper UTF-8 support)
    install -Dm755 sd_mimo.py "$pkgdir/usr/lib/speech-dispatcher/speech-dispatcher-modules/sd_mimo"

    # Module config
    install -Dm644 mimo.conf "$pkgdir/etc/speech-dispatcher/modules/mimo.conf"

    # API key config (template, user fills in)
    install -Dm644 mimo-tts.env "$pkgdir/etc/speech-dispatcher/mimo-tts.env"

    # Voice switcher script
    install -Dm755 mimo-voice "$pkgdir/usr/bin/mimo-voice"

    # Bash completion
    install -Dm644 mimo-voice.bash "$pkgdir/usr/share/bash-completion/completions/mimo-voice"

    # Fish completion
    install -Dm644 mimo-voice.fish "$pkgdir/usr/share/fish/vendor_completions.d/mimo-voice.fish"

    # Man pages
    install -Dm644 mimo-voice.1 "$pkgdir/usr/share/man/man1/mimo-voice.1"
    install -Dm644 mimo-voice.zh_CN.1 "$pkgdir/usr/share/man/zh_CN/man1/mimo-voice.1"
}
