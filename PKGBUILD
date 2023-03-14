# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=wow.export-git
pkgver=0.1.48.r0.g03ffdfb
pkgrel=1
pkgdesc='Extracting and converting World of Warcraft files'
arch=('x86_64')

url='https://www.kruithne.net/wow.export/'
license=('MIT')
# no runtime depends
optdepends=(
    # 'blender: Advanced map/model importing'
)
makedepends=(
    'git'
    'nodejs-lts-gallium'
    'npm'
    'imagemagick'
    # 'blender'
)
source=(
    'git+https://github.com/Kruithne/wow.export.git#branch=temp-release'
    disable-updater.js
    wow.export.desktop
    run_wow.export.sh
)
sha256sums=('SKIP'
            'df1c85ec9910f2fa5e423c786ee274a91bb5d5d751af0cc1d9657e39226896b7'
            '0999c519bdeeb9038f9dae1164b8d953c8abf3e446b0d1af698f975553e558f9'
            '8659e690ae3cc215035132b56795bded32fc81175829c421d8238086a703611c')

pkgver() {
    cd wow.export/
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    node disable-updater.js
    mkdir -p wow.export/bin/linux-x64/
}

build() {
    cd wow.export/
    npm install
    node build.js linux-x64
}

package() {
    install -Dm755 run_wow.export.sh "$pkgdir/usr/bin/wow.export"
    install -Dm644 wow.export.desktop -t "$pkgdir/usr/share/applications/"

    cd "$srcdir"/wow.export/bin/linux-x64/
    find . -perm 600 -exec chmod 644 {} \;
    find . -perm 700 -exec chmod 755 {} \;
    mkdir -p "$pkgdir"/usr/lib/wow.export/
    cp -r -- * "$pkgdir"/usr/lib/wow.export/

    cd "$srcdir"/wow.export/
    install -Dm644 resources/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/wow.export.png"
    for size in 16 22 24 32 36 44 48 64 72 96; do
        target="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p $target
        convert resources/icon.png -resize ${size}x${size} "$target/wow.export.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # blender add-on
    # _blender=$(blender -v | head -n1 | cut -f2 -d ' ' | grep -oE '^[0-9]+.[0-9]+')
    # install -Dm644 addons/blender/2.80/io_scene_wowobj/{__init__,import_wowobj}.py -t "$pkgdir/usr/share/blender/${_blender}/scripts/addons/io_scene_wowobj/"
}
