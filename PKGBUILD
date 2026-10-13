# Maintainer: Tobias Boesch <tobias.boesch@googlemail.com>
pkgbase=d-lan
pkgname=(d-lan-core
    d-lan-gui)
pkgver=1.6.1
pkgrel=1
license=GPL-3.0-or-later
arch=('x86_64')
url="https://www.d-lan.net/"
license=('GPL-3.0-or-later')
makedepends=(
    protobuf
    libblake3
    git
    cmake
    ninja
    qt6-base
    qt6-svg
)
options=(strip)
source=("git+https://github.com/Ummon/D-LAN.git#commit=87bee618b12e85b2dcb537994f8aa97865c90e0d")
sha256sums=('12e9d1d3e42b10fd2ad9706592edaa7cf447b45a66d4c0c27423bc46d4ce2866')
_appdir=${pkgbase^^}/application
_instpath=/opt/$pkgbase
prepare() {
    cd "$_appdir"
    cmake -G Ninja -S . -B build
}
build() {
    cd "$_appdir"
    cmake --build build --config Release
}
package_d-lan-core() {
    _binnamecore="D-LAN.Core"
    pkgdesc="A free LAN file sharing software (headless core)"
    optdepends=(
        'd-lan-gui: Graphical user interface'
    )
    depends=(libstdc++
        openssl
        abseil-cpp
        protobuf
        libblake3
        libgcc
        qt6-base
    )
    install -vD "$_appdir/build/output/D-LAN.Core" "$pkgdir$_instpath/D-LAN.Core"
    mkdir --parents "$pkgdir/usr/bin/"
    ln -s $_instpath/D-LAN.Core "$pkgdir/usr/bin/$pkgname"
}
package_d-lan-gui() {
    _binnamegui="D-LAN.GUI"
    pkgdesc="A free LAN file sharing software (GUI)"
    depends=(d-lan-core
        openssl
        libgcc
        abseil-cpp
        libstdc++
        protobuf
        libblake3
        libglvnd
        qt6-svg
        hicolor-icon-theme
        qt6-base
        desktop-file-utils
    )
    install -vD "$_appdir/build/output/$_binnamegui" "$pkgdir$_instpath/$_binnamegui"
    mkdir --parents "$pkgdir/usr/bin/"
    ln -s $_instpath/$_binnamegui "$pkgdir/usr/bin/$pkgname"
    cp --recursive "$_appdir/GUI/resources/emoticons" "$pkgdir$_instpath/emoticons"
    desktop-file-install --set-key=Path --set-value=$_instpath \
        --set-key=Exec --set-value=$_binnamegui \
        --dir="$pkgdir/usr/share/applications" \
        "$_appdir/Setups/Ubuntu/$pkgbase.desktop"
    install -vD "$_appdir/GUI/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgbase.svg"
    cp --recursive "$_appdir/styles" "$pkgdir/opt/$pkgbase/styles"
}
