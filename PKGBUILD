# Maintainer: i am piou <i.am.piou@gmail.com>

pkgname=fairywren-icon-theme-git
pkgver=r324.151772f
pkgrel=1
pkgdesc="Free and open source SVG icon theme for Linux, based on the Papirus Icon Set, with a modernized gradient-inspired material feel"
arch=('any')
url='https://gitlab.com/FreshDoctor/FairyWren-Icons'
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
optdepends=('papirus-icon-theme: fallback icons (FairyWren extends Papirus)')
provides=("${pkgname%-git}")
conflicts=('fairywren-icon-theme')
install=fairywren-icon-theme-git.install
source=("${pkgname%-git}::git+https://gitlab.com/FreshDoctor/FairyWren-Icons.git")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags --abbrev=7 2>/dev/null \
		| sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
		| grep . \
		|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	local src="$srcdir/${pkgname%-git}"
	local icons_dir="$pkgdir/usr/share/icons"

	install -Ddm755 "$icons_dir"

	# Install license
	install -Dm644 "$src/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Discover all available colours from the Dark variant
	local colours=()
	for d in "$src/FairyWren_Dark/places/colours"/*/; do
		colour=$(basename "$d")
		[[ "$colour" == "default" ]] && continue
		colours+=("$colour")
	done

	echo "  -> Found ${#colours[@]} colour(s): ${colours[*]}"

	# For each colour × variant, create a named theme directory
	local dirs=() dirs_csv dir rel context size minsize maxsize
	local colour_re base link target real
	for colour in "${colours[@]}"; do
		# Capitalise first letter for the theme display name
		colour_label="${colour^}"

		for variant in Dark Light; do
			src_variant="$src/FairyWren_${variant}"
			theme_name="FairyWren_${variant}_${colour}"
			theme_dir="$icons_dir/$theme_name"

			echo "  -> Installing theme: $theme_name"

			# Copy the full theme
			cp -al --no-preserve=ownership "$src_variant" "$theme_dir"

			# Drop symbolic-old/: ~34 MiB per theme of icons upstream's own
			# index.theme never lists in Directories=, so nothing loads them.
			rm -rf "$theme_dir/symbolic-old"

			# Promote the chosen colour's folder icons into places/ directly,
			# so the icon loader finds the generic names (folder.svg, ...) there.
			# --remove-destination breaks hard links before writing (cp -al shares inodes).
			cp --remove-destination "$theme_dir/places/colours/$colour/"*.svg "$theme_dir/places/"

			# places/ also ships ~2340 colour-qualified aliases. Most point into colours/
			#   folder-red-code.svg     -> colours/red/folder-code.svg
			# but ~350 (Light especially) chain to another alias instead
			#   folder-red-downloads.svg -> ./folder-red-download.svg
			# Either way the name carries the colour, so decide on the name: keep this
			# theme's colour, drop every other one. Deciding on the target would leave the
			# chained aliases behind pointing at links we just deleted.
			#
			# Kept aliases stay symlinks rather than being materialised: resolving them into
			# real SVGs is what made places/ ~25 MiB of near-identical copies per theme.
			colour_re=$(IFS='|'; printf '%s' "${colours[*]}")

			while IFS= read -r -d '' link; do
				base=${link##*/}

				# Does the filename carry a colour token, and which one?
				if [[ "$base" =~ -($colour_re)(-|\.) ]]; then
					if [[ "${BASH_REMATCH[1]}" != "$colour" ]]; then
						# Names a colour this theme does not carry -- drop it
						rm -f "$link"
						continue
					fi
				fi

				# Kept: if it still reaches into colours/, retarget at the promoted
				# copy now sitting in places/. Chained aliases already resolve fine.
				target=$(readlink "$link")
				[[ "$target" == *colours/* ]] || continue
				ln -sfn "${target##*/}" "$link"
			done < <(find "$theme_dir/places" -maxdepth 1 -type l -print0)

			# A few generic names borrow a specific colour's artwork, e.g.
			#   folder-root.svg -> folder-red.svg
			# The alias they lean on is gone now, so copy the real SVG out of colours/
			# while it is still there -- these names are generic, so losing them would
			# leave a visible hole rather than just an unused alias.
			while IFS= read -r -d '' link; do
				target=$(readlink "$link")
				[[ "$target" != *colours/* ]] || continue

				# folder-red.svg -> colour "red", stem "folder.svg"
				base=${target##*/}
				[[ "$base" =~ ^(.*)-($colour_re)(\.svg)$ ]] || continue
				real="$theme_dir/places/colours/${BASH_REMATCH[2]}/${BASH_REMATCH[1]}${BASH_REMATCH[3]}"

				[[ -f "$real" ]] || continue
				cp --remove-destination "$real" "$link"
			done < <(find "$theme_dir/places" -maxdepth 1 -xtype l -print0)

			rm -rf "$theme_dir/places/colours"

			# Generate index.theme (upstream ships an empty placeholder)
			# Build Directories= list dynamically from what's in the theme
			dirs=()
			while IFS= read -r -d '' d; do
				rel="${d#"$theme_dir"/}"
				dirs+=("$rel")
			done < <(find "$theme_dir" -mindepth 1 -maxdepth 2 -type d -print0 | sort -z)

			dirs_csv=$(IFS=,; printf '%s' "${dirs[*]}")

			# Break the hard link before writing (cp -al shares inodes across themes)
			rm -f "$theme_dir/index.theme"

			cat > "$theme_dir/index.theme" <<EOF
[Icon Theme]
Name=FairyWren ${variant} ${colour_label}
Comment=FairyWren ${variant} icon theme (${colour_label} folders)
Inherits=Papirus,breeze,hicolor

Example=distro-fairywren

FollowsColorScheme=true

DesktopDefault=64
DesktopSizes=16,22,24,32,48,64
ToolbarDefault=24
ToolbarSizes=16,22,24,32,48
MainToolbarDefault=24
MainToolbarSizes=16,22,24,32,48
SmallDefault=16
SmallSizes=16,22,24,32,48
PanelDefault=32
PanelSizes=16,22,24,32,48,64
DialogDefault=64
DialogSizes=16,22,24,32,48,64

Directories=${dirs_csv}

EOF
			# Append per-directory sections
			for dir in "${dirs[@]}"; do
				case "$dir" in
					actions)                        context=Actions ;;
					apps|categories|Extras)         context=Applications ;;
					devices)                        context=Devices ;;
					emblems)                        context=Emblems ;;
					emotes)                         context=Emotes ;;
					mimetypes)                      context=MimeTypes ;;
					places)                         context=Places ;;
					status)                         context=Status ;;
					symbolic)                       context=Actions ;;
					symbolic/actions|symbolic/up-to-32) context=Actions ;;
					symbolic/devices)               context=Devices ;;
					symbolic/emblems)               context=Emblems ;;
					symbolic/emotes)                context=Emotes ;;
					symbolic/mimetypes)             context=MimeTypes ;;
					symbolic/panel|symbolic/status) context=Status ;;
					symbolic/places)                context=Places ;;
					small/actions)                  context=Actions ;;
					small/apps|small/categories)    context=Applications ;;
					small/devices)                  context=Devices ;;
					small/emblems)                  context=Emblems ;;
					small/emotes)                   context=Emotes ;;
					small/mimetypes)                context=MimeTypes ;;
					small/panel|small/status)       context=Status ;;
					small/places)                   context=Places ;;
					*)                              context=Applications ;;
				esac

				case "${dir%%/*}" in
					symbolic|small) size=16; minsize=8;  maxsize=31 ;;
					*)              size=64; minsize=32; maxsize=512 ;;
				esac

				cat >> "$theme_dir/index.theme" <<EOF
[$dir]
Size=$size
MinSize=$minsize
MaxSize=$maxsize
Context=$context
Type=Scalable

EOF
			done
		done
	done

	echo "  -> Done — installed $((${#colours[@]} * 2)) theme variant(s)."
}
