# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=systemd-removed-services-hook
pkgver=1.1
pkgrel=3
pkgdesc='Notifies you of uninstalled systemd services'
arch=('any')
url='https://gitlab.com/firstairbender/systemd-removed-services-hook'
license=('Unlicense')
depends=('pacutils' 'systemd')
source=()

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
		Description = List of uninstalled services. Clean up if needed:
		When        = PostTransaction
		Depends     = systemd
		Depends     = pacutils
		Exec        = /bin/bash -c 'echo; for serv in $(cat); do if systemctl --quiet is-enabled "${serv##*/}" 2> /dev/null || systemctl --quiet --global is-enabled "${serv##*/}" 2> /dev/null; then echo -e "\t► $(pacconf RootDir)$serv"; fi; done'
		NeedsTargets
	EOF

  } > '20-systemd-removed-services.hook'
}

package() {
    install -Dm 644 ./* --target-directory="$pkgdir/$(pacconf HookDir)"
}
