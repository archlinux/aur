# Maintainer: wingsummer <wing-summer@qq.com>

pkgname=winghexexplorer2-git
pkgver=2.3.2.r0.g86740fe
pkgrel=1
pkgdesc='一个自由强大跨平台的十六进制编辑器（每日构建版） / A free, powerful, cross-platform hex editor (Nightly Builds)'
url="https://github.com/Wing-summer/WingHexExplorer2"

arch=(x86_64 aarch64)
license=(AGPL-3.0-only)
conflicts=(winghexexplorer2)

depends=('qt6-base')
makedepends=('git' 'cmake' 'gcc' 'clang' 'qt6-tools' 'qt6-translations' 'nodejs')
optdepends=('qt6-translations: translations')
source=("git+$url.git#branch=main")
sha256sums=('SKIP')
options=('!strip')

install=winghexexplorer2.install

pkgver() {
    cd "$srcdir/WingHexExplorer2"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/WingHexExplorer2"
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
    cd "$srcdir/WingHexExplorer2"
    local _flags=(
        -D CMAKE_INSTALL_PREFIX=/opt
        -D CMAKE_BUILD_TYPE=Release
        -D WINGHEX_USE_FRAMELESS=ON
        -D WINGHEX_BUILD_TEST_PLUGIN=OFF
        -D WINGHEX_BUILD_SHARED_MEM_EXT=OFF
        -D WINGHEX_ANGEL_LSP=ON
    )
    cmake -S . -B build "${_flags[@]}"
    cmake --build build -- -j"$(nproc)"
}

check() {
    true
}

package() {
    cd "$srcdir/WingHexExplorer2"
    local _optdir="$pkgdir/opt/WingHexExplorer2"
    local _mkinst="mkinstaller/pyscript"

    mkdir -p "$_optdir"
    install -Dm755 build/WingHexExplorer2 "$_optdir/WingHexExplorer2"
    install -Dm644 build/WingPlugin/libWingPlugin.so "$_optdir/libWingPlugin.so"

    for _sub in plugin scripts aslib; do
        mkdir -p "$_optdir/$_sub"
    done

    cp -a "$_mkinst/share" "build/lang" "build/lsp" "$_optdir/"
    install -Dm644 mkinstaller/config.ini "$_optdir/config.ini"

    for _f in LICENSE authorband.svg licenseband.svg screenshot.png README.md images/author.jpg; do
        install -Dm644 "$srcdir/WingHexExplorer2/${_f}" "$_optdir/${_f##*/}"
    done

    local md5=$(md5sum "$_optdir/WingHexExplorer2" | cut -d' ' -f1 | tr '[:lower:]' '[:upper:]')
    echo "$md5" > "$_optdir/md5sums"

    install -Dm644 "$_mkinst/com.wingsummer.winghexexplorer2.desktop" "$pkgdir/usr/share/applications/com.wingsummer.winghexexplorer2.desktop"
}
