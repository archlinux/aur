pkgbase=coreutils-uutils-symlink
pkgname=(${pkgbase} coreutils-uutils-arch)
pkgver=0.1.0
pkgrel=2
arch=('any')
url='https://uutils.github.io/'
depends=(uutils-coreutils)
package_coreutils-uutils-symlink() {
	pkgdesc="(Dangerous) symlinks to swap coreutils with uutils"
	depends+=(nix-busybox)
	conflicts=(coreutils b3sum sha3sum coreutils-uutils)
	provides=(coreutils b3sum)
	install -d "$pkgdir"/usr/{bin,share/{man/man1,fish/vendor_completions.d}}
	for f in $(uu-coreutils --list)
	do
		ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
		ln -sf /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
		ln -sf /usr/share/fish/vendor_completions.d/uu-${f}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${f}.fish
	done
	echo '#!/usr/bin/uu-coreutils false' |tee "$pkgdir"/usr/bin/{ch,run}con
	chmod 755 "$pkgdir"/usr/bin/{ch,run}con
	ln -sf /usr/lib/nix/busybox "$pkgdir"/usr/bin/stty
	rm "$pkgdir"/usr/{bin,share/{man/man1,fish/vendor_completions.d}}/{kill,more,uptime,hostname}* "$pkgdir"/usr/bin/arch
}

package_coreutils-uutils-arch() {
	pkgdesc="arch symlink for apps unfortunately depending for it"
	conflicts=(coreutils-arch)
	provides=(coreutils-arch)
	install -d "$pkgdir"/usr/bin
	ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/arch
}
