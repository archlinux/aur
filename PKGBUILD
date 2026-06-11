# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com> 
# Creator: myuki <mioki dot cinnamon650 at 8shield dot net> 

pkgname=fastcat-git
_pkgname=fastcat
pkgver=r8.e009084
pkgrel=1
pkgdesc="A FastFetch Theme Pack - git version"
arch=('any')
url="https://github.com/m3tozz/FastCat"
license=('MIT')
depends=('fastfetch')
optdepends=('ttf-font-nerd: Provides Nerd Font Symbols')
provides=("${_pkgname%}")
conflicts=("${_pkgname%}")
source=("$_pkgname::git+https://github.com/m3tozz-reborn/FastCat")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/fastcat"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/fastcat"

	install -d "$pkgdir/usr/share/fastfetch/presets"
	install -d "$pkgdir/usr/share/fastcat"

    process_theme() {
        local category="$1"
        local theme_path="$2"
        local theme_dirname
        theme_dirname=$(basename "$theme_path")
        
        [[ -d "$theme_path" ]] || return 0

        # Sanitize directory names
        local clean_name="${theme_dirname//\'/}"
        local src_config="$theme_path/fastfetch/config.jsonc"

        if [[ -f "$src_config" ]]; then
            local dest_preset_dir="$pkgdir/usr/share/fastfetch/presets/$category"
            local dest_config="$dest_preset_dir/$clean_name.jsonc"
            
            local dest_asset_dir="/usr/share/fastcat/$category/$clean_name"
            local full_dest_asset_path="$pkgdir$dest_asset_dir"

            mkdir -p "$dest_preset_dir" "$full_dest_asset_path"

            # Install assets and config
            cp -r "$theme_path/fastfetch/"* "$full_dest_asset_path/"
            rm "$full_dest_asset_path/config.jsonc"
            cp "$src_config" "$dest_config"

            # Patch configuration paths for system-wide installation
            sed -i "s|~/\.config/fastfetch/|$dest_asset_dir/|g" "$dest_config"
            sed -i "s|\\\$HOME/\.config/fastfetch/|$dest_asset_dir/|g" "$dest_config"

            # Resolve relative asset paths
            grep -E '"source":' "$dest_config" | while read -r line; do
                local val
                val=$(echo "$line" | sed -E 's/.*"source": *"([^"]+)".*/\1/')
                
                if [[ "$val" != /* && -f "$full_dest_asset_path/$val" ]]; then
                    sed -i "s|\"source\":[[:space:]]*\"$val\"|\"source\": \"$dest_asset_dir/$val\"|g" "$dest_config"
                fi
            done
        fi
    }

    for cat in Large-Themes Small-Themes Visuals-Themes; do
        if [[ -d "$cat" ]]; then
            msg "Processing category: $cat"
            for theme in "$cat"/*; do
                process_theme "$cat" "$theme"
            done
        fi
    done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
