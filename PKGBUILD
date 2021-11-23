pkgname=orchis-theme-bin
pkgver=2021.10.27
pkgrel=1
options=(!strip)
arch=('any')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('wget' 'curl')

src_file=$pkgname-$pkgver.tar.xz

prepare() {
	ocs_url=$(curl \
		'https://www.pling.com/dl?file_id=1635347414&file_name=Orchis.tar.xz&file_type=application/x-xz&file_size=176316&has_torrent=undefined&project_id=1357889&link_type=install&is_external=false&external_link=null'\
		-X POST -H 'User-Agent: Mozilla/5.0'\
		| sed -rn 's|.*href="(ocs://install.+\.tar\.xz)".*|\1|p'\
		| head -n1)
	function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
	url=$(urldecode $(sed -rn 's|^ocs://.+url=(http.+)&type=.+$|\1|p'<<<"$ocs_url"))
	wget -O "$src_file" "$url"
	checksum="42c5ca3284d1a1a010c85ca9ed7d77f7"
	[ "$checksum" = "$(md5sum $src_file | awk '{print $1}')" ] \
		|| return 1
}

package() {
	echo "Extracting package"
	target=$pkgdir/usr/share/themes/
	mkdir -p $target
	tar -xf "$src_file" -C "$target"
}
