# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname='pat-aur'
pkgbase=${_pkgname}-git
pkgname=(${_pkgname}-client-git ${_pkgname}-host-git)
pkgver=r218.f17d205
pkgrel=1
pkgdesc='AUR helper and tool to build Arch Linux packages in clean containers.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL3')
depends=('elvish')
makedepends=('git' 'libxslt' 'docbook-xsl-ns' 'rsync')
arch=('any')
source=("git+${url}.git")
sha256sums=('SKIP')

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package_pat-aur-client-git() {
	depends+=('pacutils')
	provides=(${_pkgname}-client)
	conflicts=(${_pkgname}-client)
	pkgdesc+=' (client only)'

	cd "${_srcdir}"
	DESTDIR="${pkgdir}" ./install system
}

package_pat-aur-host-git() {
	depends+=('pat-aur-client-git' 'parallel' 'dumb-init' 'devtools' 'pacutils' 'aurutils' 'bubblewrap-overlayfs' 'ninja-jobserver')
	optdepends+=(
		'seccomp-filtered-run: seccomp filters.'
		'sshfs: remote connection.'
	)
	provides=(${_pkgname}-host)
	conflicts=(${_pkgname}-host)
	pkgdesc+=' (host machine)'
	install="${pkgbase}.install"
}
