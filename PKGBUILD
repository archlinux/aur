# Maintainer: Snry Shell <snry@shell.dev>
# Release: tag as v<version> and push tag, then create GitHub release.
# The AUR publish workflow will update pkgver and publish automatically.
pkgname=snry-shell
pkgver=3.0.0
pkgrel=1
pkgdesc='Snry Shell - Hyprland desktop shell managed by snry-daemon'
arch=('x86_64')
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
	hyprpicker
	songrec
	translate-shell
	wlogout
	libqalculate
	# Quickshell
	quickshell
)
makedepends=('git' 'go' 'base-devel')
replaces=('snry-shell-qs')
conflicts=('snry-shell-qs')
provides=('snry-shell-qs=$pkgver')
optdepends=(
	'snry-dm: Display manager (greeter/login screen)'
	'plasma-browser-integration: KDE browser integration support'
)
source=("git+https://github.com/sonroyaalmerol/snry-shell.git#tag=v$pkgver")
sha256sums=('SKIP')
backup=()
install=snry-shell.install

build() {
	cd "$srcdir/snry-shell"
	go build -o snry-daemon ./cmd/snry-daemon
}

package() {
	cd "$srcdir/snry-shell"

	# Install snry-daemon binary
	install -Dm755 snry-daemon "$pkgdir/usr/bin/snry-daemon"

	# Install snry-shell wrapper (convenience alias)
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/snry-shell" <<'SCRIPT'
#!/bin/bash
exec /usr/bin/snry-daemon setup "$@"
SCRIPT

	# Convenience symlink: snry -> snry-daemon
	ln -s snry-daemon "$pkgdir/usr/bin/snry"

	# Install shared data (configs, data, frontend)
	install -dm755 "$pkgdir/usr/share/snry-shell"
	cp -a configs data frontend "$pkgdir/usr/share/snry-shell/"

	# Install systemd user unit
	install -Dm644 configs/systemd/user/snry-daemon.service "$pkgdir/usr/lib/systemd/user/snry-daemon.service"
}