# Maintainer: Tobias Boesch <tobias.boesch@googlemail.com>
pkgbase=d-lan
pkgname=(d-lan-core
    d-lan-gui)
pkgver=1.2.2
pkgrel=2
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
source=("git+https://github.com/Ummon/D-LAN.git#commit=c488743bbb05a45285348fc4368bff63362eda42")
sha256sums=('0d0b3d0855c67a8ea9f214256bc494a4fb7bbb61492d7c3f399a2b98af9bfb28')
_appdir=${pkgbase^^}/application
prepare() {
    cd "$_appdir"
    cmake -G Ninja -S . -B build
}
build() {
    cd "$_appdir"
    cmake --build build --config Release
}
package_d-lan-core() {
    pkgdesc="A free LAN file sharing software (headless core)"
    optdepends=(
        'd-lan-gui: Graphical user interface'
    )
    depends=(libstdc++
        abseil-cpp
        protobuf
        libblake3
        libgcc
        qt6-base
    )
    install -vD "$_appdir/build/output/D-LAN.Core" "$pkgdir/usr/bin/$pkgname"
}
package_d-lan-gui() {
    pkgdesc="A free LAN file sharing software (GUI)"
    depends=(d-lan-core
        libgcc
        abseil-cpp
        libstdc++
        protobuf
        libblake3
        libglvnd
        qt6-svg
        hicolor-icon-theme
        qt6-base
    )
    install -vD "$_appdir/build/output/D-LAN.GUI" "$pkgdir/opt/$pkgbase/$pkgname"
    mkdir --parents "$pkgdir/usr/bin/"
    ln -s /opt/$pkgbase/$pkgname "$pkgdir/usr/bin/$pkgname"
    cp --recursive "$_appdir/GUI/resources/emoticons" "$pkgdir/opt/$pkgbase/emoticons"
    install -vD "$_appdir/Setups/Ubuntu/$pkgbase.desktop" "$pkgdir/usr/share/applications/$pkgbase.desktop"
    sed -i "s|^Exec=$pkgname|Exec=bash -c 'd-lan-core \& $pkgname'|" "$pkgdir/usr/share/applications/$pkgbase.desktop"
    install -vD "$_appdir/GUI/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgbase.svg"
    cp --recursive "$_appdir/styles" "$pkgdir/opt/$pkgbase/styles"
}
