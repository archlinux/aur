# Maintainer: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-plugin
_pkgname=typora
_typora_ver=1.10.8
_pkgver_x86_64="$_typora_ver"
_pkgver_aarch64="$_typora_ver"
_plugin_ver=1.15.9
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
    'da1a2b41f4e5c38c5ba686e458a9bdb0ff0a590d67d3ad44a0546a58b94f1294fe9bc8d58813322bf331edd207e2ac50775dcb87e005c3f1f0c0050b5b3fa92a')
sha512sums_x86_64=('dc08b3077388a9168854da0306b32d3153bda6df25c6aa21c061adc6cc8447a42e4368ddcc5ec24cb8b5906cb5342d096ff8efa550e8cd2eeed3683c3fcfb466')
sha512sums_aarch64=('8fe1e248820516b3a6067e71aa3f811d59b7f95658674d6d3777fff4886c80b9404fca737465176b3e38c7623d85221e16f060ec2bbfbf764a17d9142c60ef5e')

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
