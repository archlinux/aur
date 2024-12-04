# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=pacman-hook-list-systemd-units
pkgver=1.4
pkgrel=1
pkgdesc="Prints new systemd units on package installation or upgrade."
arch=('any')
license=('Unlicense')
depends=('systemd')
makedepends=('pacutils')
source=('list-systemd-units.sh')
sha512sums=('76a2421cbbfb8af20148b7f838736768015370a3366e5a7a73e40d658b07635078b94f2e092db6dc4141e4f87b0774b456978ffcf6cf3392a2c45a1fa8151557')

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
