# Maintainer: Ruben Kharel <talkto@rubenk.com.np>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=chatgpt-desktop-git
_pkgname=ChatGPT
pkgver=0.10.3+r5+g7836c12
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
             "rust"
             "git")
depends=("hicolor-icon-theme"
         "openssl"
         "webkit2gtk")
source=("git+https://github.com/lencx/ChatGPT.git"
        chat-gpt.desktop)
md5sums=('SKIP'
         '522e34cab26f9bf9247567e48f625f6d')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
	mkdir "${_pkgname}/dist"
}

build() {
	cd "${_pkgname}"
	cargo build --release
}

package() {
	# Install desktop file
	install -Dm644 "${srcdir}/chat-gpt.desktop" -t "${pkgdir}/usr/share/applications"

	# Install binary
	install -Dm755 "${srcdir}/${_pkgname}/target/release/chatgpt" \
		"${pkgdir}/usr/bin/chat-gpt"

	# Generate and install Icons
	for size in 32 64 128 256 512; do
		install -dm 755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"

		convert -resize ${size}x${size} "${srcdir}/${_pkgname}/public/logo.png" \
			"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chat-gpt.png"
	done
}
