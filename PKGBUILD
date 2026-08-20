# Maintainer: Sato Ki <satoki at em dot advant dot click>

# Unsloth Desktop: the Tauri/WebKitGTK shell for Unsloth Studio, repackaged from
# the upstream Ubuntu .deb. Distinct from the AUR `unsloth` package, which builds
# the Python studio + web UI from source; the two share no files and may be
# installed together.
#
# On first launch the app bootstraps a per-user Python environment under
# ~/.unsloth/studio (PyTorch, llama.cpp, ...) by running the install.sh it ships
# in /usr/lib/Unsloth. Nothing is written outside $HOME and no root is needed;
# the script's apt/sudo paths are gated behind `command -v apt-get` and are dead
# on Arch. It does hard-require a download transport, hence curl in depends.

pkgname=unsloth-desktop-bin
pkgver=0.1.801.beta
pkgrel=1
pkgdesc='Unsloth Desktop - train and run open models locally (prebuilt)'
arch=('x86_64')
url='https://unsloth.ai/'
license=('AGPL-3.0-only')
# From the binary's DT_NEEDED entries, not the .deb control file: the deb declares
# libappindicator3-1 but nothing links against it.
depends=(
	'webkit2gtk-4.1'
	'gtk3'
	'libsoup3'
	'dbus'
	'cairo'
	'gdk-pixbuf2'
	'glib2'
	'curl'
)
optdepends=(
	'git: fetches the triton_kernels training speedup during setup'
	'cmake: build llama.cpp from source instead of using the prebuilt'
	'gcc: build llama.cpp from source instead of using the prebuilt'
	'rocminfo: AMD GPU gfx arch detection; without it setup guesses from PCI IDs'
	'amdsmi: AMD GPU gfx arch detection; without it setup guesses from PCI IDs'
)
options=('!strip')

_debver="${pkgver//./_}"
_tag="v${pkgver/.beta/-beta}"
source=("https://github.com/unslothai/unsloth/releases/download/${_tag}/Unsloth-Desktop-${_debver}-Ubuntu.deb")
sha256sums=('08adab1c3096a7709b1d0996330826196c0bf5fd3b60ee3423fb4e63f0f906d1')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir"

	# Upstream ships an empty Categories= line, which desktop-file-validate
	# rejects and some menu implementations choke on.
	sed -i 's/^Categories=$/Categories=Development;Science;/' \
		"$pkgdir/usr/share/applications/Unsloth.desktop"
}
