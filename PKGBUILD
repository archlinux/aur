# Maintainer: rany <rany at i2pmail dot org>

pkgname=popura-git
_pkgname="popura"
pkgver=0.3.15+popura1
_commit=42941caaf13472f1ecc0c675ae6059a857f3e60a
pkgrel=5
pkgdesc="Popura ポプラ: alternative Yggdrasil network client"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/popura-network/Popura"
license=('LGPLv3')
conflicts=('popura')
makedepends=('git' 'go')
backup=(etc/default/popura)
source=("popura::git+https://github.com/popura-network/Popura.git#commit=${_commit}"
	'popura.sysusers'
	'popura-default-config.service'
	'popura.service'
        'popura.defaults'
	'popura.apparmor')
sha512sums=('SKIP'
	'af276973744e079e6892d8ecdf2027ea265a05908f624f82da35d5bcc77a91ddeb458c4c3d07341aae42f003189201d3989cce5f87e184e472c1a23112cfe554'
	'449da220d0e7f502268adb302a2672315e37dc0a08a7923727eec6eb9f49fdc803ac0240508e62920edd826c6d294cec238485edebb5250228fa35eb20e544fb'
	'ab2d69471c6b9fb6ac85212057feda5159b74b88f0247e8af74e09092878cc75a112f0aad0d776df337ba348f521e1960c1ce1dbc6fe0ac50de96d1aea9e4a1a'
	'6a74ae04dc12987c246ad07bf04362e2b076939f3a91c9dff89dbbae9b443762b7dd39fb3aca46e028032fc4a3dd7910a9dfc9622e8c66d8e00862d6e9f5b9ce'
	'8912a0dcbd61d412303e584946e38a7d7771fee61202e2d70f693dbdbae2ea37b2a9d4f342c7b1c5c875c7fcd98225331aff4206ddc452d1feed45dbde21b382')

build() {
	cd "${srcdir}/${_pkgname}"
	export GOPATH="${srcdir}/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	./build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/popura"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/popuractl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 "${srcdir}/popura.sysusers" "${pkgdir}/usr/lib/sysusers.d/popura.conf"
	install -Dm644 "${srcdir}/popura.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/popura-default-config.service" -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/popura.defaults" "${pkgdir}/etc/default/popura"
	install -Dm644 "${srcdir}/popura.apparmor" "${pkgdir}/etc/apparmor.d/usr.bin.popura"
}
