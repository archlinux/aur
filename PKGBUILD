# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="keydb"
pkgver=5.3.3
pkgrel=1
pkgdesc="A Multithreaded Fork of Redis"
arch=(
	"i686"
	"x86_64"
)
url="https://keydb.dev"
license=(
	"BSD"
)
depends=(
	"jemalloc"
	"libatomic_ops"
	"numactl"
)
makedepends=(
	"curl"
	"git"
	"nasm"
	"tcl"
)
provides=(
	"redis"
)
backup=(
	"etc/logrotate.d/keydb"
	"etc/keydb.conf"
)
source=(
	"https://github.com/JohnSully/KeyDB/archive/v5.3.3.tar.gz"
	"keydb-5.0-use-system-jemalloc.patch"
	"keydb.conf-sane-defaults.patch"
	"keydb.logrotate"
	"keydb.service"
	"keydb.sysusers"
	"keydb.tmpfiles"
)
b2sums=(
	"SKIP"
	"3a988f7c0ec1c1f0fbbf2ff706e249152c729dd8f3a2dea93a51a3d119d13705a7e76bef26a85f843da9c811a1f97d0dc166d4a665759d66a2629779ab68096b"
	"be5d54cf71722583bca64e99fab8d25266bde471b062aaa1efc8fc326d1a0560f1baed42b9b7aad2f8dc7fab83a05a23e86995741c7f6fc4386fa8283ec583b4"
	"1c1f033380b97582319ae1c40def456908fc5416680a59061be9f88b213501f15b4e120dbde2c8013a4abb44ccd00668328c72d65802025b4373f311dcaeb50f"
	"afc40d2444e823beb2ebe612c928a26b803602bb24ee3a14597c1b9238b8af7c949a2aea513137e2d83b302746056846d9363484590d3406e8653cd99981be57"
	"1928beb72b05776bc78150e1bdc4786a3ce9591780af4a06ff2dd120136bd9702b8b72171dd0aa5d99f1006611d04c3ae9e95ffbe3e05f42ae7efbaa0ab785e6"
	"d93a88d286698163e9f29fe77a15eb60c0afc028b5343b6bf195da0a123857463c36496a1a378c87fa263f7e901b73db07bf7e47f57a2172b50f0e8502de6fbd"
)

prepare()
{
	cd "KeyDB-$pkgver" || exit
	patch "keydb.conf" < ../keydb.conf-sane-defaults.patch
	patch "src/Makefile" < ../keydb-5.0-use-system-jemalloc.patch
}

build()
{
	#* Clang nee
	export LDFLAGS="$LDFLAGS -latomic"

	make BUILD_TLS=yes -C "KeyDB-$pkgver"
}

check()
{
	cd "KeyDB-$pkgver" || exit

	#! The test is currently broken in makepkg's environment
	#make test
}

package()
{
	cd "KeyDB-$pkgver" || exit
	make PREFIX="$pkgdir/usr" install

	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "keydb.conf" "$pkgdir/etc/keydb.conf"
	install -Dm644 "../keydb.service" "$pkgdir/usr/lib/systemd/system/keydb.service"

	#* Files kept for compatibility with older installations
	install -Dm644 "../keydb.logrotate" "$pkgdir/etc/logrotate.d/keydb"

	ln -sf "keydb-server" "$pkgdir/usr/bin/keydb-sentinel"

	install -Dm644 "../keydb.sysusers" "$pkgdir/usr/lib/sysusers.d/keydb.conf"
	install -Dm644 "../keydb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/keydb.conf"
}
