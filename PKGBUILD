# Maintainer: fossdd <fossdd@pwned.life>

pkgname=valkey-git
_pkgname=valkey
pkgver=r12186.125a2987a
pkgrel=1
pkgdesc='A new project to resume development on the formerly open-source Redis project (development version)'
arch=('x86_64')
url="https://github.com/$_pkgname-io/$_pkgname"
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('jemalloc' 'grep' 'shadow' 'systemd-libs')
# pkg-config fails to detect systemd libraries if systemd is not installed
makedepends=('systemd' 'openssl')
backup=("etc/$_pkgname/$_pkgname.conf"
        "etc/$_pkgname/sentinel.conf")

source=("git+$url.git"
        $_pkgname.service
        $_pkgname-sentinel.service
        $_pkgname.sysusers
        $_pkgname.tmpfiles
        $_pkgname.conf-sane-defaults.patch
        $_pkgname-5.0-use-system-jemalloc.patch)
sha512sums=('SKIP'
            '286ce5be525166814f8ffce64fdb8ddc3abbaefe75bfc3044e8a4ee2111359fda3b35b3e548538bc05e4393bb4f5c716f549a23d069e5c1f4327b9a60594fbb9'
            '8cb8aab70192b83ee90b184ae2115f401c95539296ffcd3e1888ae3134aaf32380969f1360a52d259628a78113f760f8677591cb050d561f6abe35749df1c30e'
            '21f7bf33bdabb4ab783e440f9991875cb3b50c3f640e9cc999970e80c1931431bf7e7794aaf6daf9c8b35365ddfa475c7d752f55cf61834699cabd302795d427'
            '11cf6d6999329af7a9fa4bcbbcf22242b461cec0c16ad949cc6b0383703f19417092782569bf6224f94167a560de0b4ba53ec0d8522683736a14f01bc5986b28'
            '5ec15f8380c9e0515f120288ea8b53e62c754054e5c51c30ca7e60f0293b36c82ab3e3c5f8373b3eff9d98378849a6fba0d12b7088c7c63ca46464410a645dc8'
            '0acb08a6e0eaba239db7461bcfeddfbe0c1aaa517dc33c3918c9e991a1d5067cfe135b7f75085caade8c3ababd51ec9cefcc4120f57818bea1f7029a548a7732')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../$_pkgname.conf-sane-defaults.patch
	patch -Np1 < ../$_pkgname-5.0-use-system-jemalloc.patch
}

build() {
	make BUILD_TLS=yes \
		USE_SYSTEMD=yes \
		-C $_pkgname
}

check() {
	make test \
		BUILD_TLS=yes \
		USE_SYSTEMD=yes \
		-C $_pkgname
	}

package() {
	cd $_pkgname

	# make install
	make PREFIX="$pkgdir"/usr install

	# configuration files
	install -Dm644 -t "$pkgdir"/etc/$_pkgname $_pkgname.conf sentinel.conf

	# systemd integration
	install -Dm644 -t "$pkgdir"/usr/lib/systemd/system/ ../$_pkgname.service ../$_pkgname-sentinel.service
	install -Dm644 "$srcdir"/$_pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf
	install -Dm644 "$srcdir"/$_pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf

	# license
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
