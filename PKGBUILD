# Maintainer: IRRatium <https://github.com/IRRatium>
pkgname=badapple
pkgver=1.0.0
pkgrel=3
pkgdesc="Bad Apple!! ASCII art player for the terminal"
arch=('any')
url="https://github.com/IRRatium/badapple-aur"
license=('MIT')

# Runtime: only playback deps
depends=('bash' 'mpv' 'python')

# Build-time: everything needed to process the video
makedepends=('ffmpeg' 'curl' 'ascii-image-converter')

# Исправлено имя исходников, чтобы соответствовать стандартному названию архива GitHub
source=("badapple-$pkgver.tar.gz::https://github.com/IRRatium/badapple-aur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_VIDEO_URL="https://github.com/trung-kieen/bad-apple-ascii/raw/refs/heads/main/bad_apple.mp4"
_MP3_URL="https://archive.org/download/bad-apple-resources/bad_apple_enhanced.mp3"

build() {
    local work="$srcdir/_badapple_build"
    local frames_jpg="$work/frames-jpg"
    local frames_ascii="$work/frames-ascii"
    local video="$work/bad_apple.mp4"
    local mp3="$work/bad_apple.mp3"
    local jobs
    jobs=$(nproc)

    mkdir -p "$frames_jpg" "$frames_ascii"

    echo "==> [1/4] Downloading video..."
    curl -L --progress-bar "$_VIDEO_URL" -o "$video"

    echo "==> [2/4] Downloading audio..."
    curl -L --progress-bar "$_MP3_URL" -o "$mp3"

    echo "==> [3/4] Extracting frames at 30fps..."
    ffmpeg -i "$video" -vf fps=30 "$frames_jpg/out%04d.jpg" -y 2>/dev/null
    local count
    count=$(ls "$frames_jpg"/*.jpg | wc -l)
    echo "    Extracted $count frames"

    echo "==> [4/4] Converting to ASCII ($jobs parallel jobs)..."
    export frames_ascii
    convert_one() {
        local jpg="$1"
        local name txt
        name=$(basename "$jpg")
        txt="${frames_ascii}/${name}.txt"
        ascii-image-converter "$jpg" -d 96,36 > "$txt" 2>/dev/null
    }
    export -f convert_one
    printf '%s\n' "$frames_jpg"/out*.jpg \
        | xargs -P "$jobs" -I{} bash -c 'convert_one "$@"' _ {}

    echo "    Conversion done"

    rm -f "$video"
    rm -rf "$frames_jpg"
}

package() {
    # Исправлен путь к распакованному репозиторию GitHub
    cd "$srcdir/badapple-aur-$pkgver"
    local work="$srcdir/_badapple_build"

    install -Dm755 badapple "$pkgdir/usr/bin/badapple"

    install -Dm644 "$work/bad_apple.mp3" \
        "$pkgdir/usr/share/badapple/bad_apple.mp3"

    local total
    total=$(ls "$work/frames-ascii"/*.txt 2>/dev/null | wc -l)
    echo "==> Installing $total ASCII frames..."
    install -dm755 "$pkgdir/usr/share/badapple/frames-ascii"
    cp "$work/frames-ascii"/*.txt "$pkgdir/usr/share/badapple/frames-ascii/"
}