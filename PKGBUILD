# Maintainer: Kimiblock Moe

pkgname=wechat
pkgver=13
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


md5sums=('6e5d2bd14439b5d1bd8c8e6e0fab7850'
         'f32488c56b43ca5eb0ee77d77f0f8e52'
         '7a96469d12e220738fb95580fd5837f7')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/portable/info/com.qq.weixin/config"
	install -Dm644 config.toml \
		"${pkgdir}/usr/lib/portable/info/com.qq.weixin/config.toml"
	install -d "${pkgdir}/usr/bin"
	echo '''#!/usr/bin/bash
export _portableConfig="com.qq.weixin"
export PORTABLE_CONF="com.qq.weixin"
portable $@
''' >"${pkgdir}/usr/bin/wechat.sh"
	chmod 755 "${pkgdir}/usr/bin/wechat.sh"
	install -Dm644 \
		"${srcdir}/wechat.desktop" \
		"${pkgdir}/usr/share/applications/com.qq.weixin.desktop"
	install -d "${pkgdir}/usr/share/libalpm/hooks"
	
	echo '''[Action]
When = PostTransaction
Exec = /usr/bin/bash -c "rm /usr/share/applications/wechat.desktop && ln -srf /usr/bin/wechat.sh /usr/bin/wechat"
Depends = wechat
Description = Configuring WeChat

[Trigger]
Operation = Install
Operation = Upgrade
Type = Path
Target = usr/bin/wechat
Target = usr/share/applications/wechat.desktop
Target = usr/share/applications/com.qq.weixin.desktop''' >"${pkgdir}/usr/share/libalpm/hooks/wechat.hook"

}

