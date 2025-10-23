# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_enable_flatpak:=1}

_pkgname='pat-aur'
pkgbase=${_pkgname}-git
pkgname=(${_pkgname}-client-git ${_pkgname}-host-git)
pkgver=r518.20248ff
pkgrel=1
pkgdesc='AUR helper and tool to build Arch Linux packages in clean containers.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'libxslt' 'docbook-xsl' 'cmake')
arch=('x86_64')
source=("git+${url}.git")
sha256sums=('SKIP')

if ((_enable_flatpak)); then
	pkgname+=(${_pkgname}-client-flatpak-git)
	makedepends+=('boost' 'flatpak')
fi

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cmake -S ${_srcdir} -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
		-DPATAUR_VERSION="$pkgver" \
		-DPATAUR_FLATPAK="$_enable_flatpak"
	cmake --build build
}

package_pat-aur-client-git() {
	depends+=('elvish' 'pacutils' 'expac' 'gzip' 'curl')
	provides=(${_pkgname}-client)
	conflicts=(${_pkgname}-client)
	pkgdesc+=' (client only)'

	DESTDIR="${pkgdir}" cmake --install build
}

package_pat-aur-client-flatpak-git() {
	depends+=('pat-aur-client-git' 'libboost_json.so' 'flatpak' )
	pkgdesc+=' (flatpak support)'
}

package_pat-aur-host-git() {
	arch=('any')
	depends+=(
		'pat-aur-client-git'
		'parallel'
		'dumb-init'
		'pacutils'
		'aurutils'
		'bubblewrap'
		'ninja'
		'git'
		'python'
		'jq')
	optdepends+=(
		'seccomp-filtered-run: seccomp filters.'
		'sshfs: remote connection.'
		'socat: remote connection.'
		'systemd: cgroups support.'
		'rsync: rsync download agent.'
		'openssh: scp download agent.'
	)
	provides=(${_pkgname}-host)
	conflicts=(${_pkgname}-host)
	pkgdesc+=' (host machine)'
	install="${pkgbase}.install"
}
