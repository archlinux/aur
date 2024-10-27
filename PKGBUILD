# Maintainer: detiam <dehe_tian <at> outlook <dot> com>

# shellcheck disable=SC1090
pkgname=nvidia-patch-git
pkgver=r1083.ac0afeb
pkgrel=1
pkgdesc="apply nvidia-patch by keylase automatically, unlock nvfbc and nvenc limit"
arch=('x86_64')
url="https://github.com/keylase/${pkgname/-git}"
license=('unknown')
provides=('nvidia-patch')
conflicts=('nvidia-patch')
depends=("nvidia-utils")
makedepends=('git')
source=("git+$url.git")
sha1sums=('SKIP')

pkgver() {
	cd "${pkgname/-git}" || exit 1
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	enc_patch_list_text=$(sed -n '/.*patch_list=($/,/^)$/p' ${pkgname/-git}/patch.sh | sed 's|patch_list|enc_patch_list|')
	fbc_patch_list_text=$(sed -n '/.*patch_list=($/,/^)$/p' ${pkgname/-git}/patch-fbc.sh | sed 's|patch_list|fbc_patch_list|')

	mkdir -p "$pkgdir/usr/share/$pkgname/"
	cat <<- EOF > "$pkgdir/usr/share/$pkgname/simple_patcher.sh"
		#!/bin/env bash

		$enc_patch_list_text

		$fbc_patch_list_text

		encso=\$(readlink -es /lib/libnvidia-encode.so)
		fbcso=\$(readlink -es /lib/libnvidia-fbc.so)

		encver=\$(echo "\$encso" | grep -oP '[0-9]..*[0-9]$')
		fbcver=\$(echo "\$fbcso" | grep -oP '[0-9]..*[0-9]$')

		if [ -z "\${enc_patch_list[\$encver]}" ]; then
			echo "error: No valid NVENC patch was found."
			need_update=1
		fi
		if [ -z "\${fbc_patch_list[\$fbcver]}" ]; then
			echo "error: No valid NVFBC patch was found."
			need_update=1
		fi
		if [ "\$need_update" == 1 ]; then
			echo "Please update '$pkgname'. if it's already done, maybe the upstream haven't update."
			exit 2
		fi

		sed -i "\${enc_patch_list[\$encver]}" "\$encso"
		sed -i "\${fbc_patch_list[\$fbcver]}" "\$fbcso"

	EOF

	mkdir -p "$pkgdir/usr/share/libalpm/hooks/"
	cat <<- EOF > "$pkgdir/usr/share/libalpm/hooks/nvidia-patch.hook"
		[Trigger]
		Type = Package
		Operation = Install
		Operation = Upgrade
		Target = ${depends[0]%=*}
		Target = ${pkgname}

		[Action]
		Description = Patching Nvidia libraries...
		When = PostTransaction
		Exec = /usr/bin/bash "/usr/share/$pkgname/simple_patcher.sh"

	EOF
}
