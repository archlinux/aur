# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

: ${_enable_flatpak:=1}
: ${_enable_tui:=1}

_pkgname='pat-aur'
pkgbase=${_pkgname}-git
pkgname=(${_pkgname}-client-git ${_pkgname}-client-firmware-git ${_pkgname}-netns-exec-git ${_pkgname}-host-git)
pkgver=r655.30c9a2d
pkgrel=1
pkgdesc='AUR helper and tool to build Arch Linux packages in clean containers.'
_url_base='https://gitlab.com/patlefort'
url="${_url_base}/${_pkgname}"
license=('GPL-3.0-only' 'MIT')
depends=()
makedepends=('git' 'libxslt' 'docbook-xsl' 'cmake' 'ninja')
arch=('x86_64')
source=(
	"git+${url}.git"
	"git+${_url_base}/PatFTXUI.git"
	'git+https://github.com/zzamboni/elvish-themes.git'
	'nlohmann_json::git+https://github.com/nlohmann/json.git'
	'git+https://github.com/zzamboni/elvish-modules.git'
	'git+https://github.com/href/elvish-gitstatus.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

if ((_enable_flatpak)); then
	pkgname+=(${_pkgname}-client-flatpak-git)
	makedepends+=('flatpak')
fi

if ((_enable_tui)); then
	depends+=('ftxui' 'libutf8proc')
fi

_srcdir="${_pkgname}"

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_srcdir}"

	git submodule init
	git config 'submodule.modules/third_party/github.com/href/elvish-gitstatus.url' "$srcdir/elvish-gitstatus"
	git config 'submodule.modules/third_party/github.com/zzamboni/elvish-themes.url' "$srcdir/elvish-themes"
	git config 'submodule.modules/third_party/github.com/zzamboni/elvish-modules.url' "$srcdir/elvish-modules"
	git config 'submodule.third_party/PatFTXUI.url' "$srcdir/PatFTXUI"
	git config 'submodule.third_party/nlohmann_json.url' "$srcdir/nlohmann_json"
	git -c 'protocol.file.allow=always' submodule update
}

build() {
	cmake -G Ninja -S "${_srcdir}" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
		-DPATAUR_VERSION="$pkgver" \
		-DPATAUR_FLATPAK="$_enable_flatpak" \
		-DPATAUR_TUI="$_enable_tui"
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
		'python-pygments: Colorize source PKGBUILD.'
	)

	DESTDIR="${pkgdir}" cmake --install build
}

package_pat-aur-client-flatpak-git() {
	arch=('any')
	depends+=('pat-aur-client-git' 'flatpak')
	pkgdesc='Flatpak updates support for pat-aur.'
}

package_pat-aur-client-firmware-git() {
	arch=('any')
	depends+=('pat-aur-client-git' 'fwupd')
	pkgdesc='firmware updates support for pat-aur.'
}

# This will make netns-exec tool actually work. Without this, the tool is impotent. This is an optional install as it is a setuid
# executable and not everyone will need or want network namespaces for pat-aur.
package_pat-aur-netns-exec-git() {
	arch=('any')
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
