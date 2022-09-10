# Maintainer: Gutawer <https://github.com/Gutawer>
pkgname=ultimate-doom-builder-git
pkgver=3.0.0.r3991.b24a2dd
pkgrel=2
pkgdesc='A level editor for Doom-engine games, with experimental Linux support.'
arch=('x86_64')
url="https://github.com/jewalky/UltimateDoomBuilder"
license=('GPL3')
depends=('mono')
makedepends=('git' 'mono-msbuild' 'ripgrep' 'sed' 'coreutils' 'make' 'imagemagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+$url"
    "ultimate-doom-builder.desktop"
)
sha512sums=(
    'SKIP'
    'ba12a66ec415b34f96c3bd7d89d5970030973afc245bfdae012a6aa7049a5cc7aa90b9d3b043c4c9bc6051fc5b8fffe98e30511f6d7483640180e5095c7fddc3'
)

pkgver()  {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" \
        "$(rg '\[assembly: AssemblyVersion\("(.*)\.[0-9]*"\)\]' -or '$1' \
            Source/Core/Properties/AssemblyInfo.cs)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"

    VNUMBER=$(git rev-list --count HEAD)
    VHASH=$(git rev-parse --short=7 HEAD)
    FILES=(
        "Source/Core/Properties/AssemblyInfo.cs" \
        "Source/Plugins/BuilderModes/Properties/AssemblyInfo.cs"
    )

    for FILE in "${FILES[@]}"
    do
        echo 'Changing assembly info in `'$FILE'` ...'
        sed -b -i 's/\(\[assembly: AssemblyVersion(".*\.\)[0-9]*")\]/\1'$VNUMBER'")\]/' $FILE
        sed -b -i 's/\(\[assembly: AssemblyHash("\)[0-9a-zA-Z]*")\]/\1'$VHASH'")\]/' $FILE
    done

    make

    git restore Source/
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/opt/ultimate-doom-builder"
    cp -dpr --no-preserve=ownership Build/* "$pkgdir/opt/ultimate-doom-builder/"
    sed -i '1 acd /opt/ultimate-doom-builder/' "$pkgdir/opt/ultimate-doom-builder/builder"

    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/ultimate-doom-builder/builder "$pkgdir/usr/bin/ultimate-doom-builder"

    install -D "$srcdir/ultimate-doom-builder.desktop" -t "$pkgdir/usr/share/applications/ultimate-doom-builder.desktop"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    convert Source/Core/Resources/UDB2.ico[3] "$pkgdir/usr/share/pixmaps/ultimate-doom-builder.png"
}
