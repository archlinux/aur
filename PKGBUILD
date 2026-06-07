# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_enable_flatpak:=1}

_pkgname='pat-aur'
pkgbase=${_pkgname}-git
pkgname=(${_pkgname}-client-git ${_pkgname}-client-firmware-git ${_pkgname}-netns-exec-git ${_pkgname}-host-git)
pkgver=r557.daf9690
pkgrel=1
pkgdesc='AUR helper and tool to build Arch Linux packages in clean containers.'
url="https://gitlab.com/patlefort/${_pkgname}"
license=('GPL-3.0-only')
depends=()
makedepends=('git' 'libxslt' 'docbook-xsl' 'cmake' 'ninja')
arch=('x86_64')
source=("git+${url}.git")
sha256sums=('SKIP')

if ((_enable_flatpak)); then
	pkgname+=(${_pkgname}-client-flatpak-git)
	makedepends+=('boost' 'boost-libs' 'flatpak')
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
	cmake -G Ninja -S ${_srcdir} -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
		-DPATAUR_VERSION="$pkgver" \
		-DPATAUR_FLATPAK="$_enable_flatpak"
	cmake --build build
}

package_pat-aur-client-git() {
	depends+=('elvish' 'pacutils' 'expac' 'gzip' 'curl')
	provides=(${_pkgname}-client)
	conflicts=(${_pkgname}-client)
	pkgdesc+=' (client only)'
	optdepends+=(
		'pat-aur-client-flatpak-git: check flatpak updates.'
		'pat-aur-client-firmware-git: check firmware updates.'
	)

	DESTDIR="${pkgdir}" cmake --install build
}

package_pat-aur-client-flatpak-git() {
	depends+=('pat-aur-client-git' 'libboost_json.so' 'flatpak')
	pkgdesc='Flatpak updates support for pat-aur.'
}

package_pat-aur-client-firmware-git() {
	depends+=('pat-aur-client-git' 'fwupd')
	pkgdesc='firmware updates support for pat-aur.'
}

# This will make netns-exec tool actually work. Without this, the tool is impotent. This is an optional install as it is a setuid
# executable and not everyone will need or want network namespaces for pat-aur.
package_pat-aur-netns-exec-git() {
	depends+=('pat-aur-client-git')
	pkgdesc='Execute a process in a specified network namespace.'
	install="${pkgbase}-netns-exec.install"
}

package_pat-aur-host-git() {
	arch=('any')
	depends+=(
		'pat-aur-client-git'
		'dumb-init'
		'pacutils'
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
		'pat-aur-netns-exec-git: build in network namespace.'
	)
	provides=(${_pkgname}-host)
	conflicts=(${_pkgname}-host)
	pkgdesc+=' (host machine)'
	install="${pkgbase}.install"
}
