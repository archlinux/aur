# Maintainer: Kimiblock Moe

pkgname=wechat
pkgver=6
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


md5sums=('296f2e5ffb6582f49f6c0d349998ea97'
         'cbefeb42addf418f0a7164391d308ebf')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/wechat/portable-config"
	install -d "${pkgdir}/usr/bin"
	echo '''#!/usr/bin/bash
export _portableConfig=/usr/lib/wechat/portable-config
portable $@
''' >"${pkgdir}/usr/bin/wechat.sh"
	chmod 755 "${pkgdir}/usr/bin/wechat.sh"
	install -Dm644 \
		"${srcdir}/wechat.desktop" \
		"${pkgdir}/usr/share/applications/com.qq.weixin.desktop"
	install -d "${pkgdir}/usr/share/libalpm/hooks"
	
	echo '''[Action]
When = PostTransaction
Exec = /usr/bin/ln "-sfr" "/dev/null" "/usr/share/applications/wechat.desktop"
Depends = wechat
Description = Configuring WeChat

[Trigger]
Operation = Install
Operation = Upgrade
Type = Path
Target = usr/bin/wechat
Target = usr/share/applications/wechat.desktop''' >"${pkgdir}/usr/share/libalpm/hooks/wechat.hook"

}

