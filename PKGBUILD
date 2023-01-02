# Maintainer: Helloagain <nospamming11+arch at gmail dot com>

pkgname=fakturama
pkgver=2.1.3.b
pkgrel=1
pkgdesc="Creates invoices with ZUGFeRD / XRechnung support"
arch=('x86_64')
url="https://www.fakturama.info"
license=('EPL')
groups=()
depends=(
	'java-runtime>=11'
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
	"$pkgname-$pkgver.tar.gz::https://files.fakturama.info/release/v2.1.3b/Installer_Fakturama_linux_x64_2.1.3b.tar.gz"
	"fakturama2.desktop"
	"fakturama2-clean.desktop" # version with "-clean" flag
)
noextract=()
sha256sums=(
	"74065c3f97cfa2dd2c5da33f0a16291533039c55130aa48915a2f6babb770aca"
	"550964ece2b39f76e4985ecc2203fee63f57ef669d8b1ae170d80b3cfa5cb54c"
	"96ac2d3815e37f993ea92c0598c5b4350d69e57f0c415bde7dafbecfe1e4e407"
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

	# Copy other files
	install -Dm 644 "$srcdir/icon.xpm" "$pkgdir/usr/share/pixmaps/fakturama2.xpm"
	install -Dm 644 "$srcdir/fakturama2.desktop" "$pkgdir/usr/share/applications/fakturama2.desktop"
	install -Dm 644 "$srcdir/fakturama2-clean.desktop" "$pkgdir/usr/share/applications/fakturama2-clean.desktop"

	# create symlink for binar
  mkdir -p "$_bin_dir"
	ln -s "$_rooted_application/Fakturama" "$_bin_dir"
}
