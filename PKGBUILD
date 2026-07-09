pkgname=oranglauncher
pkgver=7.0.0
pkgrel=1
pkgdesc="Orange Launcher for Arch Linux (built from source with Nuitka)"
arch=(x86_64)
url="https://oranges.lt"
license=('MIT')
depends=(glibc tk webkit2gtk-4.1 gtk3 gobject-introspection-runtime)
makedepends=(python python-pip gcc
             gobject-introspection gtk3 webkit2gtk-4.1 cairo pkgconf
             python-setuptools python-wheel)
conflicts=(oranglauncher-bin)
source=("OrangLaunch-${pkgver}.tar.gz::https://github.com/Orang-Studio/OrangLaunch/archive/refs/tags/${pkgver}.tar.gz"
        "oranglauncher.sh"
        "oranglauncher.desktop"
        "orange.png"
        "LICENSE"
        "oranglauncher-mime.xml")
sha256sums=('c495bea8c1a688f037afb5cbde54573f278c5293e98630df1618f450de9341f6'
            'f9aca31c4c3e1e789c7047fed380019744cf13a1e03d7857ac0f7b488d8cc607'
            '23d8bec255eee86f4843603b5e46d1dada47ce30b05efb79fa1dd0ec4e781df0'
            'ddbe0ca155b67fcfc1fecdba1cbc6a3aac5a2011316bbb4a222e1f48f8987968'
            '3c8133c78d2e468f22643e465f8abcf4404742dc1b80c5eb64742039d70c5afa'
            '2d0cdbad857e3b7fe79c41f981a89ad1c595d54e43884b3fd5d89892ec0bf07c')

options=(!debug !strip !lto)

build() {
    cd "$srcdir/OrangLaunch-${pkgver}"
    python -m venv --system-site-packages build-venv
    build-venv/bin/pip install --upgrade pip wheel nuitka
    build-venv/bin/pip install -r requirements.txt

    # Arch ships patchelf 0.18.0, which Nuitka refuses (known buggy release).
    # pull a known-good patchelf into the venv and put it ahead of the system one.
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
    install -Dm644 "$srcdir/oranglauncher.desktop" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Exec=.*|Exec=/usr/bin/oranglauncher %f|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    sed -i "s|Icon=.*|Icon=/usr/share/icons/hicolor/256x256/apps/oranglauncher.png|g" "$pkgdir/usr/share/applications/oranglauncher.desktop"
    install -Dm644 "$srcdir/orange.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/oranglauncher.png"
    install -Dm644 "$srcdir/oranglauncher-mime.xml" "$pkgdir/usr/share/mime/packages/oranglauncher.xml"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
