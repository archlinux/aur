# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bash-radio-player-git
pkgver=r6.be94379
pkgrel=1
pkgdesc="Terminal radio player using mpv and fzf"
arch=('any')
url="https://github.com/gokayburuc/bash_radio_player"
license=('LicenseRef-unknown')
depends=('bash' 'mpv' 'fzf' 'gawk')
makedepends=('git')
provides=('bash-radio-player')
conflicts=('bash-radio-player')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "bash_radio_player"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd bash_radio_player
	sed -i 's|\./src/radyodelisi\.csv|"$stations_file"|g' radio-dashboard.sh
	{
		sed -n 1p radio-dashboard.sh
		cat <<'HEADER'
stations_file="${XDG_DATA_HOME:-$HOME/.local/share}/bash-radio-player/radyodelisi.csv"
if [ ! -f "$stations_file" ]; then
	mkdir -p "$(dirname "$stations_file")"
	cp /usr/share/bash-radio-player/radyodelisi.csv "$stations_file"
fi
HEADER

		sed 1d radio-dashboard.sh
	} >radio-dashboard.sh.new
	mv radio-dashboard.sh.new radio-dashboard.sh
}

package() {
	cd bash_radio_player
	install -Dm755 radio-dashboard.sh "$pkgdir/usr/bin/bash-radio-player"
	install -Dm644 src/*.csv -t "$pkgdir/usr/share/bash-radio-player"
	install -Dm644 README.md "$pkgdir/usr/share/doc/bash-radio-player/README.md"
}
