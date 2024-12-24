# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: JinguTech <xiuluo dot android at gmail dot com>
# Contributor: Alkindi42

_electronversion=32
pkgname=joplin-beta
pkgver=3.2.6
pkgrel=3
pkgdesc="A note taking and to-do application with synchronization capabilities (beta version)"
arch=("x86_64")
url="https://joplinapp.org/"
license=("AGPL-3.0-or-later")
depends=("electron${_electronversion}" "gtk3" "libexif" "libgsf" "libjpeg-turbo" "libwebp" "libxss"
	"nss" "orc" "rsync" "libvips")
optdepends=("libappindicator-gtk3: for tray icon")
makedepends=(
	"git" "yarn" "npm" "python" "python-setuptools" "jq"
	# Fails to build with the latest nodejs version
	"nodejs-lts-iron"
)
conflicts=('joplin' 'joplin-desktop' 'joplin-appimage')
source=("joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz"
        "joplin.desktop"
        "joplin-desktop.sh")
sha256sums=('9c8f442596462407902cdd503bc59a7af81af1e04b8fb0de14e7138e504479cc'
            '9e26cd5f41d08c3c2804cf4f34cb867090371423ccbe250a890fac006d405deb'
            'ac075c916959ded879fc282a08cd8833e1286e7b8c83c4a16c61781878d23110')

prepare() {
	sed -i "s|@electronversion@|${_electronversion}|" joplin-desktop.sh

	cd "${srcdir}/joplin-${pkgver}/packages/app-desktop"
	# Disable the after build script since the AppImage is not being built
	pkg_json=$(jq 'del(.build.afterAllArtifactBuild)' package.json)
	# Disable building asar archive
	pkg_json=$(jq '.build.asar = false' <<<${pkg_json})
	cat > package.json <<<${pkg_json}
}

build() {
	cd "${srcdir}/joplin-${pkgver}"

	export SHARP_IGNORE_GLOBAL_LIBVIPS=1
	export YARN_ENABLE_INLINE_BUILDS=1

	yarn workspace @joplin/app-desktop install
	yarn workspace @joplin/app-desktop dist --linux --publish=never --dir \
		-c.electronDist=/usr/lib/electron${_electronversion} \
		-c.electronVersion=$(cat /usr/lib/electron${_electronversion}/version)
}

package() {
	cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/linux-unpacked/resources"

	install -d "${pkgdir}/usr/lib/joplin"
	cp -dr --no-preserve='ownership' app "${pkgdir}/usr/lib/joplin/"
	cp -dr --no-preserve='ownership' build "${pkgdir}/usr/lib/joplin/"

	for i in 16 32 128 256 512 1024; do
		install -Dm644 build/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/joplin.png"
	done

	install -Dm755 "${srcdir}/joplin-desktop.sh" "${pkgdir}/usr/bin/joplin-desktop"
	install -Dm644 "${srcdir}/joplin.desktop" -t "${pkgdir}/usr/share/applications"
}
