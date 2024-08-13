# Maintainer: su226 <thesu226 at dot outlook.com>

pkgname=ftb-app
pkgver=1.25.18
pkgrel=1
epoch=
pkgdesc="A new Modpack launcher for FTB and Curse modpacks."
arch=(any)
url="https://feed-the-beast.com/ftb-app"
license=("LGPL-2.1-only")
groups=()
_electron=electron28
depends=("$_electron")
makedepends=(git pnpm java-environment)
checkdepends=()
# FTB App will download Adoptium for itself and Minecraft, althrough system Java can be used for Minecraft too.
optdepends=("java-runtime: Playing Minecraft with system Java.")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# Use source tarball will cause Gradle plugin com.palantir.git-version to fail
source=("git+https://github.com/FTBTeam/FTB-App.git#tag=v$pkgver"
        "ftb-app.sh"
        "ftb-app.desktop")
noextract=()
sha256sums=(SKIP
            dca73a9ed949a5623de73ac80450ae8a532cd50195fde7c849852837541c0e8e
            26bcc8821bf053371e4da468ebd8d0a3d6ef1126baf8f17f0d894d77d0b8959f)
validpgpkeys=()

prepare() {
	cd "$srcdir/FTB-App"
	# Let renderer process detect meta.json properly when using system Electron. (ftb-app.sh sets FTB_APP_PATH)
	sed -i 's#process.resourcesPath#global.process.env["FTB_APP_PATH"] || process.resourcesPath#' src/utils/interface/electron.ts
	# Passing -c.electronDist=... -c.electronVersion=... cause errors, modify config instead.
	local _electronDist="/usr/lib/$_electron"
	local _electronVersion="$(<$_electronDist/version)"
	sed -e "s/'dir', 'AppImage', 'deb', 'rpm'/'dir'/" -e "/builderOptions: {/a electronDist: \"$_electronDist\", electronVersion: \"$_electronVersion\"," -i vue.config.js
	pnpm install
}

build() {
	cd "$srcdir/FTB-App/subprocess"
	# ./gradlew build run tests, we want tests run in check(), not build()
	./gradlew assemble writeLicenses writeVersion
	cd "$srcdir/FTB-App"
	pnpm gen:license
	pnpm build
}

check() {
	cd "$srcdir/FTB-App/subprocess"
	./gradlew check
	# FTB App currently only has backend tests.
	# cd "$srcdir/FTB-App"
	# pnpm test
}

package() {
	install -d "$pkgdir/usr/lib/ftb-app"
	cp -rT "$srcdir/FTB-App/release/linux-unpacked/resources" "$pkgdir/usr/lib/ftb-app"
	sed "s#%electron%#$_electron#" "$srcdir/ftb-app.sh" > "$pkgdir/usr/lib/ftb-app/ftb-app"
	chmod 755 "$pkgdir/usr/lib/ftb-app/ftb-app"

	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/ftb-app/ftb-app" "$pkgdir/usr/bin/ftb-app"

	install -Dm644 "$srcdir/ftb-app.desktop" "$pkgdir/usr/share/applications/ftb-app.desktop"
	for _icon in FTB-App/resources/icons/*.png; do
		install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$(basename -s .png $_icon)/apps/ftb-app.png"
	done
}
