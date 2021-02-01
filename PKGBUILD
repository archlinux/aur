# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

pkgname=systemd-removed-services-hook
pkgver=1.3.4
pkgrel=2
pkgdesc='Notifies you of uninstalled systemd services along with the command to disable them'
arch=('any')
url='https://gitlab.com/firstairbender/systemd-removed-services-hook'
license=('Unlicense')
makedepends=('pacutils')
depends=('systemd')
source=(
    systemd-removed-services.sh
)
sha512sums=('edb4ea656ea94df6fe79db9d304b32520c789a5512c28fd78888ef4b80f39ccb5e48986ff88cf69540bbede872817e5f1186a4ee18b2ac142a323a914020eca0')

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
        Exec        = /usr/share/libalpm/scripts/systemd-removed-services.sh
        NeedsTargets
	EOF

  } > '20-systemd-removed-services.hook'
}

package() {
    install -Dm 0644 ./*.hook --target-directory="$pkgdir/usr/share/libalpm/hooks/"
    install -Dm 0744 ./*.sh --target-directory="$pkgdir/usr/share/libalpm/scripts/"
}
