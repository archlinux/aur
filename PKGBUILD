# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>
pkgbase=databend
pkgname=(databend databend-debug)
pkgver=1.2.952
pkgrel=1
epoch=
pkgdesc="Opensource alternative to Snowflake"
arch=('aarch64' 'x86_64')
url="https://github.com/databendlabs/databend/releases"
license=('Apache-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/databend/databend-meta.toml'
        'etc/databend/databend-query.toml')
# Keep upstream binaries as-is (symtab + debuglink); debug info comes from
# upstream's split DWARF in databend-debug, not from makepkg.
options=('!strip' '!debug')
install='databend.install'
changelog=
source=("databend.install")
sha256sums=('b6516eed6b0b3ffc35d914581f2e7bb1ccf1effe92d63df59d48984ebf918332')
sha256sums_aarch64=('4a59e1ae13ae98ce3cbca0cb46dd40ad32d7c03ff21d8d1064c26a3bc63a9ec6'
                    'de87d91bfa27f5d57aa74991d827f5dd18ace63158e4e7a55d6625b646144e92')
sha256sums_x86_64=('e042d4cd6375d880c62ba8eb05c60edb078e54e3d4174274983ad7e47a13ce92'
                   'bd0217ada5354de0124c643c9df7c20dba6c8a8e7a99105e62c6ee7d8d293e01')
source_x86_64=("https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-v${pkgver}-nightly-x86_64-unknown-linux-gnu.tar.gz"
               "https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-debug-default-v${pkgver}-nightly-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-v${pkgver}-nightly-aarch64-unknown-linux-gnu.tar.gz"
                "https://github.com/databendlabs/databend/releases/download/v${pkgver}-nightly/databend-debug-default-v${pkgver}-nightly-aarch64-unknown-linux-gnu.tar.gz")
noextract=()

package_databend() {
  cd "$srcdir"

  # Copy bin in /usr/bin
  mkdir -p $pkgdir/usr/bin
  cp -a bin/* $pkgdir/usr/bin

  # Copy cfg files in /etc
  mkdir -p $pkgdir/etc/databend
  cp -a configs/* $pkgdir/etc/databend

  # Copy systemd files
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp systemd/databend-meta.service $pkgdir/usr/lib/systemd/system
  cp systemd/databend-query.service $pkgdir/usr/lib/systemd/system
}

package_databend-debug() {
  pkgdesc="Upstream detached debug symbols (DWARF) for databend-query"
  depends=("databend=$pkgver-$pkgrel")
  unset backup install
  cd "$srcdir"

  # Found via the binary's .gnu_debuglink (databend-query.debug)
  local dbg="databend-query-default-v${pkgver}-nightly-${CARCH}-unknown-linux-gnu.debug"
  install -Dm644 "$dbg" "$pkgdir/usr/lib/debug/usr/bin/databend-query.debug"

  # Found via build-id (perf, gdb, systemd-coredump)
  local id=$(LC_ALL=C readelf -n bin/databend-query | awk '/Build ID/ {print $3}')
  [[ $id == $(LC_ALL=C readelf -n "$dbg" | awk '/Build ID/ {print $3}') ]] || return 1
  mkdir -p "$pkgdir/usr/lib/debug/.build-id/${id:0:2}"
  ln -s ../../usr/bin/databend-query.debug "$pkgdir/usr/lib/debug/.build-id/${id:0:2}/${id:2}.debug"
}

# vim:set ts=2 sw=2 et:
