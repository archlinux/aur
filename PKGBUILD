# Maintainer: Nick Weber <nycz.club>
pkgname=mongobench-git
_appname=mongobench
pkgver=1.1.0.r34.g6fc2552
pkgrel=1
pkgdesc="A modern, dark-mode-first MongoDB GUI"
arch=('x86_64')
url="https://github.com/ByteExceptionM/MongoBench"
license=('MIT')
depends=('electron')
makedepends=('npm')
provides=("$_appname")
conflicts=("$_appname")
source=(
  "git+https://github.com/ByteExceptionM/MongoBench.git"
  "0001-fix-display-correct-icon-under-wayland-kde.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
    cd "$srcdir/MongoBench"
    git fetch --tags --quiet 2>/dev/null || true

    local tag count hash
    tag=$(git describe --tags --abbrev=0 2>/dev/null) || tag=""
    tag=${tag#v}
    [ -n "$tag" ] || tag="0.1.0"

    count=$(git rev-list --count HEAD)
    hash=$(git rev-parse --short=7 HEAD)

    printf '%s.r%s.g%s' "$tag" "$count" "$hash"
}

prepare() {
    cd "$srcdir/MongoBench"
    for p in "$srcdir"/*.patch; do
        patch -Np1 -i "$p"
    done
}

build() {
    cd "$srcdir/MongoBench"
    npm ci
    npm run build
    npm prune --omit=dev
}

package() {
    cd "$srcdir/MongoBench"

    install -dm755 "$pkgdir/usr/lib/$_appname"
    cp -r out          "$pkgdir/usr/lib/$_appname/"
    cp -r node_modules "$pkgdir/usr/lib/$_appname/"
    install -Dm644 package.json "$pkgdir/usr/lib/$_appname/package.json"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_appname" <<'EOF'
#!/bin/sh
exec electron /usr/lib/mongobench "$@"
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_appname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=MongoBench
GenericName=MongoDB GUI
Comment=A modern, dark-mode-first MongoDB GUI
Exec=mongobench %U
Icon=mongobench
Terminal=false
Categories=Development;Database;
StartupWMClass=MongoBench
EOF

    install -Dm644 build/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_appname.png"
}
