# Maintainer: Ethan Stokes <erstokes10@gmail.com>
# Maintainer: Antti <antti@antti.codes>
# Ex-Maintainer: Nixuge

pkgname=modrinth-app-cef-git
pkgver=0.6.2.r3952.b1a7b99
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('rust' 'pnpm' 'git' 'jq' 'java-environment>=17')
depends=(
    # tauri deps
    'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup' 'webkit2gtk-4.1' 'gst-plugins-good'
    # minecraft deps
    'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm'
)
optdepends=(
    'xorg-xrandr: for older minecraft versions'
)
conflicts=('modrinth-app' 'modrinth-app-git')
provides=('modrinth-app')
source=(
    "git+https://github.com/EthanRStokes/code"
    "modrinth-app.desktop"
    "modrinth-app"
    "modrinth-file-extensions.xml"
)
sha256sums=('SKIP'
            '3ac2484618a0b10a979f7ce37fb97e748609bfb3bcccda5018a583e12ac0dbda'
            '3ae79e45c6e102b9ad08df625f051608aaf17ef328df2307b2513c9edee026b6'
            'e0b3eab49465709ed5053dc1fa4206071ab32657d25bd1f9c01850d696715cff')
options=('!lto')

pkgver() {
	cd "$srcdir/code"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/code"
    git reset --hard HEAD
    git_tag="$(git describe --tags --abbrev=0 | sed 's/^v//')"
    sed -i "s/1.0.0-local/$git_tag/" "apps/app/Cargo.toml"
    sed -i "s/1.0.0-local/$git_tag/" "packages/app-lib/Cargo.toml"
    sed -i "s/1.0.0-local/$git_tag/" "apps/app-frontend/package.json"

    export COREPACK_ENABLE_STRICT=0
    pnpm install

    cp -f "packages/app-lib/.env.prod" "packages/app-lib/.env"

    cd "$srcdir/code/apps/app"

    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    export CEF_PATH=$(mktemp -d)
    echo "$CEF_PATH" > "$srcdir/.cef_tmp_path"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/code"
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    export COREPACK_ENABLE_STRICT=0
    export CEF_PATH=$(cat "$srcdir/.cef_tmp_path")
    pnpm --filter=@modrinth/app run tauri build --config tauri-release.conf.json --no-bundle
}

package() {
    CEF_PATH=$(cat "$srcdir/.cef_tmp_path")
    _cef_dir=$(ls -1d "$CEF_PATH"/*/ 2>/dev/null | head -1)
    _cef_dir=$(ls -1d "$_cef_dir"/*/ 2>/dev/null | head -1)

    install -Dm755 "$srcdir"/modrinth-app "$pkgdir"/usr/bin/modrinth-app
    install -Dm755 "$srcdir"/code/apps/app/target/release/ModrinthApp "$pkgdir"/opt/modrinth-app/modrinth-app

    # CEF
    install -Dm755 "${_cef_dir}libcef.so" "$pkgdir"/opt/modrinth-app/libcef.so
    install -Dm755 "${_cef_dir}icudtl.dat" "$pkgdir"/opt/modrinth-app/icudtl.dat
    install -Dm755 "${_cef_dir}v8_context_snapshot.bin" "$pkgdir"/opt/modrinth-app/v8_context_snapshot.bin
    install -Dm755 "${_cef_dir}chrome_100_percent.pak" "$pkgdir"/opt/modrinth-app/chrome_100_percent.pak
    install -Dm755 "${_cef_dir}chrome_200_percent.pak" "$pkgdir"/opt/modrinth-app/chrome_200_percent.pak
    install -Dm755 "${_cef_dir}resources.pak" "$pkgdir"/opt/modrinth-app/resources.pak
    install -Dm755 "${_cef_dir}libEGL.so" "$pkgdir"/opt/modrinth-app/libEGL.so
    install -Dm755 "${_cef_dir}libGLESv2.so" "$pkgdir"/opt/modrinth-app/libGLESv2.so
    install -Dm755 "${_cef_dir}libvk_swiftshader.so" "$pkgdir"/opt/modrinth-app/libvk_swiftshader.so
    install -Dm755 "${_cef_dir}vk_swiftshader_icd.json" "$pkgdir"/opt/modrinth-app/vk_swiftshader_icd.json
    install -Dm755 "${_cef_dir}libvulkan.so.1" "$pkgdir"/opt/modrinth-app/libvulkan.so.1
    install -Dm755 "${_cef_dir}chrome-sandbox" "$pkgdir"/opt/modrinth-app/chrome-sandbox
    cp -r "${_cef_dir}locales" "$pkgdir"/opt/modrinth-app/locales

    rm -rf "$CEF_PATH"

    install -Dm644 "$srcdir"/code/apps/app/icons/128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/modrinth-app.png
    install -Dm644 "$srcdir"/code/apps/app/icons/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256@2/apps/modrinth-app.png
    install -Dm644 modrinth-app.desktop "$pkgdir"/usr/share/applications/modrinth-app.desktop
    install -Dm644 "$srcdir"/modrinth-file-extensions.xml "$pkgdir"/usr/share/mime/packages/modrinth-file-extensions.xml
}
