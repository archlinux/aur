# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=pacman-hook-list-systemd-units
pkgver=1.0
pkgrel=1
pkgdesc="Prints new systemd units on package installation or upgrade."
arch=('any')
license=('Unlicense')
depends=('systemd')
makedepends=('pacutils')
source=('list-systemd-units.sh')
sha512sums=('b8ea4e94d0caa68ff2dc828559ff1610258ecba9f0620e13911c73349128318b4df6a22ea31917803d935fa1b31f70b1347b85d9f684cca1d6135663195b89fe')

build() {
	{
		cat <<- EOF
			[Trigger]
			Operation = Install
			Type = Path
		EOF

		rootdir="$(pacconf RootDir)"
		for p in $(systemd-analyze --global unit-paths; systemd-analyze unit-paths); do
			p="${p#"$rootdir"}"
			echo "Target = $p/*.service"
		done | sort

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
	install -Dm744 'list-systemd-units.sh' -t "${pkgdir}/usr/share/libalpm/scripts/"
}
