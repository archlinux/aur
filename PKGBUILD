# Maintainer: Stetsed <aur.arch@stetsed.xyz>
# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=hydroxide
pkgver=0.2.26
pkgrel=4
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
url="https://github.com/emersion/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"hydroxide.sysusers"
	"system.service"
	"user.service")
sha512sums=('1d4dfa9de6c489948bf4e76524c53b02e925ee078b34b55067e437a3c27decc297415d4c1b62ad1a928af828ed3c460e4b5890a407be4c02267697a7c1063330'
	'SKIP'
	'6059e92f5ceeb97f601c12a7539dacc0dbd4de5ffd69deaf36ac6630c6975b2a5e870b932783d3c4dab44bc89738fed1ca4637ec600a723cc198e7e783807fc2'
	'a24ef92971655fc6ab30fb6d99aa4f30be51816d042496403e43a0274a6f3bc7d91f7b89b960fc01b7393487b13a584d7af8305e95e7c0736bf9c0ed8248f99a'
	'1890e0e1df999242f66ce8fe4744e5ae18c38f8780adddd903e466d1c2d5ac8fffb3c840f6d60e897bd14c7355b8784a784e5be76ddf6a54a44718e0b27edce0')
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
}

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o build ./cmd/...
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -- "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -- "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 -- "${srcdir}/user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm644 -- "${srcdir}/system.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 -- "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/hydroxide.conf"
}
