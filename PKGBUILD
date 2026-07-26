# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=sigil-wad
pkgver=1.23
pkgrel=8

url="https://romero.com/sigil"
pkgdesc="SIGIL, the unofficial 5th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD"
license=('LicenseRef-SIGIL')

arch=('any')
depends=('hicolor-icon-theme')
# The upstream logo is only served from a CDN that content-negotiates: the same
# URL returns PNG to clients sending Accept: image/png and a transcoded WebP to
# clients sending Accept: */*, which is what makepkg's downloader sends.  No
# query parameter overrides it, so a checksum on that URL cannot hold across
# builders.  The icons are therefore generated from it once and tracked here.
# Refresh: curl -H 'Accept: image/png' on the logo URL, then for each size
# magick <master> -filter Lanczos -resize NxN -background none -gravity center
# -extent NxN -strip sigil-N.png
# https://images.squarespace-cdn.com/content/v1/5fef3318f8ce9b562500206e/1609621243192-JXVMK6DO7545JVZIRLM3/logo-sigil.png
source=("https://romero.com/s/SIGIL_V1_23-8fh4.zip"
        "sigil-48.png"
        "sigil-64.png"
        "sigil-128.png"
        "sigil-256.png"
        "sigil-512.png"
        "sigil.desktop"
        "sigil_compat.desktop")

sha256sums=('57c35a6bcd722433fc97344314e52c06c91fdfde33b18c6d1c14a4d29e229105'
            'c1d23ace2981411dda9304f335ffcc7c8e5fdf6815914398dbde660b692c7546'
            '4450bc7dcf7d2626956acae9265226ede57ea1621f0d895e7372a582cd9894f4'
            '184c33366b78041a66d371c73242b00ee99ab062f855e98ae6d0ad44e4052d58'
            '29c02133afccc67c4c226ae6284c35156ed41e6eb1e4193478411693686fc8bf'
            '7d3ab91e662a6980d10798262be472ee9caf09165adb86d62ab163425862cd98'
            '37ea66ee77f07b64ec8646ee6ca761be6c1d63719ec3e7106abc902c97391abd'
            '7d5c26f36b43a90abf76d22da762303aff166bd85d5e3d141dcaa09bbc348523')

latestver() {
    curl -fsSL "$url" |
        sed -nE 's#.*[Ff]ree SIGIL v([0-9]+)\.([0-9]+) Megawad.*#\1.\2#p' | head -1
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/share/doom"

    install -Dm644 "SIGIL_README_V1_23.txt" "$pkgdir/usr/share/doc/$pkgname/instructions.txt"
    install -Dm644 "SIGIL_V1_23.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "SIGIL_V1_23.wad" "$pkgdir/usr/share/games/sigil/sigil.wad"
    install -Dm644 "SIGIL_COMPAT_V1_23.wad" "$pkgdir/usr/share/games/sigil/sigil_compat.wad"
    ln -s /usr/share/games/sigil/sigil.wad "$pkgdir/usr/share/doom/sigil.wad"
    ln -s /usr/share/games/sigil/sigil_compat.wad "$pkgdir/usr/share/doom/sigil_compat.wad"

    local _size
    for _size in 48 64 128 256 512; do
        install -Dm644 "sigil-${_size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/sigil.png"
    done

    install -Dm644 "sigil.desktop" "$pkgdir/usr/share/applications/sigil.desktop"
    install -Dm644 "sigil_compat.desktop" "$pkgdir/usr/share/applications/sigil_compat.desktop"
}
