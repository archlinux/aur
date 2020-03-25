# Maintainer: leonekmi <usingarchbtw@leonekmi.fr>
pkgname=karaokemugen-git
pkgver=3.2.0.rc1.r15.g1a01c9c8
pkgrel=1
pkgdesc="Karaoke playlist manager/player app used in parties or events."
arch=(x86_64 i686)
url="https://mugen.karaokes.moe/"
license=('MIT')
groups=()
depends=('mpv' 'ffmpeg' 'postgresql' 'electron')
makedepends=('git' 'npm' 'typescript' 'yarn' 'nodejs>=12')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=${pkgname%-git}.install
source=('karaokemugen::git+https://lab.shelter.moe/karaokemugen/karaokemugen-app.git'
        'karaokemugen-lib::git+https://lab.shelter.moe/karaokemugen/lib.git'
        'install.sh'
        'run.sh'
        'database-tweak.diff'
        'database.json')
noextract=()
md5sums=('SKIP'
        'SKIP'
        '1673054cbeb6b80097dae4601cf35959'
        '6efac0086021d7a7abcf637aae17cc99'
        'c1807f76ea2d800999910fe66e56fe73'
        '0f887855e641ec949ce7c6b69d79ad1e')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, tags available
	git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
    git config submodule.src/lib.url $srcdir/${pkgname%-git}-lib
    git submodule update
    patch --forward -p1 -i '../database-tweak.diff'
}

build() {
	cd "$srcdir/${pkgname%-git}"

    # Prepare dependencies
	export HOME="$srcdir/$pkgname-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
	export npm_config_devdir="$srcdir/$pkgname-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-npm-cache"
    yarn global add electron-builder
	yarn install
    yarn installFrontend
    yarn installSystemPanel
    # Build and package with electron-builder
    export NODE_ENV='production'
    yarn build
    yarn buildFrontend
    yarn buildSystemPanel
    "$(yarn global dir)/node_modules/.bin/electron-builder" --dir
}

package() {
	cd "$srcdir/${pkgname%-git}"

    # Application itself
	install -dm775 "$pkgdir/opt/${pkgname%-git}"
    cp -r --no-preserve=ownership,mode packages/linux-unpacked/* "$pkgdir/opt/${pkgname%-git}/"
    install -dm775 "$pkgdir/opt/${pkgname%-git}/app"
    chmod -R 775 "$pkgdir/opt/${pkgname%-git}/"

    # Symlinks for configuration
    install -dm775 "$pkgdir/etc/${pkgname%-git}"
    cp "config.sample.yml" "$pkgdir/opt/${pkgname%-git}/app/config.sample.yml"
    cp "$srcdir/database.json" "$pkgdir/opt/${pkgname%-git}/app/database.json"
    ln -s "$pkgdir/opt/${pkgname%-git}/app/database.json" "$pkgdir/etc/${pkgname%-git}/database.json"
    ln -s "$pkgdir/opt/${pkgname%-git}/app/config.yml" "$pkgdir/etc/${pkgname%-git}/config.yml"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname%-git}"
    cp --no-preserve=ownership,mode LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

    # Runtimes
    install -dm755 "$pkgdir/usr/bin/"
    cp "$srcdir/run.sh" "$pkgdir/usr/bin/karaokemugen"
    cp "$srcdir/install.sh" "$pkgdir/usr/bin/karaokemugen-install"
    chmod 755 "$pkgdir/usr/bin/karaokemugen" "$pkgdir/usr/bin/karaokemugen-install"
}