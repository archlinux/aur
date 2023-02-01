# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.3.1
pkgrel=3
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade_x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade_aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade_armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('62c07014309f15a7dc5dc64db6a4504bef12bfb39de5a537d1c55d36aab26fdc59c2bdd08258fdfe9a1a2a2f93794b35eeafc15d9809cd52b0dcc921c51d44b4')
b2sums_aarch64=('2b38791caaceb38ca4b57c03ba7969443270eae4ecb75967082bc1952ba2ad370581e49401bf11335e3da3049678adb9598d9a6612304cfebd48dcd49c5d2b33')
b2sums_armv7h=('11e56b1438c31fc582ac8a9fbf91446ac06fbeeb2a69a186606d263ecf242d575d676dc1934bfd64a1fe4cb01b4204ce0c5a406d624c6eb4cf9af1bff200ecd3')
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
