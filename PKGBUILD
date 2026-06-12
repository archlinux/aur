# Maintainer: Helloagain <nospamming11+arch at gmail dot com>

pkgname=fakturama
pkgver=2.2.0
pkgrel=1
pkgdesc="Creates invoices with ZUGFeRD / XRechnung support"
arch=('x86_64')
url="https://www.fakturama.info"
license=('EPL')
groups=()
depends=(
	'java-runtime>=17'
	'webkit2gtk'
)
makedepends=()
checkdepends=()
optdepends=(
	'libreoffice-fresh'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::https://files.fakturama.info/release/v2.2.0/Installer_Fakturama_linux-x86_64_2.2.0.tar.gz"
	"fakturama2.desktop"
	"fakturama2-clean.desktop" # version with "-clean" flag
	"startup_script"
)
noextract=()
sha256sums=(
	"8630cc972b9514bbe034000bf8af1c7b4a63583fda9037bc4b2d2a1f3ba66fcc"
	"ad52a6adf49602c7a1ed0d7e90c142fe7d4c802ff223ac2de33ef5521feae795"
	"2a2c3fda3a2c4275e112bf6c6963d76d26bcf99c75f21028ac8d7d2b012c4dd7"
	"d39c1a14e9399070b51569f43063716dd3ef166ca946c0e6a3af47b1dde44504"
)

prepare() {
	cd $srcdir
	# Copied from linux PKGBUILD as an easy way to apply all *.patch files
	local src
	for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
	done
}

package() {
	# Get prefixed application directory
	_bin_dir="$pkgdir/usr/bin"
	_rooted_application="/usr/share/${pkgname}2"
	_main_application="$pkgdir$_rooted_application"

	# Create entry under _main_application
	install -m 755 -d "$_main_application"

	# Copy all needed files
	cp -r "$srcdir/artifacts.xml" "$_main_application"
	cp -r "$srcdir/configuration" "$_main_application"
	cp -r "$srcdir/Fakturama" "$_main_application"
	cp -r "$srcdir/Fakturama.ini" "$_main_application"
	cp -r "$srcdir/features" "$_main_application"
	cp -r "$srcdir/p2" "$_main_application"
	cp -r "$srcdir/plugins" "$_main_application"

	# copy startup_script
	install -Dm 755 "$srcdir/startup_script" "$_main_application/startup_script"

	# Copy other files
	install -Dm 644 "$srcdir/icon.xpm" "$pkgdir/usr/share/pixmaps/fakturama2.xpm"
	install -Dm 644 "$srcdir/fakturama2.desktop" "$pkgdir/usr/share/applications/fakturama2.desktop"
	install -Dm 644 "$srcdir/fakturama2-clean.desktop" "$pkgdir/usr/share/applications/fakturama2-clean.desktop"

	# create symlink for binary
  mkdir -p "$_bin_dir"
	ln -s "$_rooted_application/Fakturama" "$_bin_dir"
}
