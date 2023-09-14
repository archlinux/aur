# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.7.4
_plugin_ver=1.3.17
pkgver=${_typora_ver}+plugin+${_plugin_ver}
pkgrel=1
pkgdesc="A minimal markdown editor and reader. with obgnail/typora_plugin plugin"
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
    '3f2a543c17c72b4cd911be1b542599cff5a68b80bbd88868f54d6f5bf94c420ea5791c30ba85d74b780268fc84cdeacfb643b2358981a541d4a608698bbae8b3'
    'ee07a2cc6237cf0c36c9c7eafb314023f08d5c06e9b49c15e866fbc3044a6fe51b550e97d35e295fa076fb9b7549546c1dafc7f12feb73cc34f7aafb73c62d77')

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
