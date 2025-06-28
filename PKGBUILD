# Maintainer: kamisaki
pkgname=hypr-windowrulex
pkgver=0.1.0
pkgrel=1
pkgdesc=" ✨ Enhances Hyprland window management by applying float, size, and move adjustments to dynamic title changes."
arch=('x86_64')
url="https://github.com/xeyossr/hypr-windowrulex"
license=('GPL3')
depends=()
makedepends=('python' 'python-pip' 'python-virtualenv' 'upx' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Create virtualenv inside build dir
    python -m venv .venv
    # Install dependencies in venv (requirements and nuitka)
    .venv/bin/pip install --upgrade pip
    .venv/bin/pip install -r requirements.txt
    .venv/bin/pip install nuitka

    # Nuitka build (standalone, onefile, upx)
    .venv/bin/python -m nuitka \
        --onefile \
        --follow-imports \
        --standalone \
        --lto=yes \
        --enable-plugin=upx \
        --show-progress \
        --assume-yes-for-downloads \
        --remove-output \
        hypr_windowrulex.py

    # Rename output
    mv hypr_windowrulex.bin hypr-windowrulex
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Install the compiled binary
    install -Dm755 hypr-windowrulex "$pkgdir/usr/bin/hypr-windowrulex"
}

