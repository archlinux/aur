# Maintainer: AkitaOnRails <boss@akitaonrails.com>
#
# Template — the release workflow (.github/workflows/aur-release.yml)
# substitutes pkgver/sha256 from the tagged source tarball and pushes the
# result (plus generated .SRCINFO) to the AUR.

pkgname=frank-go
_reponame=frank_go
pkgver=0.2.2
pkgrel=1
pkgdesc="Beginner-friendly Go/Baduk trainer: tsumego practice, KataGo opponent, influence overlay (Sabaki fork)"
arch=('any')
url="https://github.com/akitaonrails/frank_go"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
# The app uses a PATH-installed katago when present (any backend); without
# one, its one-click setup downloads a portable CPU engine by itself, so a
# hard dependency on an AUR-provided 'katago' would only make installs
# fragile (makepkg can't resolve AUR providers).
optdepends=(
    'katago-opencl: GPU engine for the AI opponent (lighter build)'
    'katago-cuda: fastest GPU engine (needs CUDA/cuDNN)'
    'katago-cpu: CPU engine from the AUR'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('40de5fb09f8a2dcffec6d0f2c830f77779a88f2d7ffc2f22d5e3f66bcaf1663f')

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
