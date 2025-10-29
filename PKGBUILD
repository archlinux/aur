# Maintainer: w568w <w568w at outlook dot com>

_reponame=DatasetEditor
pkgname=dataset-editor
pkgver=0.2.0
pkgrel=3
pkgdesc='A tag-based dataset editor for image generation AI'
arch=(x86_64)
url="https://github.com/Jelosus2/$_reponame"
license=(MIT)
_electron=electron34
depends=("$_electron" nodejs)
makedepends=(pnpm asar icoutils)
# This app requires .git to build, so use the git+url syntax instead of a tarball
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
        dataset-editor.desktop)
sha256sums=('fba15e074ff72ae9dc499655a15698f6a51fd897ef59158152562d5c8b6c1505'
            '093e593e92ffe3a44380d3bc7d90baf302ebeb24ab4ec221e79311a22929fcfa')

prepare() {
    cd "$pkgname-$pkgver"
    pnpm install
}

build() {
    cd "$pkgname-$pkgver"
    local i686=ia32 x86_64=x64
    export NODE_ENV=production
    export NODE_OPTIONS='--openssl-legacy-provider'
    pnpm build
    pnpm exec electron-builder --linux --"${!CARCH}" --dir \
         -c.electronDist=/usr/lib/"$_electron" \
         -c.electronVersion="$(</usr/lib/${_electron}/version)"
    icotool --extract --output=public "public/doro.ico"
}

package() {
    local i686=linux-ia32-unpacked x86_64=linux-unpacked aarch64=linux-arm64-unpacked
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
    install -Dm755 /dev/null "${pkgdir}/usr/bin/$pkgname"
    cat >>"${pkgdir}/usr/bin/$pkgname" <<EOD
#! /usr/bin/sh
export PROGRAMDATA="\$HOME/.local/share/$pkgname"
exec $_electron /usr/lib/$pkgname "\$@"
EOD
    cd "$pkgname-$pkgver"
    local -A icon_map=([256]=1 [128]=2 [64]=3 [48]=4 [32]=5 [16]=6)
    for r in 16 32 48 64 128 256; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${r}x${r}/apps/"
        install -m644 "public/doro_${icon_map[$r]}_${r}x${r}x32.png" "${pkgdir}/usr/share/icons/hicolor/${r}x${r}/apps/${pkgname}.png"
        rm --force "public/doro_${icon_map[$r]}_${r}x${r}x32.png"
    done
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -d "$pkgdir/usr/lib/$pkgname/"
    asar e "dist_electron/linux/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname/"
}
