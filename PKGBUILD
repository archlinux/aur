# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=sigil2-wad
pkgver=1.0
pkgrel=10

url="https://romero.com/sigil"
pkgdesc="SIGIL II, the unofficial 6th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD"
license=('LicenseRef-SIGIL-II')

arch=('any')
depends=('hicolor-icon-theme')
# The upstream logo is only served from a CDN that content-negotiates: the same
# URL returns PNG to clients sending Accept: image/png and a transcoded WebP to
# clients sending Accept: */*, which is what makepkg's downloader sends.  No
# query parameter overrides it, so a checksum on that URL cannot hold across
# builders.  The icons are therefore generated from it once and tracked here.
# Refresh: curl -H 'Accept: image/png' on the logo URL, then for each size
# magick <master> -filter Lanczos -resize NxN -background none -gravity center
# -extent NxN -strip sigil2-N.png
# https://images.squarespace-cdn.com/content/v1/5fef3318f8ce9b562500206e/c05bd3cb-30a4-4d20-8dd9-8411a22d8be8/Romero_Logo_Sigil2+red+metal+hi-res.png
source=("https://romero.com/s/SIGIL_II_V1_0.zip"
        "sigil2-48.png"
        "sigil2-64.png"
        "sigil2-128.png"
        "sigil2-256.png"
        "sigil2-512.png"
        "sigil2.desktop")

sha256sums=('41741ce797e6faf9ebd0e3d577b5eaf9a648b64d850fbd741c1b9c28d8461017'
            '7317c2d6b1f8c4bda1358d44a594220bf2cd73b93912aeb5018a80823366dda0'
            'a6e1bb455c2f5414008b0409c32fb44873f7f082eb2a9de215799109378d4a3a'
            '446f65f35a44b2bf83a7defac966c22cf5395d7db7546e06caae73c0f9fd8e4f'
            '9051cc477cde678b96de693d3847b8662ff0de9631d8ee6fe4c344f95ba05212'
            'cb03f859fbe795eeed8d5b69f85c11f341e454d7392eccce761b422ee8bdfa5c'
            '35a3a026b4c2e6d55797b6d0f5b4d44ded6f4b27a3f3b94be3560a716a5d5231')

latestver() {
    curl -fsSL "$url" |
        sed -nE 's#.*[Ff]ree SIGIL II v([0-9]+)\.([0-9]+) Megawad.*#\1.\2#p' | head -1
}

package() {
    cd "$srcdir"
    
    install -d "$pkgdir/usr/share/doom"
    
    install -Dm644 "SIGIL_II_README_V1_0.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "SIGIL_II_V1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "SIGIL_II_V1_0.WAD" "$pkgdir/usr/share/games/sigil2/sigil2.wad"
    ln -s /usr/share/games/sigil2/sigil2.wad "$pkgdir/usr/share/doom/sigil2.wad"

    local _size
    for _size in 48 64 128 256 512; do
        install -Dm644 "sigil2-${_size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/sigil2.png"
    done

    install -Dm644 "sigil2.desktop" "$pkgdir/usr/share/applications/sigil2.desktop"
}
