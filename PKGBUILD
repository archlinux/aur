# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: BrLi <brli at chakralinux dot org>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>

pkgname=zettlr-git
_pkgname=Zettlr
pkgver=3.1.0.beta.3.r18.g60600cd
pkgrel=1
pkgdesc='A Markdown Editor for the 21st century'
arch=(x86_64)
url=https://www.zettlr.com
_url="https://github.com/$_pkgname/$_pkgname"
license=(GPL-3.0-only)
_electron=electron30
depends=(crimson-font
         "$_electron"
         pandoc-cli
         ttf-inconsolata
         ttf-liberation)
makedepends=(gendesk
             git
             nodejs-lts-iron # grep NODE_VERSION: .github/workflows/build.yml
             node-gyp
             yarn
             jq)
optdepends=('texlive-latex: For Latex support')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$_url.git"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.xml")
sha256sums=('SKIP'
            'e300f2cac217f98ab5c365dccc7581410bc296f2842d52f7f1520dd6679d20cf'
            'c3ecbb490a1d4fa5bc42f7166cc375e5629a452d25bb1d4facb5541938681292')

prepare() {
	gendesk -q -f -n \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--name "$_pkgname" \
		--categories 'Office' \
		--mimetypes 'text/markdown' \
		--custom StartupWMClass="$_pkgname"
	cd "$pkgname"
	local _electronVersion="$(cat /usr/lib/$_electron/version)"
	readarray -t _oldElectron <  <(yarn info --cache --json 'electron' | jq -r '.children | .Version,.Cache.Checksum')
	sed -i "/${_oldElectron[1]:3}/d" yarn.lock
	sed -i "s/\([\^ :]\)${_oldElectron[0]}/\1$_electronVersion/" package.json yarn.lock
	echo -ne '#!/usr/bin/env bash\n\nexit 0' > scripts/get-pandoc.sh
	sed -e "s/@ELECTRON@/$_electron/" "../${source[1]}" > $pkgname.sh
	yarn install --immutable # postinstall script installs electron-builder deps
	ln -sf /usr/bin/pandoc resources/pandoc-linux-x64
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	local NODE_ENV=''
	yarn package:linux-x64
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-git}.desktop"
	cd "$pkgname"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	local _destdir="usr/lib/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/$_destdir/" \
		"out/$_pkgname-linux-x64/resources/"{app.asar,icon.code.icns}
	cp -a out/$_pkgname-linux-x64/resources/app.asar.unpacked "$pkgdir/$_destdir/"
	for px in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm0644 "resources/icons/png/${px}x${px}.png" \
			"$pkgdir/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname%-git}.png"
	done
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "../${source[2]}"
}
