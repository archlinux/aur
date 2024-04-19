# Maintainer: Alan Sartorio

pkgname=tela-icon-theme-bin
pkgver=2024.04.05
pkgrel=1
options=(!strip)
arch=("any")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('wget' 'curl')
license=('GPL3')

src_file=$pkgname-$pkgver.tar.xz
file_id=1712349233
file_size=2971828
project_id=1279924

url="https://www.pling.com/p/$project_id/"

prepare() {
	# Using pling site for downloading the built icon theme
	# (the github release does not contain the built files)
	ocs_url=$(curl \
		'https://www.pling.com/dl?file_id='"$file_id"'&file_type=application/x-xz&file_name=01-Tela.tar.xz&file_size='"$file_size"'&has_torrent=0&project_id='"$project_id"'&link_type=install&is_external=false&external_link=null'\
		-X POST -H 'User-Agent: Mozilla/5.0'\
		| sed -rn 's|.*href="(ocs://install.+Tela.tar.xz)".*|\1|p'\
		| head -n1)
	function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
	url=$(urldecode $(sed -rn 's|^ocs://.+url=(http.+)&type=.+$|\1|p'<<<"$ocs_url"))
	wget -O "$src_file" "$url"
	checksum="89980edc4e0ca87a6c2629b316a635cb"
	[ "$checksum" = "$(md5sum $src_file | awk '{print $1}')" ] \
		|| return 1
}

package() {
	echo "Extracting package"
	target=$pkgdir/usr/share/icons/
	mkdir -p $target
	tar -xf "$src_file" -C "$target"
}
