# Maintainer: dosenpils <dosenpils at donotdevelopmyapp dot com>
# Contributor: Alfredo Palhares <alfredo at palhares dot me>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Matteo Parolari
# Contributor: gardar <aur@gardar.net>

_electron=electron32
_node=18
pkgname=('joplin')
pkgver=3.2.13
pkgrel=1
pkgdesc="A note taking and to-do application with synchronization capabilities"
arch=("x86_64")
url="https://joplinapp.org/"
license=("AGPL-3.0-or-later")
depends=("${_electron}")
makedepends=(
	"git" "yarn" "npm" "python" "python-setuptools" "rsync" "jq" "moreutils" "nvm"
)
conflicts=('joplin-appimage' 'joplin-beta' 'joplin-electron' 'joplin-beta-appimage')
source=("joplin-${pkgver}.tar.gz::https://github.com/laurent22/joplin/archive/v${pkgver}.tar.gz"
        "joplin.desktop"
        "joplin-desktop.sh")
sha256sums=('3280f29a8f7955f0d09540aac7fb55c01e43b8d2e8c20fe717a6eb88b25c73a3'
            '9e26cd5f41d08c3c2804cf4f34cb867090371423ccbe250a890fac006d405deb'
            'a4d29f005a1f6ff112adb1dd64fd366d1b08ee0a469290126313d87a6be0cf2a')

prepare() {
	sed -i "s|@electron@|${_electron}|" joplin-desktop.sh

	cd "${srcdir}/joplin-${pkgver}/packages/app-desktop"

	set -o pipefail
	# Disable the after build script since the AppImage is not being built
	jq 'del(.build.afterAllArtifactBuild)' package.json | sponge package.json
	# Disable building asar archive
	jq '.build.asar = false' package.json | sponge package.json
}

build() {
	cd "${srcdir}/joplin-${pkgver}"

	export SHARP_IGNORE_GLOBAL_LIBVIPS=1
	export YARN_ENABLE_INLINE_BUILDS=1

	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_node}"
	nvm use "${_node}"

	yarn workspace @joplin/app-desktop install
	yarn workspace @joplin/app-desktop dist --linux --publish=never --dir \
		-c.electronDist=/usr/lib/${_electron} \
		-c.electronVersion=$(cat /usr/lib/${_electron}/version)
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
