# Maintainer: AkitaOnRails <boss@akitaonrails.com>
#
# Template — the release workflow (.github/workflows/aur-release.yml)
# substitutes pkgver/sha256 from the tagged source tarball and pushes the
# result (plus generated .SRCINFO) to the AUR.

pkgname=frank-go
_reponame=frank_go
pkgver=0.1.0
pkgrel=1
pkgdesc="Beginner-friendly Go/Baduk trainer: tsumego practice, KataGo opponent, influence overlay (Sabaki fork)"
arch=('any')
url="https://github.com/akitaonrails/frank_go"
license=('MIT')
# 'katago' is provided by katago-cpu / katago-opencl / katago-cuda on the
# AUR — the helper lets the user pick a backend. With the engine on PATH,
# the app's one-click setup only fetches a small neural network.
depends=('electron' 'katago')
makedepends=('npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7643bda5a2ab5526ae474dc1d6d704b7d6c9eb1096bed94545c3c628b48d40be')

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
Name=frank_go
Comment=Beginner-friendly Go/Baduk trainer
Exec=$pkgname %U
Icon=$pkgname
Type=Application
Categories=Game;BoardGame;
StartupWMClass=Sabaki
EOF

    install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
