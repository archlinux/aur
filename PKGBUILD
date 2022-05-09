# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: BrLi <brli at chakralinux dot org>

pkgname=zettlr-git
_pkgname=Zettlr
pkgver=2.2.6.r0.g7dea2fe
pkgrel=1
pkgdesc='A Markdown Editor for the 21st century'
arch=(x86_64)
url=https://www.zettlr.com
_url="https://github.com/$_pkgname/$_pkgname"
license=(GPL)
_electron=electron17
depends=(crimson-font
         $_electron
         pandoc
         ttf-inconsolata
         ttf-liberation)
makedepends=(gendesk
             git
             nodejs-lts-gallium # grep NODE_VERSION .github/workflows/build.yml
             yarn)
optdepends=('texlive-bin: For Latex support')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$_url.git"
        "${pkgname%-git}.sh"
        "${pkgname%-git}.xml")
sha256sums=('SKIP'
            'e300f2cac217f98ab5c365dccc7581410bc296f2842d52f7f1520dd6679d20cf'
            'c3ecbb490a1d4fa5bc42f7166cc375e5629a452d25bb1d4facb5541938681292')

_yarnargs="--cache-folder '$srcdir/cache' --link-folder '$srcdir/link'"

prepare() {
	local _electronVersion=$($_electron --version | sed -e 's/^v//')
	gendesk -q -f -n \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--name "$_pkgname" \
		--categories 'Office' \
		--mimetypes 'text/markdown' \
		--custom StartupWMClass="$_pkgname"
	cd "$pkgname"
	echo -ne '#!/usr/bin/env bash\n\nexit 0' > scripts/get-pandoc.sh
	sed -i -e '/"electron"/d' package.json
	sed -e "s/@ELECTRON@/$_electron/" "../${source[1]}" > $pkgname.sh
	yarn $_yarnargs install --frozen-lockfile --ignore-scripts
	yarn $_yarnargs add --dev --no-lockfile electron@$_electronVersion
	yarn $_yarnargs install --pure-lockfile # postinstall script installs electron-builder deps
	ln -sf /usr/bin/pandoc resources/pandoc-linux-x64
	yarn $_yarnargs lang:refresh
	yarn $_yarnargs csl:refresh
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	local NODE_ENV=''
	yarn $_yarnargs reveal:build
	yarn $_yarnargs package:linux-x64
}

package() {
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "${pkgname%-git}.desktop"
	cd "$pkgname"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	local _destdir="usr/lib/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/$_destdir/" \
		"out/$_pkgname-linux-x64/resources/"{app.asar,icon.code.icns}
	for px in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm0644 "resources/icons/png/${px}x${px}.png" \
			"$pkgdir/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname%-git}.png"
	done
	install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "../${source[2]}"
}
