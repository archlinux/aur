# Maintainer: enderghast13 <29264120+enderghast13 at users dot noreply dot github dot com>
pkgname=nxdt_host-git
pkgver=0.3.r25.4a512db
pkgrel=2
pkgdesc="nxdumptool host script"
arch=('any')
url="https://github.com/DarkMatterCore/nxdumptool"
license=('GPL3')
makedepends=('git')
source=("git+${url}.git#branch=rewrite"
        '10-nxdumptool.rules'
        'nxdt_host.desktop')
sha1sums=('SKIP'
          '74c53f0a112c8c61f913de673fa652e87d76d1a5'
          '2c78c08f8c47cc6f10abb579ea537c31088f6bcb')

pkgver() {
	# The script was moved several times, breaking git-log continuity
	# even when using --follow
	_names=('host/nxdt_host.py' 'nxdt_host.pyw' 'nxdt_host.py' 'host.py')
	cd "$srcdir"/nxdumptool
	_version="$( sed -n "s/APP_VERSION = '\(.*\)'/\1/p" "${_names[0]}" )"
	_commits="$( git log --pretty=format:%h -- "${_names[@]}" )"
	_revision="$( wc -l <<< "$_commits" )"
	_commit="$( head -n1 <<< "$_commits" )"
	printf "$_version.r$_revision.$_commit"
}

prepare() {
	cd "$srcdir"/nxdumptool/host
	# Change INITIAL_DIR assignment to use the user's home directory so it
	# doesn't try to dump stuff into the installation directory by default
	sed -i "s/\(INITIAL_DIR = os\.path\.\).*/\1expanduser('~')/" nxdt_host.py
	# Extract embedded icon
	awk -F "'" '/APP_ICON = /,/==/{print $2}' nxdt_host.py | base64 --decode > nxdt.png
}

package() {
	depends=('python' 'python-pyusb' 'python-tqdm' 'tk')
	install -Dm755 nxdumptool/host/nxdt_host.py "$pkgdir"/usr/bin/nxdt_host.py
	install -Dm644 nxdumptool/host/nxdt.png "$pkgdir"/usr/share/pixmaps/nxdt.png
	install -Dm644 10-nxdumptool.rules "$pkgdir"/usr/lib/udev/rules.d/10-nxdumptool.rules
	install -Dm644 nxdt_host.desktop "$pkgdir"/usr/share/applications/nxdt_host.desktop
}
