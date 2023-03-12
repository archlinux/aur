# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.3.2
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade_x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade_aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade_armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('d852a826477489be8da9010f2519ca74d2f906fe2b4bf532e5722775fe3b6bc6d41e28068ac3b105ff307068b50df40327fec99ec2747ef9625b18be3a5aaf60')
b2sums_aarch64=('20976e837888d628e1fd6c0e229514b25882622344966aab6e8c7a5ce92215f9e4636d282d3df99eb904919dea267ab8b1aea5b063afdca97b3e0dce749fdbb8')
b2sums_armv7h=('fc9652c83bcd9ca2cacfcccb5b0525746b494ebb93bef1f4ada4d4b33737ee41be2fbc09058b30e8bf24490fbdfdb69ca3fdbe26a5d68850fc00508da4b08f84')
package() {
	# disable self-update as it won't work
	echo '#!/bin/sh'$'\n\n''TOPGRADE_NO_SELF_UPGRADE=true /opt/topgrade/topgrade' > topgrade-sh
	# install binary
	install -Dm755 ./topgrade "$pkgdir/opt/topgrade/topgrade"
	install -Dm755 ./topgrade-sh "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' > topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/man/man8/topgrade.8"
	# completions
	if $(command -v fish &> /dev/null); then
		./topgrade --gen-completion fish > topgrade.fish
		install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	fi
	if $(command -v bash &> /dev/null); then
		./topgrade --gen-completion bash > topgrade.bash
		install -Dm644 ./topgrade.bash  "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &> /dev/null); then
		./topgrade --gen-completion zsh > topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
}
