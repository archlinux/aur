# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>
pkgname=spotify-backup-git
pkgver=r6.5a96c02
pkgrel=1
pkgdesc=""
arch=(any)
url="https://gitlab.com/azertyfun/spotify-backup"
license=('MIT')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install="${pkgname}.install"
source=("spotify-backup.service"
        "spotify-backup.timer"
        "${pkgname}::git+https://gitlab.com/azertyfun/spotify-backup.git")
noextract=()
md5sums=('84360915f38c39a8840bd1618c59611d'
         'dd19bf59a9058e16f7a724ca03f0c39f'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
	python setup.py install --skip-build -O1 --root="$pkgdir"

	mkdir -p "$pkgdir"/var/lib/spotify-backup

	mkdir -p "$pkgdir"/usr/lib/systemd/system
	cp ../spotify-backup.{service,timer} "$pkgdir"/usr/lib/systemd/system/
}
