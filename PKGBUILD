# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=v2
pkgver=0.15.6
pkgrel=1
pkgdesc='A local-first, privacy oriented rich text editor with Git-style version control'
arch=(x86_64 aarch64)
url=https://v2editor.com
_url="https://github.com/oktana-coop/$pkgname"
license=(AGPL-3.0-only)
_electron=electron43
depends=($_electron
         glibc # libc.so libm.so
         libstdc++ libstdc++.so
         libgcc libgcc_s.so)
makedepends=(git
             git-lfs
             gendesk
             jq
             moreutils
             node-gyp
             nodejs-lts-krypton
             npm
             pnpm
             sqlite3
             typescript)
optdepends=('libappindicator-gtk3: tray icon support')
source=("git+$_url.git#tag=v$pkgver"
        "$pkgname.sh.in")
sha256sums=('eb18c7a27ba9965966f3b04b28e39ece7831bad89795651771afc13dc4e2fc30'
            '4426132f3455e44ae2698752dfd4d748a9bd831079f7fed038d18814dc5088f1')

_icons=(16 32 48 64 128 256 512)

prepare(){
	cd "$pkgname"
	git lfs install --local
	git remote add network-origin $_url.git
	git lfs pull network-origin
	# Generate stuff not provided upstream
	sed "s/@ELECTRON@/$_electron/" "../$pkgname.sh.in" > "$pkgname.sh"
	gendesk -q -f -n ../PKGBUILD -o "$pkgname.desktop"
	# Make sure we are using the same major version of Electron as upstream
	local _origElectron="electron$(jq -r '.devDependencies.electron | split(".")[0]' package.json | sed -E 's/[^0-9]//')"
	if [[ "$_electron" != "$_origElectron" ]]; then
		echo "Electron version mismatch: $_electron vs $_origElectron"
		# https://github.com/oktana-coop/v2/issues/383
		# exit 1
	fi
	# Substitute our exact distro packaged version of Electron
	local _electronVersion="$(< "/usr/lib/$_electron/version")"
	jq '.devDependencies["electron"] = $electronVersion' \
			--arg electronVersion "$_electronVersion" \
			package.json |
		sponge package.json
	# Prep dependencies (not locked because we mucked with Electron versions)
	pnpm install # --frozen-lockfile
	pnpm run postinstall
}

build(){
	cd "$pkgname"
	# https://github.com/oktana-coop/v2/issues/357
	export VITE_PROJECT_TYPE='MULTI_DOCUMENT_PROJECT'
	pnpm run compile
	pnpm run build
	local _electronVersion="$(< "/usr/lib/$_electron/version")"
	pnpm exec electron-builder \
		-c.electronDist="/usr/lib/$_electron" \
		-c.electronVersion="$_electronVersion" \
		--linux \
		--dir \
		--publish=never
}

package(){
	cd "$pkgname"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	local _lib="$pkgdir/usr/lib/$pkgname/"
	install -dm0755 "$_lib"
	cp -rv bin/linux-unpacked/resources/* "$_lib"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
	pushd public/icons
	mv icon.png icon-512.png
	for size in ${_icons[@]}; do
		install -Dm0644 "icon-$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
	done
}
