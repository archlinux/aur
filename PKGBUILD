# Maintainer: KafCoppelia <k740677208 at gmail dot com>
# SPDX-License-Identifier: 0BSD

pkgname=quosparr-git
pkgver=1.12.2.r0.g9edda7b
pkgrel=2
pkgdesc='Native desktop tray monitor for AI quotas, session usage and costs'
arch=('x86_64' 'aarch64')
url='https://github.com/Licoy/Quosparr'
license=('AGPL-3.0-only AND MIT AND LicenseRef-Remix-Icon')
depends=('ca-certificates' 'cairo' 'coreutils' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libayatana-appindicator' 'org.freedesktop.secrets' 'pango'
         'sh' 'util-linux' 'xdg-utils')
makedepends=('git' 'go>=1.27.3' 'python')
provides=('quosparr')
conflicts=('quosparr')
options=('!strip' '!debug')
source=("quosparr::git+$url.git#branch=main" 'quosparr-launcher')
sha256sums=('SKIP' 'd2c535ac87269936489c905af000254cd08025010c6d9ea7dba7a7990b9b6a61')

pkgver() {
    cd quosparr
    git describe --first-parent --tags --match 'v[0-9]*' --exclude 'v*-*' --long --abbrev=7 |
        sed -E 's/^v//; s/-([0-9]+)-g/.r\1.g/'
}

prepare() {
    cd quosparr
    GOTOOLCHAIN=local go mod download
}

build() {
    cd quosparr
    local goarch=amd64
    [[ $CARCH != aarch64 ]] || goarch=arm64
    GOTOOLCHAIN=local CGO_ENABLED=0 GOFLAGS='-mod=readonly -buildmode=pie' \
        V1_DEVELOPMENT_PACKAGE=1 V1_BUILD_DIR="$srcdir/build" \
        bash Scripts/package-v1-platform.sh "linux/$goarch"
}

check() {
    cd quosparr
    GOTOOLCHAIN=local go test -mod=readonly -count=1 -timeout=5m ./...
}

package() {
    local goarch=amd64
    [[ $CARCH != aarch64 ]] || goarch=arm64
    cd "$srcdir/build/linux-$goarch"
    install -Dm755 quosparr libmygo-sqlite3.so -t "$pkgdir/usr/lib/quosparr/"
    install -Dm755 "$srcdir/quosparr-launcher" "$pkgdir/usr/bin/quosparr"
    install -Dm644 quosparr.desktop "$pkgdir/usr/share/applications/quosparr.desktop"
    install -Dm644 quosparr-256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/quosparr.png"
    install -Dm644 quosparr-512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/quosparr.png"

    cd "$srcdir/quosparr"
    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md internal/app/assets/providers/{LOBEHUB,REMIXICON}-LICENSE \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
