# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=xcursor-chromeos
pkgver=latest
pkgrel=2
pkgdesc="The cursors from Chrome OS"
arch=('any')
url="https://www.chromium.org/chromium-os"
license=('BSD')
makedepends=('xorg-xcursorgen')
provides=('xcursor-chromeos')
source=("https://chromium.googlesource.com/chromium/src/+archive/main/ui/resources.tar.gz"
        "LICENSE.b64::https://chromium.googlesource.com/chromium/src/+/main/LICENSE?format=TEXT"
        "makefile")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

_prepare_list=(
    "alias alias"
    "cell cell"
    "context_menu context_menu"
    "copy copy"
    "crosshair crosshair"
    "fleur hand1"
    "hand2 hand2"
    "hand3 grabbing"
    "help help"
    "left_ptr left_ptr"
    "move move"
    "nodrop nodrop"
    "sb_horizontal_double_arrow sb_h_double_arrow"
    "sb_vertical_double_arrow sb_v_double_arrow"
    "top_left_corner top_left_corner"
    "top_right_corner top_right_corner"
    "xterm xterm"
    "xterm_horiz xterm_horiz"
    "zoom_in zoom_in"
    "zoom_out zoom_out"
)

_package_list=(
    "alias dnd-link"
    "crosshair cross"
    "grabbing fleur"
    "grabbing pointer-move"
    "grabbing dnd-move"
    "hand1 grab"
    "hand2 hand"
    "hand2 pointer"
    "help left_ptr_help"
    "left_ptr all-scroll"
    "left_ptr arrow"
    "left_ptr default"
    "left_ptr wait"
    "left_ptr watch"
    "nodrop no-drop"
    "nodrop dnd-no-drop"
    "sb_h_double_arrow e-resize"
    "sb_h_double_arrow ew-resize"
    "sb_h_double_arrow h_double_arrow"
    "sb_h_double_arrow left_side"
    "sb_h_double_arrow right_side"
    "sb_h_double_arrow w-resize"
    "sb_v_double_arrow bottom_side"
    "sb_v_double_arrow n-resize"
    "sb_v_double_arrow ns-resize"
    "sb_v_double_arrow s-resize"
    "sb_v_double_arrow row-resize"
    "sb_v_double_arrow top_side"
    "sb_v_double_arrow v_double_arrow"
    "top_right_corner bd_double_arrow"
    "top_left_corner bottom_right_corner"
    "top_left_corner nw-resize"
    "top_left_corner se-resize"
    "top_right_corner bottom_left_corner"
    "top_right_corner fd_double_arrow"
    "top_right_corner ne-resize"
    "top_right_corner sw-resize"
    "xterm text"
)

prepare() {
    mkdir -p "$pkgname-$pkgver"
    for pair in "${_prepare_list[@]}"
    do
        read -r src dst <<< "$pair"
        mv "$srcdir/default_100_percent/common/pointers/$src.png" "$pkgname-$pkgver/${dst}_25.png"
        mv "$srcdir/default_200_percent/common/pointers/$src.png" "$pkgname-$pkgver/${dst}_50.png"
    done
}

build() {
    make -f "$srcdir/makefile" -C "$pkgname-$pkgver"
    base64 -d "$srcdir/LICENSE.b64" > "$pkgname-$pkgver/LICENSE"
}

package() {
    cd "$pkgname-$pkgver"

    install -dm 755 "$pkgdir/usr/share/icons/$pkgname/cursors/"

    for pair in "${_package_list[@]}"
    do
        read -r src dst <<< "$pair"
        install -m 644 "$src" "$pkgdir/usr/share/icons/$pkgname/cursors/"
        ln -s "$src" "$pkgdir/usr/share/icons/$pkgname/cursors/$dst"
    done
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
