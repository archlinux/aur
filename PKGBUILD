# Maintainer: Latte macchiato <contact@lattemacchiato.dev>
pkgname=plezy-git
_pkgname=plezy
pkgver=2.0.0.r8.gfd1eaf9d
pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='A modern Plex client for desktop and mobile'
arch=('x86_64')
url='https://github.com/edde746/plezy'
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
    'mpv'
    'libepoxy'
    'libkeybinder3'
    'alsa-lib'
    'glib2'
    'xdg-user-dirs'
)
makedepends=(
    'clang'
    'cmake'
    'ninja'
    'pkgconf'
    'git'
    'curl'
    'unzip'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
_flutter_ver=3.38.6
source=(
    "$_pkgname::git+$url.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_ver}-stable.tar.xz"
)
sha256sums=('SKIP'
            'a70e3b829f53acd013aae65995755db0f421457b5ab754afa5a344cd5ec4d8d5')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    export PATH="$srcdir/flutter/bin:$PATH"
    export PUB_CACHE="$srcdir/.pub-cache"

    flutter config --no-analytics
    flutter precache --linux

    cd "$_pkgname"
    flutter pub get

    # Remove -Werror from all CMakeLists.txt (fixes strict clang warnings in plugins)
    find . -name 'CMakeLists.txt' -exec sed -i 's/-Werror//g' {} +

    flutter build linux --release
}

package() {
    cd "$_pkgname"

    # Install the application bundle
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/$_pkgname/"

    # Create wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/bash
cd /opt/$_pkgname
exec ./$_pkgname "\$@"
EOF

    # Install desktop file
    install -Dm644 linux/packaging/com.edde746.plezy.desktop \
        "$pkgdir/usr/share/applications/com.edde746.plezy.desktop"

    # Install icon
    install -Dm644 assets/plezy.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
