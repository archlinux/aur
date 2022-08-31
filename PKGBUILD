# Maintainer: enderghast13 <29264120+enderghast13 at users dot noreply dot github dot com>
pkgname=nxdt_host-git
pkgver=0.3.r26.942a407
pkgrel=1
pkgdesc='nxdumptool host script'
arch=(any)
url=https://github.com/DarkMatterCore/nxdumptool
license=(GPL3)
makedepends=(git)
source=("nxdumptool::git+${url}.git#branch=rewrite"
        10-nxdumptool.rules
        nxdt_host.desktop)
b2sums=(SKIP
        00b6f07e14028600980075d1bef5c288dd354ef58050b70d6ef950ff90643aaa01e0b2da7962a0244e583102e50f4a96e9975cb52b794f08f37a695eb8f2afa0
        f43eb0a343f80daa753b80e66ddaa4c15bfac461629f193e7840e39dd0b82b39e6a3354e1c07525c1bf3e94fafc232dc40207734bd2c193698ebfa3963a29664)

pkgver() {
	# The script was moved several times, breaking git-log continuity
	# even when using --follow
	cd nxdumptool
	_names=(host/nxdt_host.py nxdt_host.pyw nxdt_host.py host.py)
	_version=$(sed -n "s/APP_VERSION = '\(.*\)'/\1/p" "${_names[0]}")
	readarray -t _commits < <(git log --pretty=format:%h -- "${_names[@]}")
	printf "%s.r%s.%s" "$_version" "${#_commits[*]}" "${_commits[0]}"
}

prepare() {
	cd nxdumptool/host
	# Change INITIAL_DIR assignment to use the user's home directory so it
	# doesn't try to dump stuff into the installation directory by default
	sed -i "s/\(INITIAL_DIR = os\.path\.\).*/\1expanduser('~')/" nxdt_host.py
	# Extract embedded icon
	awk -F "'" '/APP_ICON = /,/==/{print $2}' nxdt_host.py | base64 -d > nxdt.png
}

package() {
	depends=(python python-pyusb python-tqdm tk)
	install -Dm755 nxdumptool/host/nxdt_host.py "$pkgdir/usr/bin/nxdt_host.py"
	install -Dm644 nxdumptool/host/nxdt.png "$pkgdir/usr/share/pixmaps/nxdt.png"
	install -Dm644 10-nxdumptool.rules "$pkgdir/usr/lib/udev/rules.d/10-nxdumptool.rules"
	install -Dm644 nxdt_host.desktop "$pkgdir/usr/share/applications/nxdt_host.desktop"
}
