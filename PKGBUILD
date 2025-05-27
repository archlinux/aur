# Maintainer: detiam <dehe_tian <at> outlook <dot> com>

# shellcheck disable=SC1090

_force_nvutils_ver=${_force_nvutils_ver:-}

pkgname=nvidia-patch
pkgver=570.153.02
pkgrel=1
pkgdesc="install or reinstall to apply and update nvidia-patch by keylase, unlock nvfbc and nvenc limit"
arch=('x86_64')
url="https://github.com/keylase/$pkgname"
license=('unknown')
depends=('nvidia-utils')
makedepends=('git')
source=("git+$url.git")
sha1sums=('SKIP')

encso=$(readlink -es /lib/libnvidia-encode.so)
fbcso=$(readlink -es /lib/libnvidia-fbc.so)

pkgver() {
	encver=$(echo "$encso" | grep -oP '[0-9]..*[0-9]$' || exit 0)
	fbcver=$(echo "$fbcso" | grep -oP '[0-9]..*[0-9]$' || exit 0)
	if [ "$encver" == "$fbcver" ]; then
		if [[ -z $_force_nvutils_ver ]]; then
			if [[ -z $encver ]]; then
				echo 'Unable to detect NVIDIA driver version' >&2
				echo 'Try using "_force_nvutils_ver" environment variable to specify one?' >&2
				exit 1
			fi
			echo "$encver"
		else
			export encso="/lib/libnvidia-encode.so.${pkgver}"
			export fbcso="/lib/libnvidia-fbc.so.${pkgver}"
			echo "$_force_nvutils_ver"
		fi
	else
		echo 'Version between nvenc and nvfbc are not the same, system broken?' >&2
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
