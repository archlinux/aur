# Maintainer: rany <ranygh at riseup dot net>

pkgname=popura
_pkgname="popura"
pkgver=0.4.6
_commit=e6ee65440d6835523d8f05a5baa174a0056f160f
pkgrel=1
pkgdesc="Popura ポプラ: alternative Yggdrasil network client"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/popura-network/Popura"
license=('LGPLv3')
conflicts=('popura' 'yggdrasil' 'yggdrasil-git' 'yggdrasil' 'yggdrasil-openrc')
depends=('glibc')
makedepends=('git' 'go')
source=("popura::git+https://github.com/popura-network/Popura.git#commit=${_commit}"
	'popura.sysusers')
sha512sums=('SKIP'
	'b78d1f5efeeba184588ba7bdb2249d976aec160daa59742e032983da1aedad062d15c7c97cba3eba69412a0f7904ee123d98b58f859892d71188c25624295c32')

build() {
	cd "${srcdir}/${_pkgname}"
	PKGNAME="${pkgname}" PKGVER="${pkgver}" \
		CGO_LDFLAGS="${LDFLAGS}" \
		GOFLAGS="-trimpath -buildmode=pie -mod=readonly" \
		./build -l "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 "${srcdir}/popura.sysusers" "${pkgdir}/usr/lib/sysusers.d/popura.conf"
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" \
		contrib/systemd/yggdrasil.service \
		contrib/systemd/yggdrasil-default-config.service
}
