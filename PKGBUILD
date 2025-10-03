# Maintainer: Amro Emad <korialo001 at gmail dot com>
pkgname=seanime-git
_pkgname=seanime
pkgver=v2.9.10.r2.g8afb003
pkgrel=1
pkgdesc="Open-source media server with a web interface and desktop app for anime and manga."
arch=('x86_64' 'aarch64')
url="https://github.com/5rahim/seanime"
license=('GPL-3.0-only')
provides=('seanime' 'seanime-desktop')
makedepends=('git' 'npm' 'go' 'cargo' 'clang' 'llvm' 'lld' 'patchelf' 'cargo-tauri')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'gdk-pixbuf2')
source=("git+https://github.com/5rahim/seanime.git"
    "deactivate-updater.patch"
    )
sha256sums=('SKIP'
   "77da87a9d62141cd10143790c1187c4a7646d5c06138ac2581ae5db9469a3019"
    )

pkgver() {
  cd "$_pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    # Disable the updater for the git version

    patch -Np1 -i ../deactivate-updater.patch
}

build() {
    cd "$_pkgname/seanime-web"

    # Mirror the workflow, build order webapp > server > tauri app, start with webapp below

    npm install --cache "${srcdir}/npm-cache"
    npm run build
    npm run build:desktop

    # Needed for the server build and tauri build

    cp -r out/ ../web
    cp -r out-desktop/ ../web-desktop

    cd "$srcdir/$_pkgname"

    mkdir -p binaries

    # Server: Can be build for both try to comform with upstream
    export CGO_ENABLED=1
    if [ "$CARCH" = aarch64 ]; then
    export GOARCH=arm64
    else
    export GOARCH=amd64
    fi

    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o ./binaries/seanime-server-linux-${GOARCH} \
    .

    # Tauri app

    cd "$srcdir/$_pkgname/seanime-desktop"

    npm install --cache "${srcdir}/npm-cache"

    cd src-tauri/

    cp $srcdir/seanime/binaries/seanime-server-linux-${GOARCH} ./binaries/seanime-"$(rustc -vV | sed -n 's/host: //p')"

    # Build  tauri with clang to not raise errors, bundle as 'deb' instead of 'appimage'

    export CC=clang
    export CXX=clang++
    export ld=lld
    export llvm=1
    export RUSTFLAGS="-Cforce-frame-pointers=yes -Clinker=clang -Clink-arg=-fuse-ld=lld"
    export CARGO_HOME="${srcdir}/cargo-cache"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo tauri build -b deb --ci
    }

package() {
    # Note: check for permissions if any error raised

    mv "$srcdir/$_pkgname/seanime-desktop/src-tauri/target/release/bundle/deb/Seanime Desktop_2.9.10_amd64/data/usr" "$pkgdir"
    install -Dm644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
    }
