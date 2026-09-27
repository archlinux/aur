# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>
#
# Idea from http://www.andrews-corner.org/qaac.html
# Use at your own risk. Please read the COPYING and
# Apple Software License Agreement for iTunes for Windows
# carefully before use. Do NOT use if you disagree with them.

pkgname=qaac-wine
_pkgname=qaac
pkgver=2.88
pkgrel=2
_flacver=1.5.0
pkgdesc="QuickTime AAC/ALAC encoder (wine version)"
arch=('x86_64')
url="https://github.com/nu774/qaac"
license=('LicenseRef-qaac' 'LicenseRef-Apple-iTunes-for-Windows' 'BSD-3-Clause')
depends=('wine')
makedepends=('p7zip' 'wine')
checkdepends=('ffmpeg')
source=("https://github.com/nu774/qaac/releases/download/v${pkgver}/qaac_${pkgver}.zip"
        "iTunes64Setup.exe::https://www.apple.com/itunes/download/win64"
        "https://raw.githubusercontent.com/nu774/qaac/master/COPYING"
        "https://www.apple.com/legal/sla/docs/iTunesWindows.pdf"
        "https://github.com/xiph/flac/releases/download/${_flacver}/flac-${_flacver}-win.zip"
        "wrapper.sh")
sha256sums=('1260ab096425f2c49042562c7ce1735435e681db60f14497df81e7b6d88fa118'
            'SKIP'
            'SKIP'
            'SKIP'
            '53f1500f0d6e7c61379d7fee50d4a9f7f504c650009506d9ba015530d76c0dde'
            '6591c998319680a4474ee93ffc3a50c9be143e53f2e636d8fe66538cde6aa1e3')

extract_filename() {
    if [ "$(head -c 2 "$1" | tr -d '\0')" == "MZ" ]; then
        LC_ALL=C objdump -p "$f" 2>/dev/null | grep 'The Export Tables' -A 10 | awk '$1 == "Name" { print $3 }'
    fi
}

build() {
    cd "${srcdir}"
    7z x -y iTunes64Setup.exe
    7z x -y iTunes64.msi
    for f in fil*; do
        filename=$(extract_filename "$f")
        if [ ! -z "$filename" ]; then
            echo "$filename"
            mv "$f" "$filename"
        fi
    done
}

check() (
    set -e -o pipefail
    export WINEDEBUG=-all WINEPATH="$srcdir" WINEPREFIX="$srcdir/wineprefix"
    local bin="$srcdir/qaac_$pkgver/x64" work exe spec bits channels input
    local codec profile rate count actual_channels
    local -a ff=(ffmpeg -v error -xerror -nostdin -y)
    install -m644 "$srcdir/flac-$_flacver-win/Win64/libFLAC.dll" "$bin/"
    work=$(mktemp -d "$srcdir/flac-check.XXXXXX")
    trap 'rm -rf -- "$work"' EXIT
    cd "$work"

    # Compare WAV format and every PCM byte, ignoring container metadata.
    pcm() {
        ffprobe -v error -select_streams a:0 -of csv=p=0 \
            -show_entries stream=sample_rate,channels,bits_per_sample,duration_ts "$1"
        "${ff[@]}" -i "$1" -c:a "pcm_s${bits}le" -f "s${bits}le" -
    }

    for exe in qaac64 refalac64; do
        timeout 120 wine "$bin/$exe.exe" --check > "$exe.log" 2>&1
        cat "$exe.log"
        grep -q 'libFLAC ' "$exe.log"
    done
    for spec in '16 1' '24 2'; do
        read -r bits channels <<< "$spec"
        mkdir "$bits"
        cd "$bits"
        "${ff[@]}" -f lavfi -i 'aevalsrc=0.5*sin(2*PI*440*t)|0.5*sin(2*PI*660*t):s=44100:d=1' \
            -ac "$channels" -c:a "pcm_s${bits}le" input.wav
        "${ff[@]}" -i input.wav -c:a flac input.flac
        pcm input.wav > expected.pcm
        for exe in qaac64 refalac64; do
            timeout 120 wine "$bin/$exe.exe" -s -A -o "$exe.m4a" input.flac
            for input in input.flac "$exe.m4a"; do
                timeout 120 wine "$bin/$exe.exe" -s -D -b "$bits" -o "$exe-${input##*.}.wav" "$input"
                pcm "$exe-${input##*.}.wav" > actual.pcm
                cmp expected.pcm actual.pcm
            done
            echo "PASS $exe: FLAC decode and ALAC round trip ($bits-bit, $channels channels)"
        done
        timeout 120 wine "$bin/qaac64.exe" -s -V 91 --adts -o output.aac input.flac
        "${ff[@]}" -i output.aac -f null -
        ffprobe -v error -count_frames -select_streams a:0 -of csv=p=0 \
            -show_entries stream=codec_name,profile,sample_rate,channels,nb_read_frames output.aac > aac.info
        IFS=, read -r codec profile rate actual_channels count < aac.info
        [[ "$codec,$profile,$rate,$actual_channels" == "aac,LC,44100,$channels" && "$count" -ge 43 ]]
        echo "PASS qaac: FLAC to AAC-LC ($bits-bit, $channels channels)"
        cd ..
    done
)

package() {
    mkdir -p "${pkgdir}/usr/lib/qaac"

    cd "${srcdir}"
    for f in qaac64.exe refalac64.exe; do
        install -Dm755 "qaac_${pkgver}/x64/${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    for f in libsoxconvolver64.dll libsoxr64.dll; do
        install -Dm644 "qaac_${pkgver}/x64/${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    install -Dm644 "flac-${_flacver}-win/Win64/libFLAC.dll" \
        "${pkgdir}/usr/lib/qaac/libFLAC.dll"
    local LIBICUDT_NAME=$(find . -name 'icudt*.dll' -printf '%f')
    for f in ASL.dll CoreAudioToolbox.dll CoreFoundation.dll $LIBICUDT_NAME libdispatch.dll libicuin.dll libicuuc.dll objc.dll; do
        install -Dm644 "${f}" "${pkgdir}/usr/lib/qaac/${f}"
    done
    install -Dm755 wrapper.sh "${pkgdir}/usr/lib/qaac/wrapper.sh"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/qaac"
    ln -s ../lib/qaac/wrapper.sh "${pkgdir}/usr/bin/refalac"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "flac-${_flacver}-win/COPYING.Xiph" \
        "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.FLAC"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "iTunesWindows.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/iTunesWindows.pdf"
}
