# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=pacman-hook-list-systemd-units
pkgver=1.2
pkgrel=1
pkgdesc="Prints new systemd units on package installation or upgrade."
arch=('any')
license=('Unlicense')
depends=('systemd')
makedepends=('pacutils')
source=('list-systemd-units.sh')
sha512sums=('e3b6c1bd3b50c3f61ad8f35501c4e9b9f64b81ef5e1de9ae200d22c251b624fbfb721fbe55ebc2ebfe02606b3cbab1706bc1d5fa1687a2424d4fdc77499e8645')

build() {
	{
		cat <<- EOF
			[Trigger]
			Operation = Install
			Type = Path
		EOF

		{
			systemd-analyze unit-paths
			systemd-analyze --global unit-paths
		} | sed -e "s|^$(pacconf RootDir)|Target = |" -e 's|$|/*.*|' | sort -u
		echo

		cat <<- EOF
			[Action]
			Description = Notify about new systemd units
			Exec = /usr/share/libalpm/scripts/list-systemd-units.sh
			When = PostTransaction
			Depends = systemd
			NeedsTargets
		EOF
	} > 'list-systemd-units.hook'
}

package() {
	install -Dm644 'list-systemd-units.hook' -t "${pkgdir}/usr/share/libalpm/hooks/"
	install -Dm755 'list-systemd-units.sh' -t "${pkgdir}/usr/share/libalpm/scripts/"
}
