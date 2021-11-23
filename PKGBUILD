pkgname=tela-icon-theme-bin
pkgver=2021.11.04
pkgrel=1
arch=(x86_64)

src_file=$pkgname-$pkgver.tar.xz

prepare() {
	ocs_url=$(curl \
		'https://www.pling.com/dl?file_id=1636035714&file_name=01-Tela.tar.xz&file_type=application/x-xz&file_size=2704272&has_torrent=undefined&project_id=1279924&link_type=install&is_external=false&external_link=null'\
		-X POST -H 'User-Agent: Mozilla/5.0'\
		| sed -rn 's|.*href="(ocs://install.+Tela.tar.xz)".*|\1|p'\
		| head -n1)
	function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
	url=$(urldecode $(sed -rn 's|^ocs://.+url=(http.+)&type=.+$|\1|p'<<<"$ocs_url"))
	wget -O "$src_file" "$url"
	checksum="dc0011b3cf264cd709040db72f016280"
	[ "$checksum" = "$(md5sum $src_file | awk '{print $1}')" ] \
		|| return 1
}

package() {
	echo "Extracting package"
	target=$pkgdir/usr/share/icons/
	mkdir -p $target
	tar -xf "$src_file" -C "$target"
}
