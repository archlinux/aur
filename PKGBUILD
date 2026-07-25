# Maintainer: AkitaOnRails <boss@akitaonrails.com>
#
# Template — the release workflow (.github/workflows/aur-release.yml)
# substitutes pkgver/sha256 from the tagged source tarball and pushes the
# result (plus generated .SRCINFO) to the AUR.

pkgname=frank-go
_reponame=frank_go
pkgver=0.3.9
pkgrel=1
pkgdesc="Beginner-friendly Go/Baduk trainer: tsumego practice, KataGo opponent, influence overlay (Sabaki fork)"
arch=('any')
url="https://github.com/akitaonrails/frank_go"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
# No engine is required: on first use the app's one-click setup downloads a
# portable CPU KataGo that works everywhere, and it verifies any engine
# actually boots before adopting it (a GPU build with no driver falls back
# to CPU automatically). These optdepends only let you use a system engine
# instead of the downloaded one. Prefer katago-cpu — the GPU builds are
# faster but only if you have a working OpenCL/CUDA driver, and installing
# one without a working driver just makes it fall back to CPU anyway.
optdepends=(
    'katago-cpu: system CPU engine for the AI opponent (recommended; works everywhere)'
    'katago-opencl: GPU engine — only with a working OpenCL driver (advanced)'
    'katago-cuda: fastest GPU engine — only with a working CUDA/cuDNN setup (advanced)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5670b9ee46b72e6749cc4e531483fc73068d6b0d7bb09afaf991263e7d981ed4')

build() {
    cd "$_reponame-$pkgver"
    npm ci --no-audit --no-fund
    npm run bundle
    # Keep only runtime dependencies for packaging
    npm prune --omit=dev
}

package() {
    cd "$_reponame-$pkgver"
    local appdir="$pkgdir/usr/lib/$pkgname"

    install -d "$appdir"
    cp -r bundle.js index.html package.json src style data node_modules \
        "$appdir/"

    # Launcher against the system electron
    install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec electron /usr/lib/$pkgname "\$@"
EOF

    install -Dm0644 logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

    install -Dm0644 /dev/stdin \
        "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Frank GO
Comment=Beginner-friendly Go/Baduk trainer
Exec=$pkgname %U
Icon=$pkgname
Type=Application
Categories=Game;BoardGame;
MimeType=application/x-go-sgf;
StartupWMClass=Sabaki
EOF

    install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
