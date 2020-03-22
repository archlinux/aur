# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=systemd-removed-services-hook
pkgver=1.3
pkgrel=1
pkgdesc='Notifies you of uninstalled systemd services along with the command to disable them'
arch=('any')
url='https://gitlab.com/firstairbender/systemd-removed-services-hook'
license=('Unlicense')
makedepends=('pacutils')
depends=('systemd')

build() {
  {
  	cat <<-'EOF'
		# https://jlk.fjfi.cvut.cz/arch/manpages/man/alpm-hooks.5

		[Trigger]
		Operation = Remove
		Type      = Path
	EOF

  	for p in $(systemd-analyze --global unit-paths; systemd-analyze unit-paths); do 
  		p=${p#"$(pacconf RootDir)"}
  		echo "Target    = $p/*.service"
  	done | sort

  	cat <<-'EOF'

		[Action]
		Description = Systemd commands to disable uninstalled services
		When        = PreTransaction
		Depends     = systemd
		Depends     = pacutils
		Exec        = /bin/bash -c 'echo; cat | while read -r f; do service="${f##*/}"; if [ "${f/*\/system\/*/system}" = "system" ] && systemctl --quiet is-enabled "$service" 2> /dev/null; then echo -e "\t► systemctl disable $service"; elif [ "${f/*\/user\/*/user}" = "user" ] && systemctl --quiet --global is-enabled "$service" 2> /dev/null; then echo -e "\t► systemctl disable --global $service"; fi; done'
		NeedsTargets
	EOF

  } > '20-systemd-removed-services.hook'
}

package() {
    install -Dm 0644 ./* --target-directory="$pkgdir/$(pacconf HookDir)"
}
