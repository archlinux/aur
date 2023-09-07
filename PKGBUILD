# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
pkgver=1.7.3
plugin_ver=1.3.11
pkgrel=1
pkgdesc="A minimal markdown editor and reader. with obgnail/typora_plugin plugin"
arch=('x86_64')
# license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
depends=('gtk3' 'nss' 'alsa-lib')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
_filename="${pkgname}_${pkgver}_amd64.deb"
source=(
    "https://typora.io/linux/$_filename"
    "https://github.com/obgnail/typora_plugin/archive/refs/tags/${plugin_ver}.tar.gz")
sha512sums=(
    'c41eca310eedfa94013cbbb02617cbf36f18c03c226122b552983c10c11fdd80e1e70f1af7d29a16607c3baf6b62f656eee4213a3656ffda26c1e3a45ebcf9d9'
    '39ec8007fffbbf57a71359009e9fb5e3c4de007167c4f5a24d78206ee695e5ffc329a38ace1ac264b402b3f8df8ade8ce21edc506fc942b43b08c906c2aa5644')

_patch_plugin() {
  tar xvf ${plugin_ver}.tar.gz -C "$pkgdir/"
  mv $pkgdir/typora_plugin-${plugin_ver}/plugin $pkgdir/usr/share/typora/resources/
  rm -rf $pkgdir/typora_plugin-${plugin_ver}
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
	install -Dm644 "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# delete previous copyright path
	rm "$pkgdir/usr/share/doc/$pkgname/copyright"
	# delete doc dir if empty
	rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/doc"
	# remove change log from application comment
	sed -i '/Change Log/d' "$pkgdir/usr/share/applications/typora.desktop"
	# fix dir permissions
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
