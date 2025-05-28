pkgbase=coreutils-uutils-symlink
pkgname=(${pkgbase} coreutils-uutils-arch)
pkgver=0.1.0
pkgrel=4
arch=('any')
url='https://uutils.github.io/'
depends=(uutils-coreutils)
makedepends=(grep)
package_coreutils-uutils-symlink() {
	pkgdesc="(dangerous) Swap coreutils with uutils"
	depends+=(uutils-coreutils-stty)
	conflicts=(coreutils{,-uutils} b3sum sha3sum)
	provides=(coreutils b3sum)
	install -d "$pkgdir"/usr/{bin,share/{man/man1,fish/vendor_completions.d,zsh/site-functions}}
	for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$')
	do
		ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
		ln -sf /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
		ln -sf /usr/share/fish/vendor_completions.d/uu-${f}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${f}.fish
		ln -sf /usr/share/zsh/site-functions/_uu-"$f" "$pkgdir"/usr/share/zsh/site-functions/_"$f"
	done # todo: avoid broken symlink
	echo '#!/usr/bin/uu-coreutils false' |tee "$pkgdir"/usr/bin/{ch,run}con
	chmod 755 "$pkgdir"/usr/bin/{ch,run}con
	ln -sf /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
	rm "$pkgdir"/usr/bin/arch
}

package_coreutils-uutils-arch() {
	pkgdesc="Symlink for apps accidently depending on arch"
	conflicts=(coreutils-arch)
	provides=(coreutils-arch)
	install -d "$pkgdir"/usr/bin
	ln -sf /usr/bin/uu-coreutils "$pkgdir"/usr/bin/arch
}
