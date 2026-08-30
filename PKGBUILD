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
pkgver=0.1.804.beta
pkgrel=2
pkgdesc='Unsloth Desktop - train and run open models locally (prebuilt)'
arch=('x86_64')
url='https://unsloth.ai/'
license=('AGPL-3.0-only')
# Mostly the binary's DT_NEEDED entries. libayatana-appindicator is the exception:
# nothing links against it, but tauri 2.11's TrayIconBuilder runs unconditionally in
# app setup and libappindicator-sys 0.9 dlopens the library there, panicking in main
# before any window if it is missing -- so the deb's libappindicator3-1 was right and
# a DT_NEEDED-only reading of the binary is not. It probes ayatana first, falling back
# to libappindicator; the ayatana package satisfies the first probe, so it alone is
# enough. The other dlopened sonames need no entry: libX11/libXi (x11-dl), libGLESv2
# and libgcc_s all arrive transitively via gtk3/webkit2gtk, and libunity is an Ubuntu
# taskbar-badge nicety that is absent from Arch entirely and soft-fails.
depends=(
	'webkit2gtk-4.1'
	'gtk3'
	'libsoup3'
	'dbus'
	'cairo'
	'gdk-pixbuf2'
	'glib2'
	'libayatana-appindicator'
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
source=("https://github.com/unslothai/unsloth/releases/download/${_tag}/Unsloth-Desktop-Ubuntu.deb")
sha256sums=('0eb1db47ba46793b6f94f203643d123ceea951fefdd91b24775c7500d326a5fc')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir"

	local _apps="$pkgdir/usr/share/applications"

	# The toplevel sets app_id "unsloth-studio" (verified with WAYLAND_DEBUG=1),
	# but upstream names the entry Unsloth.desktop. KWin resolves a Wayland
	# window's icon by looking up "<app_id>.desktop" and falls back to the
	# generic Wayland logo when that misses -- which is why Overview/alt-tab
	# showed no icon while the Task Manager, which also matches on
	# StartupWMClass, showed the right one. Renaming makes the lookup succeed.
	# The unsloth:// scheme is handled by the app's own generated
	# ~/.local/share/applications/unsloth-studio-handler.desktop, so nothing
	# refers to the old basename.
	mv "$_apps/Unsloth.desktop" "$_apps/unsloth-studio.desktop"

	# Upstream ships an empty Categories= line, which desktop-file-validate
	# rejects and some menu implementations choke on.
	sed -i 's/^Categories=$/Categories=Development;Science;/' \
		"$_apps/unsloth-studio.desktop"
}
