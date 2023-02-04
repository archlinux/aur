# Maintainer: Ruben Kharel <talkto@rubenk.com.np>
# Contributor: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=chatgpt-desktop-git
_pkgname=ChatGPT
pkgver=v0.10.3.r1.gc293f07
pkgrel=1
pkgdesc="ChatGPT Desktop Application (Mac, Windows and Linux)"
arch=('any')
url="https://github.com/lencx/ChatGPT"
license=("Apache")
provides=("chatgpt-desktop")
conflitct=("chatgpt-desktop")
makedepends=("rustup" "git" "imagemagick")
depends=("openssl-1.1" "webkit2gtk")
md5sums=("SKIP" "538f46d4c0285194f7c89c5c14969f7a")
source=("git+https://github.com/lencx/ChatGPT.git" chatgpt.desktop)

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
	install -Dm644 "${srcdir}/chatgpt.desktop" "${pkgdir}/usr/share/applications/chatgpt.desktop"
	
	# Install binary
	install -Dm755 "${srcdir}/${_pkgname}/target/release/chatgpt" "${pkgdir}/usr/bin/chatgpt"
	
	# Generate and install Icons
  for size in 32 64 128 256 512; do
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps
    
    convert -resize ${size}x${size} ${srcdir}/${_pkgname}/public/logo.png \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/chatgpt.png"
  done
}








