# Maintainer: wingsummer <wing-summer@qq.com>

pkgname=winggifeditor2
pkgver=1.1.1
pkgrel=1
pkgdesc='一个轻量的 Gif 编辑器 / A lightweight Gif Editor'
url="https://github.com/Wing-summer/WingGifEditor2"

arch=(x86_64 aarch64)
license=(AGPL-3.0-only)

depends=('qt6-base')
makedepends=('git' 'cmake' 'gcc' 'clang' 'qt6-tools' 'qt6-translations')
optdepends=('qt6-translations: translations')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/WingGifEditor2"
    sed -i 's|git@github.com:|https://github.com/|g' .gitmodules
    git submodule sync
    git submodule update --init
    git submodule foreach --recursive "
        if [ -f .gitmodules ]; then
            sed -i 's|git@github.com:|https://github.com/|g' .gitmodules
            git submodule sync
        fi
    "
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/WingGifEditor2"
    local _flags=(
        -D CMAKE_BUILD_TYPE=Release
        -D WINGGIF_USE_FRAMELESS=ON
        -D WINGGIF_OPTIMIZE_FOR_NATIVE=ON
    )
    cmake -S . -B build "${_flags[@]}"
    cmake --build build -- -j"$(nproc)"
}

check() {
    true
}

package() {
    cd "$srcdir/WingGifEditor2"
    local _optdir="$pkgdir/opt/WingGifEditor2"
    local _mkinst="mkinstaller/pyscript"

    mkdir -p "$_optdir"
    install -Dm755 build/WingGifEditor2 "$_optdir/WingGifEditor2"

    cp -a "build/lang" "$_optdir/"

    for _f in LICENSE authorband.svg licenseband.svg screenshot.png README.md images/author.jpg; do
        install -Dm644 "$srcdir/WingGifEditor2/${_f}" "$_optdir/${_f##*/}"
    done

    local md5=$(md5sum "$_optdir/WingGifEditor2" | cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
    echo "$md5" > "$_optdir/md5sums"

    install -Dm644 "$_mkinst/com.wingsummer.winggifeditor2.desktop" "$pkgdir/usr/share/applications/com.wingsummer.winggifeditor2.desktop"
}
