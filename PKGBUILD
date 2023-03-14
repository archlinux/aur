# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.3.3
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade_x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade_aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade_armv7h-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('04d958508bfe975ca71863d13dd9cd733d707ff2154c918553700178062c55f801631c4f1ce82776826e6bfe3bcb2ebad8c8bcab9cccc3757bfdab462fd5bc78')
b2sums_aarch64=('96c34b2da0a97451e0d090065b20567a3b1ddc2fd3d38c49d979d155364f9fdc33e978d999fc007093815a35fe3cb6e0e644e49c93c898a35d0e7661ca71e826')
b2sums_armv7h=('97e2d84180cf6a2910c3b46d905777f48c849f5386d7dba386fd71d0116eb6b6e0b3cd85dc6db00d54b2d799cde40098e227a7070f91df5ce5be084835086f27')
package() {
	# disable self-update as it won't work
	echo '#!/bin/sh'$'\n\n''TOPGRADE_NO_SELF_UPGRADE=true /opt/topgrade/topgrade "$@"' >topgrade-sh
	# install binary
	install -Dm755 ./topgrade "$pkgdir/opt/topgrade/topgrade"
	install -Dm755 ./topgrade-sh "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/man/man8/topgrade.8"
	# completions
	if $(command -v fish &>/dev/null); then
		./topgrade --gen-completion fish >topgrade.fish
		install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	fi
	if $(command -v bash &>/dev/null); then
		./topgrade --gen-completion bash >topgrade.bash
		install -Dm644 ./topgrade.bash "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &>/dev/null); then
		./topgrade --gen-completion zsh >topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
}
