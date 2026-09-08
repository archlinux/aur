# Maintainer: Kimiblock Moe

pkgname=wechat
pkgver=16
pkgrel=1
epoch=1
pkgdesc="Fixes and optional sandbox for WeChat."
arch=('any')
url="https://github.com/Kraftland/portable"
license=('GPL3')
groups=()
options=(!debug !strip)

makedepends+=()

provides+=(wechat-uos-bwrap wechat-uos-qt wechat-universal-bwrap wechat-bwrap wechat-portable wechat-beta-bwrap wechat-sandbox-provider wechat-bwrap)

replaces+=(wechat-bwrap)

depends=("wechat-bin" "portable")

optdepends=()

makedepends+=()

checkdepends=()

source=(
	portable-config
	wechat.desktop
	config.toml
)


md5sums=('530b90bc05c2d6ca8eb2d06ca486d934'
         'c802c85de14a1c521a36083aa46208bc'
         'fd9403b3b92dfb6a3c1a124272b45375')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/portable/info/com.tencent.wechat/config"
	install -Dm644 config.toml \
		"${pkgdir}/usr/lib/portable/info/com.tencent.wechat/config.toml"
	install -d "${pkgdir}/usr/bin"
	echo '''#!/usr/bin/bash
export _portableConfig="com.tencent.wechat"
export PORTABLE_CONF="com.tencent.wechat"
exec portable $@
''' >"${pkgdir}/usr/bin/wechat.sh"
	chmod 755 "${pkgdir}/usr/bin/wechat.sh"
	install -Dm644 \
		"${srcdir}/wechat.desktop" \
		"${pkgdir}/usr/share/applications/com.tencent.wechat.desktop"
	install -d "${pkgdir}/usr/share/libalpm/hooks"
	
	echo '''[Action]
When = PostTransaction
Exec = /usr/bin/bash -c "rm /usr/share/applications/wechat.desktop || true && ln -srf /usr/bin/wechat.sh /usr/bin/wechat"
Depends = wechat
Description = Configuring WeChat

[Trigger]
Operation = Install
Operation = Upgrade
Type = Path
Target = usr/bin/wechat
Target = usr/share/applications/wechat.desktop
Target = usr/share/applications/com.tencent.wechat.desktop''' >"${pkgdir}/usr/share/libalpm/hooks/wechat.hook"

}

