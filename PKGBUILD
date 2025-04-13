# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeng at proton dot me>

pkgname=fightplanner-git
pkgver=3.3.15.r19.gef4fdc8
pkgrel=1
pkgdesc="SSBU Mod Manager"
arch=('x86_64')
url="https://github.com/FireXDF/SSBUFightPlanner"
license=('MIT')
makedepends=('git' 'nodejs' 'npm')
provides=("fightplanner=$pkgver")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd SSBUFightPlanner || return

	_tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
	_rev=$(git rev-list --count "$_tag"..HEAD)
	_hash=$(git rev-parse --short HEAD)
	printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
	cd SSBUFightPlanner || return
	npm_config_cache="${srcdir}/package-cache" npm install
	npx electron-packager . fightplanner --platform linux --overwrite
}

package() {
	cd SSBUFightPlanner || return
	mkdir -p "${pkgdir}/usr/share"
	cp -r --preserve=mode "${srcdir}/SSBUFightPlanner/fightplanner-linux-x64" "${pkgdir}/usr/share/fightplanner"
	chmod 755 -R "${pkgdir}/usr/share/fightplanner"
	# install -Dm755 -D "${srcdir}/SSBUFightPlanner/fightplanner-linux-x64/fightplanner" "${pkgdir}/usr/share/fightplanner/fightplanner"
	install -Dm644 "${srcdir}/SSBUFightPlanner/fightplanner.desktop" "${pkgdir}/usr/share/applications/fightplanner.desktop"
	install -Dm644 "${srcdir}/SSBUFightPlanner/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/fightplanner.png"
	mkdir -p "${pkgdir}/usr/bin"
	touch "${pkgdir}/usr/bin/fightplanner"
	ln -sf "/usr/share/fightplanner/fightplanner" "${pkgdir}/usr/bin/fightplanner"
}
