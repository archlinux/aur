# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.13.4
_pkgver_x86_64="$_typora_ver"
_pkgver_aarch64="$_typora_ver"
_plugin_ver=1.17.8
pkgver=${_typora_ver}+plugin+${_plugin_ver}
pkgrel=1
pkgdesc="A minimal markdown editor and reader. with obgnail/typora_plugin plugin."
arch=('x86_64' 'aarch64')
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
    "$_pkgname.sh"
    "https://github.com/obgnail/typora_plugin/releases/download/${_plugin_ver}/typora-plugin@v${_plugin_ver}.zip")
_urlbase="https://download.typora.io/linux/typora_"
source_x86_64=("${_urlbase}${_pkgver_x86_64}_amd64.deb")
source_aarch64=("${_urlbase}${_pkgver_aarch64}_arm64.deb")
sha512sums=(
    '108cb69c5ada4e06dcd9995f4c45f9e5566a4ac41002af1d7cc22ecdc54f1186e43920019e54657be8b91b132dd60919241e135560d3d85d60f9618f4112095c'
    'b38264ccad23e260de1673e7617517920a9ecb4064f4a6ac7caa54c3b1e4ac8df7d68def2a1d7b96000a4abd50d36cbf8a2f64c34783c42c312a4b0630646620')
sha512sums_x86_64=('5471ee6e18482b1ec25b259cdb1926252715db75175e08c506deaad0baf1ee833b9cfd7f1225acad3e0e8db350b154b300e78107d4b634ee31fb183f0b96a520')
sha512sums_aarch64=('d889c9beb726f5bd46b588800b32cc64224259fc3412df758dd4f225b0b87bad057927bebf14651ed20b939df81e8ebd266ea36d89b32a0868ef704a766236dc')

_patch_plugin() {
  cp -r $srcdir/plugin $pkgdir/usr/share/typora/resources/
  cd $pkgdir/usr/share/typora/resources/plugin/bin/
  bash install_linux.sh

  chmod 755 "$pkgdir/usr/share/typora/resources/plugin/bin/typora-plugin.sh"
  chmod 755 "$pkgdir/usr/share/typora/resources/plugin/bin/move_settings_files.sh"
}

package() {
	export LC_ALL=en_US.UTF-8
	# unpack archive
	if [[ "$CARCH" == "x86_64" ]]; then
		bsdtar -xf data.tar.zst -C "$pkgdir/"
	elif [[ "$CARCH" == "aarch64" ]]; then
		bsdtar -xf data.tar.xz -C "$pkgdir/"
	fi
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
	chmod 644 "$pkgdir/usr/share/applications/typora.desktop"
	chmod 644 "$pkgdir/usr/share/typora/resources/packages/node-spellchecker/vendor/hunspell_dictionaries/en_US.dic"
	chmod 644 "$pkgdir/usr/share/typora/resources/packages/node-spellchecker/vendor/hunspell_dictionaries/en_US.aff"
	find "$pkgdir" -type d -exec chmod 755 {} \;
}
