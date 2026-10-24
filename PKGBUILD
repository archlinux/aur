# Maintainer: akn19 <akn19@users.noreply.github.com>
#
# Published by .github/workflows/release.yml: the workflow sets pkgver to the release tag, the deploy
# action fills in the checksums of the local files (updpkgsums) and pushes this directory to the AUR.
# `pnpm run build:arch` builds the same package from a working tree: RAKKOMIK_SOURCE then replaces the git tag,
# RAKKOMIK_BRANCH the branch name that the About dialog shows and RAKKOMIK_PNPM_STORE the store of pnpm.
#
# The package is self-contained. It installs the Electron shell of src/app (app.asar) and the web part
# (engine, connectors and user interface, built from the same tag) side by side in /usr/lib/rakkomik. The
# application finds the folder `web` next to app.asar and copies it into its cache directory when the cache is empty,
# so the first start needs no network; the updates keep the cache from then on. It runs on the system `electron` package and so follows Arch's
# Electron releases: no Electron version is pinned here, the application is kept compatible with the current
# Electron instead.

pkgname=rakkomik
pkgver=1.2.3
pkgrel=1
pkgdesc='Manga and comic downloader'
arch=('any')
url='https://github.com/akn19/rakkomik'
license=('Unlicense')
depends=('bash' 'electron' 'hicolor-icon-theme')
makedepends=('git' 'nodejs' 'npm')
source=("$pkgname::${RAKKOMIK_SOURCE:-git+$url.git#tag=v$pkgver}"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('3e66062e533452480295a101130b9428828fa184647f93b35279fdba1bf03c0d'
            'a9623081ede0eb9f52f2ad9db475091f06e00a68ef9fcf5a6f823ca35fe6295b'
            'addb3941dd1bf8a67987d8d9668f0395de4b95e1c8f117ec55beafd5ca8de638')

build() {
    cd "$pkgname"
    local store="${RAKKOMIK_PNPM_STORE:-$srcdir/pnpm-store}"

    # the version of the application is the tag that the package is built from: the shell that is packed below says so
    # (a tag from before the script has the version of its tag in its files)
    if [ -f scripts/set-version.js ]; then
        node scripts/set-version.js "$pkgver"
    fi

    # pnpm comes from npm and not from the distribution: the project asks for pnpm 12 or later (`engines`), and the
    # package of Arch has reported an older version than the one it ships, which pnpm then refuses.
    npm install --prefix "$srcdir/pnpm-cli" --no-audit --no-fund pnpm@12
    export PATH="$srcdir/pnpm-cli/node_modules/.bin:$PATH"

    # The web part. The root project is installed without its scripts: they would download the Electron binary
    # (the system Electron is used) and install src/app, which is done below. The browser builds of fflate and
    # protobufjs are vendored into src/web/js by hand, as the postinstall script does.
    pnpm install --frozen-lockfile --ignore-scripts --store-dir "$store"
    node scripts/vendor.js
    # the About dialog names the branch: a release is named after its tag, not after the branch makepkg makes of it
    RAKKOMIK_BRANCH="${RAKKOMIK_BRANCH:-v$pkgver}" pnpm run build:web

    # The runtime dependencies of src/app as a plain node_modules tree (nodeLinker: hoisted in
    # src/app/pnpm-workspace.yaml): an asar cannot follow the symlinks of pnpm's default layout.
    pnpm --dir src/app install --frozen-lockfile --no-optional --store-dir "$store"

    # pack the shell with the files that the application loads, the way the installers do
    node scripts/pack-app.js src/app "$srcdir/app.asar"
}

package() {
    install -Dm644 "$srcdir/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    cd "$pkgname"
    cp -r build/web "$pkgdir/usr/lib/$pkgname/web"
    for size in 16 24 32 48 64 96 128 256; do
        install -Dm644 "redist/deb/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done
    install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
