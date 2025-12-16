# Maintainer: Gowtham2003 <gowtham2003g@gmail.com>
# Contributor: Gowtham2003 <gowtham2003g@gmail.com>
pkgname=hoppscotch-bin
pkgver=25.11.2
pkgrel=0
pkgdesc="Hoppscotch. Open source API development ecosystem"
arch=('x86_64')
url="https://hoppscotch.io/"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'openssl-1.1' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/hoppscotch/releases/releases/download/v${pkgver}-${pkgrel}/Hoppscotch_linux_x64.deb")
sha512sums_x86_64=('4a57148fac5fb6a78b6848a470e5f785810950cc80ced382107c82df799945b449a86f693ae4e4637bac26400a7e7ac49fa302cce09b24025d6716eb8f2f1774')

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
