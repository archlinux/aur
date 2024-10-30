pkgname=typora-with-plugin
_pkgname=typora
_pluginame=typora_plugin
typora_ver=1.9.3
typora_plugin_ver=1.11.13
pkgver=${typora_ver}_plugin_${typora_plugin_ver}
pkgrel=1
pkgdesc="一款 Markdown 编辑器和阅读器（with typora_plugin）"
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typoraio.cn/"
depends=('gtk3' 'nss' 'alsa-lib')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
backups=(
    'usr/share/typora/resources/plugin/global/settings/custom_plugin.user.toml'
    'usr/share/typora/resources/plugin/global/settings/hotkey.user.toml'
    'usr/share/typora/resources/plugin/global/settings/settings.user.toml'
    )
_filename="${_pkgname}_${typora_ver}_amd64.deb"
_pluginfilename="${_pluginame}-${typora_plugin_ver}"
source=(
    "https://download2.typoraio.cn/linux/$_filename"
    "$_pkgname.sh"
    "https://gh.api.99988866.xyz/https://github.com/obgnail/typora_plugin/archive/refs/tags/${typora_plugin_ver}.tar.gz")

typora_sum=da7714d8a2ef228d1df13bf2a6862f3be3fad51238657e8ee48350380267ecfed29b391e0c66653e3b4322e3dada02d2bea6e1041f5230988358645ea0cf4b28
typora_plugin_sum=39eef043b280dee0711cd25b0607f7a49005f72ad309d820335cb566d7dbfe1efb0f3cfb88ef96e867dac27e860de1fafb4f2368c21ca942a5e5c9a3bfdf31d1
sha512sums=(
    $typora_sum
    'de9c883c63f3ea35bd551c8761e605f8e1a3468943e000abcbf94bb0c5cbb5f0f6c7fa4d49ab39c177f167e0e3d0b061c861bf828627b4a34f7f1589119c3d04'
    $typora_plugin_sum
)

_patch_plugin() {
  tar xvf ${typora_plugin_ver}.tar.gz -C "$pkgdir/"
  mv $pkgdir/$_pluginfilename/plugin $pkgdir/usr/share/typora/resources/
  rm -rf $pkgdir/${_pluginfilename}
  sed -i 's@\(frame.js" defer="defer"></script>\)@\1<script src="./plugin/index.js" defer="defer"></script>@g' $pkgdir/usr/share/typora/resources/window.html
}

package() {
	export LC_ALL=en_US.UTF-8
	# unpack archive
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	_patch_plugin
	# remove lintian overrides
	rm -rf "$pkgdir/usr/share/lintian/"
	# replace bin link with custom launch script
	rm -rf "$pkgdir/usr/bin/$_pkgname"
	install -m755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	# move license to correct path
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	# delete previous copyright path
	rm "$pkgdir/usr/share/doc/$_pkgname/copyright"
	# delete doc dir if empty
	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/doc"
	# remove change log from application comment
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	# fix permissions
	find "$pkgdir" -type d -exec chmod 755 {} \;
	# activation
	resources_dir=$pkgdir/usr/share/typora/resources
	pd_dir=$resources_dir/page-dist
	js_file=$pd_dir/static/js/LicenseIndex.180dd4c7.4da8909c.chunk.js
	sed -i 's/e.hasActivated="true"==e.hasActivated/e.hasActivated="true"=="true"/g' "$js_file"
	# remove activation window
	license_html=$pd_dir/license.html
	sed -i 's%</body></html>%</body><script>window.onload=function(){setTimeout(()=>{window.close();},5);}</script></html>%g' "$license_html"
	# change unredistered notification
	pannel_file=$resources_dir/locales/zh-Hans.lproj/Panel.json
	sed -i 's/"UNREGISTERED":"未激活"/"UNREGISTERED":"已激活"/g' "$pannel_file"
	#get permissions of user setting files
	chmod 777 $resources_dir/plugin/global/settings/*.user.toml 
}
