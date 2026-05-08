# Maintainer: Nick Weber <nycz.club>
pkgname=mongobench-git
_appname=mongobench
pkgver=.r32.geee0c5a
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
    printf '%s.r%s.g%s' \
        "$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//' || echo 0.1.0)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
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
