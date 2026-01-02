pkgname=beutl-git
pkgver=v1.1.0.549a7c735
pkgrel=1
pkgdesc="Cross-platform video editing (compositing) software"
arch=('x86_64')
url="https://github.com/b-editor/beutl"
license=('GPL-3.0')
depends=('dotnet-runtime')
makedepends=('git' 'dotnet-sdk' 'jq' 'bash')
optdepends=('oxipng: optimize PNG icon')
source=("git+https://github.com/b-editor/beutl.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/beutl"
    tag=$(git describe --tags --abbrev=0)
    commit=$(git rev-parse --short HEAD)
    printf "%s.%s" "$tag" "$commit"
}

build() {
    cd "$srcdir/beutl"

    #NUKE build
    bash build.sh

    #Beutl build
    dotnet publish src/Beutl/Beutl.csproj \
        -c Release \
        -f net10.0 \
        -r linux-x64 \
        --self-contained true
}

package() {
    set -x

    publish_dir="$srcdir/beutl/src/Beutl/bin/Release/net10.0/linux-x64/publish"

    echo "Checking publish directory: $publish_dir"
    if [[ ! -d "$publish_dir" ]]; then
        echo "publish directory doesn't exist"
        ls -R "$srcdir/beutl/src/Beutl/bin/Release/net10.0" || true
        return 1
    fi

    cd "$publish_dir"

    echo "JSON minification"

    process_json_files() {

        # JSON files
        for file in "$1"/*.json; do
            if [[ -f "$file" ]]; then
                echo "Minifying JSON: $file"
                jq -c . "$file" | tr -d " \n" > "$file.tmp" || {
                    echo "ERROR: jq failed on $file"
                    return 1
                }
                mv "$file.tmp" "$file"
            fi
        done

        for dir in "$1"/*/; do
            if [[ -d "$dir" ]]; then
                process_json_files "$dir"
            fi
        done
    }

    process_json_files .

    echo "Remove PDB files"
    rm -f *.pdb || true

    echo "install"
    install -d "$pkgdir/usr/bin/beutl"
    cp -a . "$pkgdir/usr/bin/beutl/" || {
        echo "ERROR: Failed to copy application files"
        return 1
    }

    desktop_src="$srcdir/beutl/packages/ubuntu22.04_amd64/usr/share/applications/beutl.desktop"
    desktop_dst="$pkgdir/usr/share/applications/beutl.desktop"

    if [[ ! -f "$desktop_src" ]]; then
        echo "ERROR: Desktop file not found: $desktop_src"
        ls -R "$srcdir/beutl/packages" || true
        return 1
    fi

    install -Dm644 "$desktop_src" "$desktop_dst"

    echo "Patching Exec in .desktop"
    sed -i 's|Exec=.*|Exec=/usr/bin/beutl/Beutl|' "$desktop_dst"

    icon_src="$srcdir/beutl/packages/ubuntu22.04_amd64/usr/share/pixmaps/beutl_icon.png"
    icon_dst="$pkgdir/usr/share/pixmaps/beutl_icon.png"

    if [[ ! -f "$icon_src" ]]; then
        echo "ERROR: Icon not found at: $icon_src"
        ls -R "$srcdir/beutl/packages" || true
        return 1
    fi

    install -Dm644 "$icon_src" "$icon_dst"

    if command -v oxipng >/dev/null 2>&1; then
        echo "Optimizing icon with oxipng"
        oxipng -o 4 "$icon_dst"
    else
        echo "oxipng not found"
    fi
}
