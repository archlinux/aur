# Maintainer: Yukari Hafner <shinmera@tymoon.eu>
pkgname=lem-editor-git
pkgrel=1
pkgver=v2.1.0.645.gc44eba86
epoch=0
pkgdesc="An extensible editor written in Common Lisp"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lem-project/lem"
license=('MIT')
options=("!strip")
optdepends=('sdl2: Graphical client')
makedepends=('sbcl' 'sdl2' 'ncurses')
conflicts=('lem-editor')
provides=('lem-editor')
source=("lem::git+https://github.com/lem-project/lem"
        "https://qlot.tech/installer"
        "general.lisp"
        "build-ncurses.lisp"
        "build-sdl2.lisp"
        "lem.desktop")
b2sums=('SKIP'
        'd44ed1885e334a340372dcfafaf6409b2bc10ea9537445cf7590d0c2ca0fd708279ed15e903c7f4a64bc175d8bccdc703177d0e31faf8e6fce6b4489311c19fc'
        'c228c6d9b3eb8379b40be04c7caef16698996642405dcbe769cbf3e8a09ff4464d4ed5638ff2cb12346a77cdf2e1f5eee42d7eb13aeb8f80d2f37c458ab82a6f'
        'c4302f39f5f916f5491f3816d95d60f93502eec4f2d3d8c75f69a464245ed252d89872d2997e907200bac15be39f064e6d69fe2213286dc60650f06fe28e1425'
        'a56e3dd69583c68f4c4e9b3e04c0ab80becd5e8ef98a2fbc7a7fe4aa27a4a6f4f98ff8dd814b1efbe144fdf59e7456fe707bf23095345bb60b198672418aff51'
        'ac7b40bcfdb2a4b6c49cd90914b9244215daf86ee99a390815c360d80c43be513a1a115d0aca4e07cbb81ea79ec8e452d15ff5e6b711d9b0b1b7e1b329124b41')

pkgver() {
    cd "$srcdir/lem"
    git describe | sed s/-/./g
}

prepare() {
    if [ ! -d "qlot" ]; then
        QLOT_HOME="$(pwd)/qlot" bash installer
    fi
}

build() {
    export PATH=$PATH:$(pwd)/qlot/bin/
    cd "$srcdir/lem"
    qlot install
    sbcl --noinform --no-sysinit --no-userinit --load .qlot/setup.lisp --load "$srcdir/build-ncurses.lisp"
    sbcl --noinform --no-sysinit --no-userinit --load .qlot/setup.lisp --load "$srcdir/build-sdl2.lisp"
}

package() {
    mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/applications/" "$pkgdir/usr/share/lem"
    cp -r "$srcdir/lem/frontends/sdl2/resources" "$pkgdir/usr/share/lem/"
    cp "$srcdir/libasyncprocess.so" "$pkgdir/usr/share/lem/"
    cp "$srcdir/lem/lem" "$srcdir/lem/lem-gui" "$pkgdir/usr/bin/"
    cp "$srcdir/lem.desktop" "$pkgdir/usr/share/applications/"
}
