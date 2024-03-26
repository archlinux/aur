# Maintainer: detiam <dehe_tian <at> outlook <dot> com>

# shellcheck disable=SC1090
pkgname=nvidia-patch
pkgver=550.67
pkgrel=1
pkgdesc="install or reinstall to apply and update nvidia-patch by keylase, unlock nvfbc and nvenc limit"
arch=('x86_64')
url="https://github.com/keylase/$pkgname"
license=('unknown')
provides=('nvidia-utils-nvlax')
replaces=('nvidia-utils-nvlax')
conflicts=('nvidia-utils-nvlax')
source=("git+$url.git")
sha1sums=('SKIP')

encso=$(readlink -es /lib/libnvidia-encode.so)
fbcso=$(readlink -es /lib/libnvidia-fbc.so)

pkgver() {
	encver=$(echo "$encso" | grep -oP '\d+\.\d+')
	fbcver=$(echo "$fbcso" | grep -oP '\d+\.\d+')
	if [ "$encver" == "$fbcver" ]; then
		echo "$encver"
	else
		echo 'broken system!!!' >&2
		exit 1
	fi
}

package() {
	depends=("nvidia-utils=$pkgver")

    # libnvidia-encode.so
    . <(sed -n '/.*patch_list=($/,/^)$/p' $pkgname/patch.sh)
    # libnvidia-fbc.so
    . <(sed -n '/.*patch_list=($/,/^)$/p' $pkgname/patch-fbc.sh | sed 's|patch_list|fbc_patch_list|')
    
    [ -z "${patch_list[$pkgver]}" ] && error "Upstream haven't update !" && exit 2
    [ -z "${fbc_patch_list[$pkgver]}" ] && error "Upstream haven't update !" && exit 2

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
		Exec = /usr/bin/sh -c "sed -i '${patch_list[$pkgver]}' '$encso' ; sed -i '${fbc_patch_list[$pkgver]}' '$fbcso'"

	EOF
}
