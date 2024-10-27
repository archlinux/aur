# Maintainer: fossdd <fossdd@pwned.life>

pkgname=redict-rc
_pkgname=redict
_pkgver=7.3.1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc='A distributed key/value database (release candidate)'
arch=('x86_64')
url="https://codeberg.org/$_pkgname/$_pkgname"
license=('LGPL-3.0-only')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-db-git")
depends=('jemalloc' 'grep' 'shadow' 'systemd-libs')
# pkg-config fails to detect systemd libraries if systemd is not installed
makedepends=('systemd' 'openssl')
backup=("etc/$_pkgname/$_pkgname.conf"
        "etc/$_pkgname/sentinel.conf")

source=("git+$url.git#tag=$_pkgver"
        $_pkgname.service
        $_pkgname-sentinel.service
        $_pkgname.sysusers
        $_pkgname.tmpfiles
        $_pkgname.conf-sane-defaults.patch
        $_pkgname-5.0-use-system-jemalloc.patch)
sha512sums=('15bd7533cbee0c51f21c80e2ec4714c9a4f9b59deb289b7dea59ac69ef55332b3f4e9b3636853e0a32201796a332959b86c4e7b901506caab7e74a8b63aea3e6'
            'bafdd8d5bb16eb651e6dbed2fbd85c8a2264e5063cdc590add10f79879cb0e3dd3ea65635cb0f2502b272b9ad08704461ebec2523eb5263130ae01b1e5fc6983'
            'b72ee96c78e9c2e760f8241f109c7c91ebf0d5ba699af7e05e28e0f4eab8864e43673fca074a11730223e22b93f109c9739ea92f429332f7dc37ae8d6d7ad691'
            '94556abeb7eba84d428130e9a0848865ddfa354e7652ec7a1a1d9ad4100a95fea92ce2be55abcf98b1ae176cc204d475e43294bb901c7aee3fa6cefbd759c8be'
            'ecb0ecc6cb0470227834033eefd8f44e4ee83a0554059c9c01d8ce95182fc74b93a8cf75e148ecf449f9b0831ab0ee846929352afded3b20c6811c2c76ab60ea'
            '27e800b8514657aa8639ade7547f5ecdcbf56d656e1f268838b2423a1c943a657a3f198023917cc3de974aa9c32915872d4468e6b203d62f44a27cd78d80b319'
            '0acb08a6e0eaba239db7461bcfeddfbe0c1aaa517dc33c3918c9e991a1d5067cfe135b7f75085caade8c3ababd51ec9cefcc4120f57818bea1f7029a548a7732')

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

	# licenses
	mkdir -p "$pkgdir"/usr/share/licenses/$_pkgname
	cp -vr LICENSES/* "$pkgdir"/usr/share/licenses/$_pkgname
}
