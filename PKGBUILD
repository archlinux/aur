# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.11.5
_pkgver_x86_64="$_typora_ver"
_pkgver_aarch64="$_typora_ver"
_plugin_ver=1.15.11
pkgver=${_typora_ver}+plugin+${_plugin_ver}
pkgrel=5
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
    '9774ecf6f0b4fcdde1a79339b613d5ad98a386e8a2ad0fd1a926c5f51235e9eae42327dd075f2427dd971f949c1a2ed8d42c0169970aace6b9ccb597cf643559')
sha512sums_x86_64=('e9ec473aca25a7a42a5a1ca0268a66dadda0966d4b969069197c42924a216f98707a9cf3325a502b3164a8d24846de64f3cdbc103ea947eb98d5a7c737ad4bfb')
sha512sums_aarch64=('f424a1ba555e8b79d61478e9cfa703ad54fb6466581e1c2483695ea395b7fd16002c7b4714b9ba9e62cce5d5ad76d6a9c709bfe0cd9264df369ebb25bb91ab37')

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
