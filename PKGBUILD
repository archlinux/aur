# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=azardi
pkgver=43.1
pkgrel=2
arch=("x86_64" "i686")
url="http://azardi.infogridpacific.com/"
pkgdesc="The AZARDI book reader by Infogrid Pacific Pte Ltd."
if [ "$CARCH" = "x86_64" ]; then
	_arch_file_name="amd64"
	_azardi_deb_hash="3e4ac185f3a975f9ab335e3fe5fa86d693e61af50aba4b3024f06b1c021e119a03728a2b2dbfe1fece394fb4062daed8f4925b25dc18a607762e9360963895de"
fi
if [ "$CARCH" = "i686" ]; then
	_arch_file_name="i386"
	_azardi_deb_hash="dcc4e5d025dfd4b508d4dd48261cf391839efee99f0b296d01d45a48193256a1cfad44f98e05c31880d11f41f6b0865cb8505c76d2e8f431744e8578f3c09586"
fi
sha512sums=("$_azardi_deb_hash"
	"bee8db7a3f93387c6a529db26aa9a5351568d72aa6bc64d8b6ce061bfeaf6a7c73bfacb4b1cb63ca6d6924a83e49e6687f4e42fcacaab2eb845582df6ba280ea")
_deb_file_name="AZARDI_${pkgver}_20160728_$_arch_file_name"
source=("https://azardi-download.s3.amazonaws.com/$_deb_file_name.deb"
	"license.html::http://azardi.infogridpacific.com/azardi-license.html")
license=("custom:azardi")
install="_.install"
_src_bin_dir="pkg"
build() {
	cd "$srcdir"
	FILE_NAME=$(find . -name "data.*")
	mkdir --parents "$_src_bin_dir"
	tar --extract --auto-compress "--file=$FILE_NAME" -C "$_src_bin_dir"
	sed -i "s/Categories=Application;/Categories=Office;Viewer;/" "$_src_bin_dir/usr/share/applications/AZARDI.desktop"
}
package() {
	cp -r "$srcdir/$_src_bin_dir"/* "$pkgdir"
	# /opt/infogridpacific/azardi/LICENSE is the Mozilla license. WTF?
	install --mode=0644 -D "--target-directory=$pkgdir/usr/share/licenses/$pkgname" "$srcdir/license.html"
}
