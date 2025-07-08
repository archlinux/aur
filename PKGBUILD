# Maintainer: Hans Peter Buhr <hanspeterbuhr@posteo.net>
pkgname=wiggly-stt
pkgver=1.1.1
pkgrel=2
pkgdesc="Local speech-to-text transcription with whisper.cpp, voice recording, and clipboard integration"
arch=('any')
url="https://github.com/hansp27/wiggly-stt"
license=('MIT')
depends=('ffmpeg' 'wl-clipboard' 'libnotify' 'curl' 'bash')
optdepends=('ydotool: for auto-paste functionality'
            'whisper.cpp: for local AI transcription (whisper-cli and whisper-server)')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hansp27/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8213b5866532ca005bda79a5d20fad57aa01ec0d7c024da0125ed69f33f99c83')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install main executable (rename to remove .sh)
    install -Dm755 wiggly-stt.sh "$pkgdir/usr/bin/wiggly-stt"
    
    # Install support files to /usr/share/wiggly-stt/
    install -Dm755 wiggly-stt-daemon "$pkgdir/usr/share/$pkgname/wiggly-stt-daemon"
    install -Dm644 wiggly-stt-shared "$pkgdir/usr/share/$pkgname/wiggly-stt-shared"
    install -Dm644 wiggly-stt.conf "$pkgdir/usr/share/$pkgname/wiggly-stt.conf"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install man page (if you create one)
    # install -Dm644 wiggly-stt.1 "$pkgdir/usr/share/man/man1/wiggly-stt.1"
    
    # Create desktop entry
    mkdir -p "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Wiggly STT
Comment=Speech-to-text transcription for Linux
Exec=wiggly-stt
Icon=audio-input-microphone
Type=Application
Categories=AudioVideo;Audio;Utility;
Keywords=speech;transcription;voice;audio;
EOF

    # Create bash completion
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    cat > "$pkgdir/usr/share/bash-completion/completions/wiggly-stt" << EOF
_wiggly_stt() {
    local cur prev opts
    COMPREPLY=()
    cur="\${COMP_WORDS[COMP_CWORD]}"
    prev="\${COMP_WORDS[COMP_CWORD-1]}"
    opts="start-record stop-record start-server stop-server status -p --auto-paste -h --help"
    
    COMPREPLY=( \$(compgen -W "\${opts}" -- \${cur}) )
    return 0
}
complete -F _wiggly_stt wiggly-stt
EOF
} 