# Maintainer : aji <43468383+aji-prod@users.noreply.github.com>
pkgname=tomato
pkgver=0.9.1
pkgrel=1
pkgdesc="AUR local repository manager"
arch=('any')
url="https://github.com/aji-prod/tomato"
license=('GPL3')
source=(
	"${pkgname}-${pkgver}.tar.gz"::https://github.com/aji-prod/tomato/archive/v"${pkgver}".tar.gz
)

sha256sums=('291fc436f4081b8dc629b9277150a7241d7391efab560a0c621c7e5b12945e71')

depends=(
	'docker'
)

optdepends=(
	'python: --remote-update option support'
)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 tomato "$pkgdir/usr/bin/tomato"
	install -Dm644 tomato.conf "$pkgdir/etc/tomato.conf"
	for dockfile in $(cd ./docker && ls -A ./*); do
		install -Dm644 docker/$dockfile "$pkgdir/usr/share/$pkgname/image/$dockfile"
	done
	for hookfile in $(cd ./pacman && ls ./*); do
		install -Dm644 pacman/$hookfile "$pkgdir/usr/share/libalpm/hooks/$hookfile"
	done
	for sysfile in $(cd ./systemd && ls ./*.{timer,service}); do
		install -Dm644 systemd/$sysfile "$pkgdir/usr/lib/systemd/system/$sysfile"
	done
	install -Dm644 "systemd/tomato-update.conf" "$pkgdir/usr/share/tomato/tomato-update.conf"
	install -Dm644 "complete/tomato.bash" "$pkgdir/usr/share/bash-completion/completions/tomato"
	mkdir -p -m755 "$pkgdir/var/pkg/tomato"
	chown :alpm -R "$pkgdir/var/pkg/tomato"
}
