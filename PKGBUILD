# Maintainer: Kimiblock Moe

pkgname=wechat
pkgver=8
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
)


md5sums=('9c3cb3a6d31a6c28ae9766c0f5170026'
         '9725e5bc610df89fb31b80ceae614304')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/portable/info/com.qq.weixin/config"
	install -d "${pkgdir}/usr/bin"
	echo '''#!/usr/bin/bash
export _portableConfig="com.qq.weixin"
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

