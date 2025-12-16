# Maintainer: Loek Le Blansch <loek dot le-blansch dot pv at renesas dot com>
pkgname=e2-studio-bin
pkgver=2025.12
pkgrel=1
epoch=1
pkgdesc="Eclipse-based IDE for Renesas MCUs"
arch=(x86_64)
url="https://www.renesas.com/en/software-tool/e-studio"
license=('custom')
depends=()
makedepends=()
optdepends=(arm-none-eabi-gcc)
provides=(e2-studio)
conflicts=(e2-studio)
options=(!strip !debug)
_installer="e2studio_installer-${pkgver/./-}_linux_host.run"
source=(
	"file:///$_installer"
	"e2-studio.desktop"
)
sha256sums=(
	'581dd4c52f1b51fd5b3199b3703890a3f840507b1d92133065504c678d286418'
	'722d40188bbbc7925aa7b264d79817548edbf0e3d01f8195eea2880bc60a1c95'
)

prepare() {
	cd "$srcdir"
	chmod +x "$_installer"
	"./$_installer" --nochown --noexec --noprogress --nox11 --target "$srcdir/installer"
}

package() {
	"$srcdir/installer/installer" \
		--launcher.suppressErrors \
		-noSplash \
		-install.silent \
		-install.Declipse.p2.default.renesas.skipDriverInstall=true \
		-install.Declipse.p2.default.createLauncherShortcuts=false \
		-install.Declipse.p2.default.defaultInstallLoc="$pkgdir/opt/renesas/e2_studio" \
		-install.Declipse.p2.location.data=/tmp/renesas

	# clean up log files to prevent makepkg warnings
	cd "$pkgdir/opt/renesas/e2_studio/uninstall/configuration"
	rm -f *.log

	# remove references to pkgdir
	sed -i "s#${pkgdir//#/\\#}##g" \
		"$pkgdir/opt/renesas/e2_studio/eclipse/e2studio.ini" \
		"$pkgdir/opt/renesas/e2_studio/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.artifact.repository.prefs"

	# custom .desktop file since the included one can't be installed in a custom directory
	install -Dm644 "$srcdir/e2-studio.desktop" "$pkgdir/usr/share/applications/e2-studio.desktop"
}

