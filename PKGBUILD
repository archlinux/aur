pkgname=oranglauncher
pkgver=8.5.1
pkgrel=2
pkgdesc="built from source with Nuitka"
arch=(x86_64)
url="https://oranges.lt"
license=('GPL3')
depends=(glibc tk webkit2gtk-4.1 gtk3 gobject-introspection-runtime)
makedepends=(python python-pip gcc
             gobject-introspection gtk3 webkit2gtk-4.1 cairo pkgconf
             python-setuptools python-wheel)
conflicts=(oranglauncher-bin)
options=(!debug !strip !lto)

source=("OrangLaunch-${pkgver}.tar.gz::https://github.com/Orang-Studio/OrangLaunch/archive/refs/tags/${pkgver}.tar.gz"
        "oranglauncher.sh"
        "LICENSE"
        "oranglauncher-mime.xml")
sha256sums=('ed315180e426ba632c4dfe720557a84061c515ff4eee74b32774eeb6a3cf3b95'
            'f9aca31c4c3e1e789c7047fed380019744cf13a1e03d7857ac0f7b488d8cc607'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '2d0cdbad857e3b7fe79c41f981a89ad1c595d54e43884b3fd5d89892ec0bf07c')

build() {
    cd "$srcdir/OrangLaunch-${pkgver}"
    python -m venv --system-site-packages build-venv
    build-venv/bin/pip install --upgrade pip wheel nuitka
    build-venv/bin/pip install -r requirements.txt
    build-venv/bin/pip install "patchelf==0.17.2.4"
    export PATH="$srcdir/OrangLaunch-${pkgver}/build-venv/bin:$PATH"
    build-venv/bin/python -m nuitka \
        --standalone \
        --assume-yes-for-downloads \
        --enable-plugin=tk-inter \
        --include-package=gi \
        --include-data-dir=oranglauncher=oranglauncher \
        --output-filename=launcher.bin \
        --output-dir=build \
        --remove-output \
        launcher.py
}

package() {
    cd "$srcdir/OrangLaunch-${pkgver}"
    install -d "$pkgdir/usr/lib/oranglauncher"
    cp -r build/launcher.dist/. "$pkgdir/usr/lib/oranglauncher/"
    chmod -R a+rX "$pkgdir/usr/lib/oranglauncher"
    find "$pkgdir/usr/lib/oranglauncher" -type d -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f -perm /111 -exec chmod 0755 {} +
    find "$pkgdir/usr/lib/oranglauncher" -type f ! -perm /111 -exec chmod 0644 {} +
    install -Dm755 "$srcdir/oranglauncher.sh" "$pkgdir/usr/bin/oranglauncher"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/oranglauncher-mime.xml" "$pkgdir/usr/share/mime/packages/oranglauncher.xml"
}
