# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=26.7.0
pkgrel=0
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('833a31b91d2eb8007e1cb5a68f24d7b4c9cba68bb44399d4c680224a3b0f0a456e390a97662863e800efeb802979e5e32daaaf13b4fdc74b39cf79ef58d7cc10')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

	# Wrap the desktop binary to set safer WebKit defaults
	# This helps avoid EGL/DMABUF compositor issues reported upstream
	# while still allowing users to override via environment variables.
	if [[ -f "${pkgdir}/usr/bin/hoppscotch-desktop" ]]; then
		mv "${pkgdir}/usr/bin/hoppscotch-desktop" "${pkgdir}/usr/bin/hoppscotch-desktop-bin"
		install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hoppscotch-desktop" <<'EOF'
#!/usr/bin/env sh
# Wrapper to launch Hoppscotch Desktop with WebKit fallbacks.
# Users can override by exporting the variables before running.

export WEBKIT_DISABLE_COMPOSITING_MODE="${WEBKIT_DISABLE_COMPOSITING_MODE:-1}"
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"

exec /usr/bin/hoppscotch-desktop-bin "$@"
EOF
	fi

}
