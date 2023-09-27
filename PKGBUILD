# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.7.5
_plugin_ver=1.4.15
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
_filename="${_pkgname}_${_typora_ver}_amd64.deb"
source=(
    "https://typora.io/linux/$_filename"
    "https://github.com/obgnail/typora_plugin/archive/refs/tags/${_plugin_ver}.tar.gz")
sha512sums=(
    '35627c94a4f3d11952b3c35d8818832db7ebaf6d3fe534fbdf3f07b67f90ed11b8a128a80a1e898c128a4a568196ee6501eb2e3075a2668a35438903d35b17cb'
    '1dc167964305d1bbcbefc6ca5618d0a03a93229eae7db1eaa8712d88428fbf44e6f6f9a2499021a69e3d770f56b6d220b390eaa25869b5c716e731893914402c')

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
	# move license to correct path
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	# delete previous copyright path
	rm "$pkgdir/usr/share/doc/$_pkgname/copyright"
	# delete doc dir if empty
	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/doc"
	# remove change log from application comment
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	# fix dir permissions
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
