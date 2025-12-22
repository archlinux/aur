# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.12.4
_pkgver_x86_64="$_typora_ver"
_pkgver_aarch64="$_typora_ver"
_plugin_ver=1.16.2
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
    '8f3ec017bd4a4ae4c6ee732b3ce0dfed2d41efe5b2f03e5fb162d00ea7a2e8c3f8d4beea743fb407e9d202efe66a29c69b24609cdfdf0fee23b5fd96b82494fe')
sha512sums_x86_64=('f2504c5ab4c80a1b4927b5498a7d8cb15509b1485111a886add75db35984daf49485db49e0fce9ec251be76b08ddf0dc7fd1150de4b7ffd284f67db60905c47a')
sha512sums_aarch64=('1bc6808b574f0073856daf2471a592cbee374384a60c6cc8f11fed4a6a80eab7512343e86083f60b995c439b323dc1c82582576d611dcd07072e7cf6507aa7eb')

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
