# Maintainer: Ruben Kharel <talkto@rubenk.com.np>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=chatgpt-desktop-git
_pkgname=ChatGPT
pkgver=0.12.0+r9+g6adb6e3
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=('x86_64'
      'i686' #ArchLinux32
      'armv7h' #ArchLinuxARM
      'aarch64') #ArchLinuxARM
url="https://github.com/lencx/ChatGPT"
license=("Apache")
provides=("chatgpt-desktop")
conflicts=("chatgpt-desktop")
makedepends=("imagemagick"
             "git")
depends=("hicolor-icon-theme"
         "openssl"
         "webkit2gtk"
         "rust")

source=("git+https://github.com/lencx/ChatGPT.git"
        chat-gpt.desktop)
md5sums=('SKIP'
         '522e34cab26f9bf9247567e48f625f6d')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	# Set CARGO_HOME to "${srcdir}/cargo"
	export CARGO_HOME="${srcdir}/cargo"
	if [ ! -d "${_pkgname}/dist" ]; then 
			mkdir "${_pkgname}/dist"
	fi
	
	# Download Rust dependencies
	cd "${_pkgname}"
	cargo fetch
}

build() {
	cd "${_pkgname}"
	cargo build --release # --frozen removed because some csv failed to download althought everything required was already download
	# will debug later
}

package() {
	# Set CARGO_HOME to "${srcdir}/cargo"
	export CARGO_HOME="${srcdir}/cargo"

	# Install desktop file
	install -Dm644 "${srcdir}/chat-gpt.desktop" -t "${pkgdir}/usr/share/applications"

	# Install binary
	install -Dm755 "${srcdir}/${_pkgname}/target/release/chatgpt" \
		"${pkgdir}/usr/bin/chat-gpt"

	# Generate and install Icons
	for size in 8 16 20 22 24 32 48 64 96 128 192 256 512; do
		install -dm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"

		convert -resize ${size}x${size} "${srcdir}/${_pkgname}/public/logo.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chat-gpt.png"
	done

	#for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    #install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    #convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" \
			#"${pkgdir}/usr/share/icons/hicolor/${_size}/apps/chat-gpt.png"
  #done
	

}
