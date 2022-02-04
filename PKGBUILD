# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: BrLi <brli at chakralinux dot org>

pkgname=zettlr
_pkgname=${pkgname^}
pkgver=2.1.3
pkgrel=2
pkgdesc='A Markdown Editor for the 21st century'
arch=(x86_64)
url=https://www.zettlr.com
_url="https://github.com/$_pkgname/$_pkgname"
license=(GPL)
depends=(electron
         otf-crimson-text
         pandoc
         ttf-inconsolata
         ttf-liberation)
makedepends=(gendesk
             git
             nodejs-lts-gallium # check .github/workflows/build.yml for NODE_VERSION
             yarn)
optdepends=('texlive-bin: For Latex support')
_archive="$_pkgname-$pkgver"
source=("$_url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.sh"
        "$pkgname.xml")
sha256sums=('ec77affb8a0db08bf480c9ec0b5caef771251e3b5e1f2ba9219bb7ce466c66fe'
            'c96a7d8e8b538896721e1657aaa7a1fc79836c50f90888f77ccea23e90230326'
            'c3ecbb490a1d4fa5bc42f7166cc375e5629a452d25bb1d4facb5541938681292')

_yarnargs="--cache-folder '$srcdir/cache' --link-folder '$srcdir/link'"

prepare() {
	local _electronVersion=$(electron --version | sed -e 's/^v//')
	gendesk -q -f -n \
		--pkgname "$pkgname" \
		--pkgdesc "$pkgdesc" \
		--name="$_pkgname" \
		--categories=Office \
		--custom StartupWMClass="$_pkgname"
	cd "$_archive"
	echo -ne '#!/usr/bin/env bash\n\nexit 0' > scripts/get-pandoc.sh
	sed -i -e '/"electron"/d' package.json
	yarn $_yarnargs install --frozen-lockfile --ignore-scripts
	yarn $_yarnargs add --dev --no-lockfile electron@$_electronVersion
	yarn $_yarnargs install --pure-lockfile # postinstall script installs electron-builder deps
	ln -sf /usr/bin/pandoc resources/pandoc-linux-x64
}

build() {
	cd "$_archive"
	local NODE_ENV=''
	yarn $_yarnargs reveal:build
	yarn $_yarnargs package:linux-x64
}

package() {
	install -Dm0755 "${source[1]}" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
	cd "$_archive"
	local _destdir="usr/lib/$pkgname"
	install -Dm0644 -t "$pkgdir/$_destdir/resources/" \
		"out/$_pkgname-linux-x64/resources/"{app.asar,icon.code.icns}
	ln -sf /usr/bin/pandoc "$pkgdir/$_destdir/resources/pandoc"
	for px in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm0644 "resources/icons/png/${px}x${px}.png" \
			"$pkgdir/usr/share/icons/hicolor/${px}x${px}/apps/$pkgname.png"
	done
    install -Dm0644 -t "$pkgdir/usr/share/mime/packages/" "../${source[2]}"
}
