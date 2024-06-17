# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.8.10
_plugin_ver=1.9.4
pkgver=${_typora_ver}+plugin+${_plugin_ver}
pkgrel=1
pkgdesc="A minimal markdown editor and reader. with obgnail/typora_plugin plugin."
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
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
_filename="${_pkgname}_${_typora_ver}_amd64.deb"
source=(
    "https://typora.io/linux/$_filename"
    "$_pkgname.sh"
    "https://github.com/obgnail/typora_plugin/archive/refs/tags/${_plugin_ver}.tar.gz")
sha512sums=(
    '6560774e283129fa556a916d412903893388194625472062a36dd84d771ae261974b0c6a3b4642b081e8e19a7bb9477720e00f39efa4934aa8301001127e69a6'
    'de9c883c63f3ea35bd551c8761e605f8e1a3468943e000abcbf94bb0c5cbb5f0f6c7fa4d49ab39c177f167e0e3d0b061c861bf828627b4a34f7f1589119c3d04'
    '027329b78e2236ac14c39adf644ffeb2ae4dda1c3eb801c2090d77f401a32067a89551895af8567ac3721ca79174dbb916ced4d9075902bc093e1b0ef8292b87')

_patch_plugin() {
  tar xvf ${_plugin_ver}.tar.gz -C "$pkgdir/"
  mv $pkgdir/typora_plugin-${_plugin_ver}/plugin $pkgdir/usr/share/typora/resources/
  rm -rf $pkgdir/typora_plugin-${_plugin_ver}
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
}
