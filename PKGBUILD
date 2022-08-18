# Maintainer: Stetsed <aur.arch@stetsed.xyz>
# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=hydroxide
pkgver=0.2.23
pkgrel=4
pkgdesc="A third-party, open-source ProtonMail CardDAV, IMAP and SMTP bridge"
arch=('x86_64')
url="https://github.com/emersion/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
	"0001-Update-API-endpoint-and-version-set-User-Agent.patch"
	"hydroxide.sysusers"
        "system.service"
        "user.service")
sha512sums=('9f2c9b59cb7c1dfcfec9cc626767f340b1d5caea4db69e81de6b87c4bcf26840d14cd6568a0d3aad36d8e31184e2f1827a5e27745338bc2f38265ce64fe2d4a4'
            'SKIP'
            '84cd284934e76f8bb33081a720c14261415fc9a5c372e5fe6e31a6bfac0eb0366d3ae73a2250be318bb365ced8f320f1137477cd25f053c4f7f59238bb8e039c'
            '6059e92f5ceeb97f601c12a7539dacc0dbd4de5ffd69deaf36ac6630c6975b2a5e870b932783d3c4dab44bc89738fed1ca4637ec600a723cc198e7e783807fc2'
            'a24ef92971655fc6ab30fb6d99aa4f30be51816d042496403e43a0274a6f3bc7d91f7b89b960fc01b7393487b13a584d7af8305e95e7c0736bf9c0ed8248f99a'
            '1890e0e1df999242f66ce8fe4744e5ae18c38f8780adddd903e466d1c2d5ac8fffb3c840f6d60e897bd14c7355b8784a784e5be76ddf6a54a44718e0b27edce0')
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
	patch -p1 < ../0001-Update-API-endpoint-and-version-set-User-Agent.patch
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
