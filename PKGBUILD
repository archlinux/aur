# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=xcursor-haiku
pkgdesc='A port of of haiku cursor as a xcursor theme, using haiku-icons repo'
pkgver=2
pkgrel=2
url=https://github.com/leath-dub/Haiku_Cursor
arch=(any)
makedepends=(git librsvg xorg-xcursorgen yq)
license=(MIT)

# Corresponds to the "linux-02" tag
_commit=33ef38c28a980823f4b8cc2503aff11ec22de683
_haiku_icons_commit=3b21b240380765d65d24f62eb1a2a4e9298db02f

source=("$pkgname-$pkgver::git+$url#commit=$_commit"
        "$pkgname-$pkgver-haiku-icons::git+https://github.com/darealshinji/haiku-icons.git#commit=$_haiku_icons_commit"
		https://github.com/ful1e5/XCursor-pro/raw/9a7ac26b7c9be603d74b62c725be65c4b3b707d6/configs/x.build.toml
		https://github.com/mxre/cursor/raw/8d31a66725d46cd955bcbd2340e443c627aa175f/names.txt
		Makefile)
sha256sums=('1bd2dbb7262fdfa334b00332b9d42c4ab1cc5af7727d0de67429f9073484c08f'
            'eeb0e43e88d0be6c0fa32f493bdc4c70eb8c0413fe473271711a8c9baa49016d'
            'eb9e1f85da306a42a8095fdb51d06915eafcbdb447216e535c493cd399970218'
            '105c445987e32bbc55b27a6d949fa69f2c34cd72d86e7d5c0c850191ca325e21'
            '6eceda2c11355037095540584f8526a62f3687fe7302a72456cdf02ee44cb260')

prepare () {
	cd "$pkgname-$pkgver"
	cp -v "$srcdir/Makefile" Makefile
	cp -v "$srcdir/x.build.toml" icons.toml
	git submodule init
	git config submodule.haiku-icons.url "$srcdir/$pkgname-$pkgver-haiku-icons"
	git -c protocol.file.allow=always submodule update
}

_emit_make_rule () {
cat <<EOF
$1: $2
	\$(CONVERT_SVG)
$1: SIZE := $3
PNGS += $1
EOF
}

build () {
	cd "$pkgname-$pkgver"

	rm -rf dist pngs
	mkdir dist pngs

	# Prepare Make fragment with rules to create multi-size icons
	local name
	for name in *.cursor ; do
		local t_size t_xhot t_yhot svg
		read t_size t_xhot t_yhot svg < "$name"
		name=${name%.cursor}
		svg=${svg#48x48/}
		svg=${svg%.png}

		if [[ $svg = FollowLink ]] ; then
			svg=CreateLink
		fi

		svg="haiku-icons/svg/cursors/$svg.svg"

		for size in 24 32 48 64 96 ; do
			local png xhot yhot
			xhot=$(( size * t_xhot / t_size ))
			yhot=$(( size * t_yhot / t_size ))
			png="pngs/$size-$name.png"
			_emit_make_rule "$png" "$svg" "$size" 1>&8
			echo "$size $xhot $yhot $png" 1>&9
		done 9> "$name.cur"
	done 8> Makefile.part

	# Generate PNGs
	make

	# Generate cursors
	for name in *.cur ; do
		echo "xcursorgen ${name%.cur}"
		xcursorgen "$name" "dist/${name%.cur}"
	done

	# Prep aliases
	for name in $(tomlq -r '.cursors[] | select(.x11_name != null) | .x11_name' icons.toml) ; do
		if [[ ! -r $name.cur ]] ; then
			continue
		fi
		local linkname
		for linkname in $(tomlq -r ".cursors[\"$name\"] | select(.x11_symlinks != null) | .x11_symlinks[]" icons.toml) ; do
			if [[ ! -r dist/$linkname ]] ; then
				ln -snfv "$name" "dist/$linkname"
			fi
		done
	done

	local -a linknames
	while read -r -a linknames ; do
		name=${linknames[0]}
		if [[ -z $name || $name = \#* ]] ; then
			continue
		fi
		if [[ ! -r $name.cur ]] ; then
			continue
		fi
		unset linknames[0]
		for linkname in "${linknames[@]}" ; do
			if [[ ! -r dist/$linkname ]] ; then
				ln -snfv "$name" "dist/$linkname"
			fi
		done
	done < "$srcdir/names.txt"
}

package () {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/icons/Haiku/cursors"
	cp -a dist/* "$pkgdir/usr/share/icons/Haiku/cursors"
	cp index.theme "$pkgdir/usr/share/icons/Haiku/index.theme"
}
