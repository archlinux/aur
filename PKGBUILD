# Maintainer: Snry Shell <snry@shell.dev>
# Release: tag as v<version> and push tag, then create GitHub release.
# The AUR publish workflow will update pkgver and publish automatically.
pkgname=snry-shell-qs
pkgver=2.3.2
pkgrel=1
pkgdesc='Snry Shell - Hyprland dotfiles managed by snry-daemon'
arch=('any')
url='https://github.com/sonroyaalmerol/snry-shell'
license=('MIT')
depends=(
	# Audio
	cava
	pavucontrol-qt
	wireplumber
	pipewire-pulse
	libdbusmenu-gtk3
	playerctl
	# Backlight
	geoclue
	brightnessctl
	ddcutil
	# Basic
	bc
	coreutils
	cliphist
	curl
	wget
	ripgrep
	jq
	socat
	xdg-user-dirs
	rsync
	go-yq
	qt6-5compat
	qt6-avif-image-plugin
	qt6-imageformats
	qt6-positioning
	kirigami
	kdialog
	syntax-highlighting
	# Cursor themes
	bibata-cursor-theme-bin
	# Fonts & Themes
	adw-gtk-theme-git
	breeze
	breeze-plus
	darkly-bin
	eza
	bash-completion
	fzf
	fontconfig
	ghostty
	matugen
	otf-space-grotesk
	starship
	zsh
	zsh-theme-powerlevel10k
	ttf-jetbrains-mono-nerd
	ttf-material-symbols-variable-git
	ttf-readex-pro
	ttf-rubik-vf
	ttf-twemoji
	# Hyprland
	hyprland
	hyprsunset
	wl-clipboard
	# KDE
	bluedevil
	gnome-keyring
	networkmanager
	plasma-nm
	polkit-kde-agent
	dolphin
	systemsettings
	# Portal
	xdg-desktop-portal
	xdg-desktop-portal-kde
	xdg-desktop-portal-gtk
	xdg-desktop-portal-hyprland
	# Python
	clang
	uv
	gtk4
	libadwaita
	libsoup3
	libportal-gtk4
	gobject-introspection
	# Screencapture
	hyprshot
	slurp
	swappy
	tesseract
	tesseract-data-eng
	wf-recorder
	# Toolkit
	upower
	wtype
	# Widgets
	fuzzel
	glib2
	imagemagick
	hypridle
	hyprlock
	hyprpicker
	songrec
	translate-shell
	wlogout
	libqalculate
	# Quickshell
	quickshell
)
makedepends=('git' 'go' 'base-devel')
optdepends=(
	'plasma-browser-integration: KDE browser integration support'
)
source=("git+https://github.com/sonroyaalmerol/snry-shell.git#tag=v$pkgver")
sha256sums=('SKIP')
backup=()
install=snry-shell-qs.install

package() {
	cd "$srcdir/snry-shell"

	# Build snry-daemon binary
	go build -o snry-daemon ./cmd/snry-daemon

	# Install snry-daemon binary
	install -Dm755 snry-daemon "$pkgdir/usr/bin/snry-daemon"

	# Install snry-shell wrapper (convenience alias)
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/snry-shell" <<'SCRIPT'
#!/bin/bash
exec /usr/bin/snry-daemon setup "$@"
SCRIPT

	# Install shared data
	install -dm755 "$pkgdir/usr/share/snry-shell"
	cp -a configs data frontend "$pkgdir/usr/share/snry-shell/"

	# Install systemd user unit
	install -Dm644 configs/systemd/user/snry-daemon.service "$pkgdir/usr/lib/systemd/user/snry-daemon.service"
}
