# Maintainer: Edward Diaz <edwardiaz.dev@gmail.com>

pkgname=google-antigravity-bin
pkgver=1.11.17
pkgrel=1
pkgdesc="Google Antigravity IDE - The new agentic development platform"
arch=('x86_64')
url="https://antigravity.google/"
license=('custom')
provides=('antigravity' 'google-antigravity')
conflicts=('antigravity' 'google-antigravity')
depends=('alsa-lib'
    'dbus'
    'gnupg'
    'libnotify'
    'libsecret'
    'libxkbfile'
    'libxss'
    'nss'
    'gtk3'
    'xdg-utils'
    'ripgrep'
    'fd')
makedepends=('tar' 'sed' 'desktop-file-utils')
options=('!strip')
source=("https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/pool/antigravity-debian/antigravity_1.11.17-1765244408_amd64_9df0712156d4f7f37ea353feaa9633ca.deb"
    "https://gitlab.archlinux.org/archlinux/packaging/packages/code/-/raw/main/code.sh")
sha256sums=('f5b61a4d00354f846e8850a2da9e87b7e204298f0f5cfa0365ede7207c7fc897'
    '5da1525b5fe804b9192c05e1cbf8d751d852e3717fb2787c7ffe98fd5d93e8c1')

build() {
	tar -xf "data.tar.xz"

	# Ensure metainfo exists and safely move contents from appdata if present
	mkdir -p usr/share/metainfo
	if [ -d usr/share/appdata ]; then
		shopt -s dotglob nullglob
		mv usr/share/appdata/* usr/share/metainfo/ || true
		shopt -u dotglob nullglob
		rmdir usr/share/appdata 2>/dev/null || true
	fi

    # Ensure proper permissions for chrome-sandbox
    chmod 4755 usr/share/antigravity/chrome-sandbox

	# Launcher script
	_app=/usr/share/antigravity
	sed -e "s|code-flags|antigravity-flags|" code.sh \
		-e "s|/usr/lib/code/out/cli.js|${_app}/resources/app/out/cli.js|" \
		-e "s|/usr/lib/code/code.mjs|--app=${_app}/resources/app|" > run.sh
    
    # Note: Antigravity structure might differ from VSCode/Windsurf slightly.
    # If cli.js is not at resources/app/out/cli.js, this might need adjustment.
    # Based on tar output: usr/share/antigravity/antigravity exists.
    # Usually the main binary handles CLI args.
    # We can just symlink the main binary to /usr/bin/antigravity instead of using code.sh if it's self-contained.
    # Windsurf uses code.sh to handle electron flags and environment variables properly.
    
    # Let's stick to a simple symlink for now if we are unsure about cli.js location, 
    # OR use a simple wrapper script.
    # Given "google antigravity" is likely based on VS Code, resources/app/out/cli.js should exist.
    # But if not, we might break it.
    # Safe bet: Just symlink the binary and pass args.
    
    echo "#!/bin/bash" > antigravity.sh
    echo "exec /usr/share/antigravity/antigravity \"\$@\"" >> antigravity.sh
}

package() {
    cp -r --reflink=auto usr "${pkgdir}/usr"
    
    # Install the wrapper script
    install -Dm755 antigravity.sh "${pkgdir}/usr/bin/antigravity"
    
    # Symlink for google-antigravity if desired
    ln -s /usr/bin/antigravity "${pkgdir}/usr/bin/google-antigravity"
}
