# Maintainer: Jeff <your@email.com>
# https://sourceforge.net/projects/ultimate-bashrc/
pkgname=extreme-ultimate-bashrc
pkgver=1.0.5
pkgrel=1
pkgdesc='Feature-rich bash configuration framework with 108 functions, 113 aliases, auto-detection, and extensive documentation'
arch=('any')
url='https://sourceforge.net/projects/ultimate-bashrc/'
license=('0BSD')
depends=('bash')
optdepends=(
	'atuin: magical shell history with SQLite database'
	'bat: syntax-highlighted file previews'
	'btm: system resource monitor'
	'colordiff: colorized diff output'
	'delta: modern diff viewer with syntax highlighting'
	'diff-so-fancy: human-readable diffs'
	'difftastic: structural syntax-aware diffs'
	'eza: modern ls replacement with colors and icons'
	'fastfetch: fast system information display'
	'fd: fast alternative to find'
	'ffmpeg: multimedia framework for audio and video'
	'fzf: fuzzy finder integration'
	'grc: generic command output colorizer'
	'git: version control integration'
	'imagemagick: image processing and conversion'
	'jq: JSON processor'
	'lazygit: terminal UI for git'
	'lsd: ls with colors and icons'
	'meld: graphical diff and merge tool'
	'ranger: terminal file manager'
	'ripgrep: fast recursive search tool'
	'starship: cross-shell prompt'
	'tmux: terminal multiplexer'
	'trash-cli: command-line trash utility'
	'yt-dlp: video downloader'
	'zoxide: smart directory jumping'
)
install="${pkgname}.install"

# SourceForge release tarball
# For local testing: run make-test-tarball.sh first, then makepkg -si
source=("${pkgname}-${pkgver}.tar.gz::https://sourceforge.net/projects/ultimate-bashrc/files/aur/${pkgname}-${pkgver}.tar.gz/download")
sha256sums=('ff2ef87e9c6a8883c43a3599f7ff25bcf774f9153587fe068548c7c098adea52')

package() {
	local INSTALL_ROOT="${pkgdir}/opt/${pkgname}"

	# Create directories
	install -dm755 "${INSTALL_ROOT}"
	install -dm755 "${INSTALL_ROOT}/bashrc.d"
	install -dm755 "${pkgdir}/usr/bin"

	# Install main bashrc (readable and sourceable by all users)
	install -Dm644 "${srcdir}/.bashrc" "${INSTALL_ROOT}/.bashrc"

	# Install supporting files
	install -Dm644 "${srcdir}/help" "${INSTALL_ROOT}/help"
	install -Dm644 "${srcdir}/README.md" "${INSTALL_ROOT}/README.md"
	install -Dm644 "${srcdir}/README.html" "${INSTALL_ROOT}/README.html"
	install -Dm644 "${srcdir}/trueline.sh" "${INSTALL_ROOT}/trueline.sh"
	install -Dm644 "${srcdir}/prompt" "${INSTALL_ROOT}/prompt"

	# Install safe starter templates
	install -Dm644 "${srcdir}/config.safe" "${INSTALL_ROOT}/config.safe"
	install -Dm644 "${srcdir}/aliases.safe" "${INSTALL_ROOT}/aliases.safe"

	# Install full reference examples
	install -Dm644 "${srcdir}/config.example" "${INSTALL_ROOT}/config.example"
	install -Dm644 "${srcdir}/aliases.example" "${INSTALL_ROOT}/aliases.example"

	# Install the interactive setup script
	install -Dm755 "${srcdir}/install.sh" "${INSTALL_ROOT}/install.sh"

	# Install bashrc.d auto-loaded scripts
	if compgen -G "${srcdir}/bashrc.d/*" > /dev/null; then
		for FILE in "${srcdir}"/bashrc.d/*; do
			[[ -f "${FILE}" ]] && install -Dm644 "${FILE}" \
				"${INSTALL_ROOT}/bashrc.d/$(basename "${FILE}")"
		done
	fi

	# Install the setup-bashrc wrapper to /usr/bin/
	install -Dm755 "${srcdir}/setup-bashrc" "${pkgdir}/usr/bin/setup-bashrc"
}
