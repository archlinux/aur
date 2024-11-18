# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: JinguTech <xiuluo dot android at gmail dot com>
# Contributor: Alkindi42

_electronversion=32
pkgname=joplin-beta
pkgver=3.2.3
pkgrel=1
pkgdesc="A note taking and to-do application with synchronization capabilities (beta version)"
arch=("any")
url="https://joplinapp.org/"
license=("MIT")
depends=("electron${_electronversion}" "gtk3" "libexif" "libgsf" "libjpeg-turbo" "libwebp" "libxss"
	"nss" "orc" "rsync" "libvips")
optdepends=("libappindicator-gtk3: for tray icon")
makedepends=(
	"git" "yarn" "npm" "python" "python-setuptools"
	# Fails to build with the latest nodejs version
	"nodejs-lts-iron"
)
conflicts=('joplin' 'joplin-desktop' 'joplin-appimage')
source=("joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz"
        "joplin.desktop"
        "joplin-desktop.sh")
sha256sums=('8704d7c5df731a8ca627f18efa9b4b115e6ae427b7e6c10e65a8276584fffd89'
            '9e26cd5f41d08c3c2804cf4f34cb867090371423ccbe250a890fac006d405deb'
            'bd8324d35faaf6815217d1cf31a0b5e4df80692b0312ad17aea20d51f95efd56')

prepare() {
	sed -i "s|@electronversion@|${_electronversion}|" joplin-desktop.sh
}

build() {
	cd "${srcdir}/joplin-${pkgver}"

	export SHARP_IGNORE_GLOBAL_LIBVIPS=1
	export YARN_ENABLE_INLINE_BUILDS=1

	yarn workspace @joplin/app-desktop install
	yarn workspace @joplin/app-desktop dist --linux --publish=never
}

package() {
	cd "${srcdir}/joplin-${pkgver}/packages/app-desktop/dist/linux-unpacked/resources"

	install -Dm644 app.asar -t "${pkgdir}/usr/lib/joplin"
	cp -r build "${pkgdir}/usr/lib/joplin/"

	for i in 16 32 128 256 512 1024; do
		install -Dm644 build/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/joplin.png"
	done

	install -Dm755 "${srcdir}/joplin-desktop.sh" "${pkgdir}/usr/bin/joplin-desktop"
	install -Dm644 "${srcdir}/joplin.desktop" -t "${pkgdir}/usr/share/applications"
}
