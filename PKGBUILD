# Maintainer: Andreas Muttscheller <firstname.lastname at gmail dot com>

pkgname=merge-request-notifier
pkgver=1.7.0
pkgrel=2
pkgdesc="This app shows your merge requests grouped by projects and WIP status. It is accessible from the system tray."
arch=('x86_64')
license=('MIT')
makedepends=('nodejs' 'yarn')
url='https://github.com/codecentric/merge-request-notifier'
source=("git+https://github.com/codecentric/merge-request-notifier.git"
	"merge-request-notifier.desktop")
sha256sums=('SKIP'
	'8d74ce91de6352aeb82d7d81ddafc8b730ce831804f55fa724de2174095d0ce6')

prepare() {
        cd "${srcdir}/${pkgname}"
	git checkout v${pkgver}
}

package() {
	# Install desktop entry
	install -Dm644 merge-request-notifier.desktop "${pkgdir}/usr/share/applications/merge-request-notifier.desktop"

	# Go to source files
        cd "${srcdir}/${pkgname}"

	# Prepare directory structure
        mkdir -p "${pkgdir}/opt/merge-request-notifier"
        mkdir -p "${pkgdir}/usr/bin"

	# Build application
	yarn install
	yarn build
	yarn package --dir

	# Copy build artifacts to package
	cp -R release/linux-unpacked/* "${pkgdir}/opt/merge-request-notifier"

	# Link binary so that it is executable from $PATH
	ln -sf /opt/merge-request-notifier/merge-request-notifier "${pkgdir}/usr/bin/merge-request-notifier"

	# Install icon and license
	install -Dm644 build/icon.png "${pkgdir}/usr/share/icons/hicolor/0x0/apps/merge-request-notifier.png"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Fix permissions
	chmod -R go-w "${pkgdir}"
}

