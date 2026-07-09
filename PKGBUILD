pkgname=beutl-git
pkgver=v2.0.0.preview.5.rc17b6ca13
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

    tag=${tag//-/.}
    printf "%s.r%s" "$tag" "$commit"
}

build() {
    cd "$srcdir/beutl"
    git submodule update --init --recursive

    # NUKE build
    bash build.sh

    # Common .NET optimization flags
    COMMON_FLAGS=(
        -p:PublishReadyToRun=true
        -p:ReadyToRunUseCrossgen2=true
        -p:TieredPGO=true
        -p:TieredCompilation=true
        -p:TieredCompilationQuickJit=true
        -p:TieredCompilationQuickJitForLoops=true
        -p:InstructionSet="${INSTRUCTIONS:=x86-64-v3}"
    )

    # Beutl dotnet build
    dotnet publish src/Beutl/Beutl.csproj \
        -c Release \
        -f net10.0 \
        -r linux-x64 \
        --self-contained true \
        "${COMMON_FLAGS[@]}"
}

package() {

    publish_dir="$srcdir/beutl/src/Beutl/bin/Release/net10.0/linux-x64/publish"

    printf "Checking publish directory: $publish_dir\n"
    if [[ ! -d "$publish_dir" ]]; then
        printf "publish directory doesn't exist\n"
        ls -R "$srcdir/beutl/src/Beutl/bin/Release/net10.0" || true
        return 1
    fi

    cd "$publish_dir"

    printf "JSON minification\n"

    process_json_files() {

        # JSON files
        for file in "$1"/*.json; do
            if [[ -f "$file" ]]; then
                printf "Minifying JSON: $file\n"
                jq -c . "$file" | tr -d " \n" > "$file.tmp" || {
                    printf "ERROR: jq failed on $file\n"
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

    printf "Remove PDB files\n"
    rm -f *.pdb || true

    printf "install\n"
    install -d "$pkgdir/usr/bin/beutl"
    cp -a . "$pkgdir/usr/bin/beutl/" || {
        printf "ERROR: Failed to copy application files\n"
        return 1
    }

    desktop_src="$srcdir/beutl/packages/ubuntu22.04_amd64/usr/share/applications/beutl.desktop"
    desktop_dst="$pkgdir/usr/share/applications/beutl.desktop"

    if [[ ! -f "$desktop_src" ]]; then
        printf "ERROR: Desktop file not found: $desktop_src\n"
        ls -R "$srcdir/beutl/packages" || true
        return 1
    fi

    install -Dm644 "$desktop_src" "$desktop_dst"

    printf "Patching Exec in .desktop\n"
    sed -i 's|Exec=.*|Exec=/usr/bin/beutl/Beutl|' "$desktop_dst"

    icon_src="$srcdir/beutl/packages/ubuntu22.04_amd64/usr/share/pixmaps/beutl_icon.png"
    icon_dst="$pkgdir/usr/share/pixmaps/beutl_icon.png"

    if [[ ! -f "$icon_src" ]]; then
        printf "ERROR: Icon not found at: $icon_src\n"
        ls -R "$srcdir/beutl/packages" || true
        return 1
    fi

    install -Dm644 "$icon_src" "$icon_dst"

    if command -v oxipng >/dev/null 2>&1; then
        printf "Optimizing icon with oxipng\n"
        oxipng -o max -r -p -s -v -t 4 "$icon_dst"
    else
        printf "oxipng not found\n"
    fi
}
