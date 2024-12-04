# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=pacman-hook-list-systemd-units
pkgver=1.3
pkgrel=1
pkgdesc="Prints new systemd units on package installation or upgrade."
arch=('any')
license=('Unlicense')
depends=('systemd')
makedepends=('pacutils')
source=('list-systemd-units.sh')
sha512sums=('7d4454c57d3735c0d77a4af4f675c9416301d264368ab9801f8d211c5cf7c38866d350e4d80f8853db7909023c8d38af41b5d3dfa2c77ae672203a83b9ba880e')

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
