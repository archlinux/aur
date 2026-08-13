# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>

pkgname=anytype-alpha-bin
_pkgname=anytype
pkgver=0.56.3_alpha
pkgrel=1
pkgdesc="Operating environment for the new internet (Anytype)"
arch=('x86_64')
url="https://anytype.io"
license=('LicenseRef-ASAL-1.0')
depends=('alsa-lib' 'glibc' 'gcc-libs' 'glib2' 'hicolor-icon-theme' 'libsecret' 'nspr' 'nss')

optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy'
           'anytype-electron-bin'
           'anytype-bin')
options=('!debug')
source=(
	"anytype-${pkgver//_/-}.deb::https://github.com/anyproto/anytype-ts/releases/download/v${pkgver//_/-}/anytype_${pkgver//_/-}_amd64.deb"
	"LICENSE-${pkgver//_/-}.md::https://raw.githubusercontent.com/anyproto/anytype-ts/refs/tags/v${pkgver//_/-}/LICENSE.md"
)
sha256sums=('aa62220f1d90ebe7ce7388023d4094da33911aa555a1b9d872308363debfe712'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

latestver() {
    gh api --paginate 'repos/anyproto/anytype-ts/releases?per_page=100' --jq '.[] | select(.draft | not) | .assets[]?.name | select(test("^anytype_[0-9.]+-alpha_amd64\\.deb$"))' | sed -E 's/^anytype_//;s/_amd64\.deb$//' | sort -Vu | tail -1 | tr '-' '_'
}

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
    
    install -Dm644 "${srcdir}/LICENSE-${pkgver//_/-}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
