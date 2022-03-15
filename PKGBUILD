# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=pacman-hook-list-systemd-units
pkgver=1.1
pkgrel=1
pkgdesc="Prints new systemd units on package installation or upgrade."
arch=('any')
license=('Unlicense')
depends=('systemd')
makedepends=('pacutils')
source=('list-systemd-units.sh')
sha512sums=('0f62364a8bbeb876ebc03c6f242db0cef8cc70564a1b969f5de09e15afd511b24a0d49c495265f8bfa968bba0cacb6d0efa079c2eff990640df6fbac97f48f17')

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
