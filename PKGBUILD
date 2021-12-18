# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: nofxx <x@<nick>.com>

pkgname="keydb"
pkgver="6.2.1"
pkgrel=1
arch=("aarch64" "i686" "x86_64")
pkgdesc="A Multithreaded fork of Redis."
url="https://keydb.dev"
license=("BSD")
depends=(
	"grep"
	"libatomic_ops"
	"numactl"
	"shadow"
	"systemd-libs"
)
if [ "$USE_TCMALLOC" = "yes" ]; then
	depends+=("gperftools")
	mallocprov="tcmalloc"
elif [ "$USE_TCMALLOC_MINIMAL" = "yes" ]; then
	depends+=("gperftools")
	mallocprov="tcmalloc_minimal"
elif [ "$USE_JEMALLOC" = "yes" ]; then
	depends+=("jemalloc")
	mallocprov="jemalloc"
elif [ "$USE_JEMALLOC" = "no" ]; then
	# Glibc's malloc() is used in this case.
	mallocprov="libc"
# This env variable isn't "checked" by KeyDB but we add it in for completion's sake.
elif [ "$USE_MEMKIND" = "yes" ]; then
	mallocprov="memkind"
else
	depends+=("jemalloc")
	mallocprov="jemalloc"
fi
makedepends=(
	"curl"
	"git"
	"nasm"
	"openssl"
	"systemd"
	"tcl"
)
provides=(
	"redis=6.2.6"
)
backup=(
	"etc/keydb/keydb.conf"
	"etc/keydb/sentinel.conf"
)
install="keydb.install"
source=(
	"https://github.com/JohnSully/KeyDB/archive/v$pkgver.tar.gz"
	"keydb-5.0-use-system-jemalloc.patch"
	"keydb.conf-sane-defaults.patch"
	"keydb-sentinel.service"
	"keydb.service"
	"keydb.sysusers"
	"keydb.tmpfiles"
)
b2sums=(
	"SKIP"
	"3a17d2f6fd3d393a171723abacd95613343dd98a80154a89c54d2591fecf66ec1e0615b8bff8bf9471abf09335e17c9a9b8cafd1b924bc969cfb21ba6b37db28"
	"94f3e2e44eb29f2454a080a46be38529a70acb8a23ba35266bf4a2dcc4d015c622366586568f1eb6fbcd3cd99b7c95fec4601712265b32e12abda7ba2748e74a"
	"87aa7478470fa2c3beee1ad68e9e7de9df26d3c4d0cf5ec2e3724a2cdabd6b767cf88d449e0fbd1598930d68412271ea4df82ae77803c43ff9a0fbfef1e511c3"
	"fe8c267009a540c6a4be199c103d80599639fe7b115c826418111ce7f3719e06c0a9852654fc3cbc44124cd938904cd57db8701dd19fbff55ef397961453b30c"
	"1928beb72b05776bc78150e1bdc4786a3ce9591780af4a06ff2dd120136bd9702b8b72171dd0aa5d99f1006611d04c3ae9e95ffbe3e05f42ae7efbaa0ab785e6"
	"13b8914801119ae22b992bd15068cb1fe2cc40021901111c6eaab1c6bfc98c24d202928807bde85f20af197b5d5ab2acbbff97cf7bf22668b86874326edf4b16"
)

prepare()
{
	cd "KeyDB-$pkgver" || exit 1
	patch -Np1 < "../keydb.conf-sane-defaults.patch"
	patch -Np1 < "../keydb-5.0-use-system-jemalloc.patch"
}

build() {
	export LDFLAGS="$LDFLAGS -latomic"
	make BUILD_TLS="yes" USE_SYSTEMD="yes" MALLOC="$mallocprov" -C "KeyDB-$pkgver"
}

check()
{
	cd "KeyDB-$pkgver" || exit 1
	# TODO: Allow tests to run successfully in Makepkg's fakeroot environment.
	# make test
}

package()
{
	cd "KeyDB-$pkgver" || exit 1
	make PREFIX="$pkgdir/usr" install
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 -t "$pkgdir/etc/keydb" "keydb.conf" "sentinel.conf"
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../keydb.service" "../keydb-sentinel.service"
	install -Dm644 "../keydb.sysusers" "$pkgdir/usr/lib/sysusers.d/keydb.conf"
	install -Dm644 "../keydb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/keydb.conf"
}
