# Maintainer: hossbeast <todd DOT freed AT gmail DOT com>

pkgname=bam-build
pkgver=0.8.3
pkgrel=1
pkgdesc="build optimally"
options=(!strip debug)
arch=('x86_64')
url="https://github.com/hossbeast/bam"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'perl')
makedepends=('git')
source=(
  "bam::git+https://github.com/hossbeast/bam#tag=v${pkgver}?signed"
)
sha512sums=('SKIP')
validpgpkeys=('79154EE9C4811D32B814EB88B1B3C76D76638462') # hossbeast

build() {
  mkdir -p build
  cd build
  ../bam/configure
  make
}

package() {
  rm -rf "$pkgdir/usr"
  cp -dR "$srcdir/bam/usr" "$pkgdir/usr"

  # licenses
  install -m755 -d "$pkgdir/usr/share/licenses/bam"
  install -m644 -t "$pkgdir/usr/share/licenses/bam" "$srcdir/bam/LICENSE"

  # binaries
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bam/bam"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bamd/bamd"
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/build/bacon/bacon"

  # docs
  install -m755 -d "$pkgdir/usr/share/bam"
  install -m755 -d "$pkgdir/usr/share/bam/doc"
  install -m644 -t "$pkgdir/usr/share/bam/doc" "$srcdir/bam/README.md"
  install -m644 -t "$pkgdir/usr/share/bam/doc" "$srcdir/bam/CHANGELOG"

  # reference config files
  install -m755 -d "$pkgdir/usr/share/bam/config"
  install -m644 -t "$pkgdir/usr/share/bam/config" "$srcdir/bam/etc/config.bam"
  install -m644 -t "$pkgdir/usr/share/bam/config" "$srcdir/bam/etc/bam/client_config"

  # builtin config files
  install -m755 -d "$pkgdir/etc"
  install -m644 -t "$pkgdir/etc" "$srcdir/bam/etc/config.bam"
  install -m755 -d "$pkgdir/etc/bam"
  install -m644 -t "$pkgdir/etc/bam" "$srcdir/bam/etc/bam/client_config"

  # builtin modules
  cp -dR "$srcdir/bam/builtin-modules" "$pkgdir/usr/share/bam/modules/"
  chmod 0755 $pkgdir/usr/share/bam/modules/**/*.bam

  # builtin plugins
  cp -dR "$srcdir/bam/builtin-plugins" "$pkgdir/usr/share/bam/plugins/"
  chmod 0755 $pkgdir/usr/share/bam/plugins/*

  # perl modules
  local _perldir
  _perldir="$(perl -V:vendorarch | sed "s/^vendorarch='//;s/'\;$//")"

  install -m755 -d "$pkgdir/${_perldir}/bam"
  install -m644 -t "$pkgdir/${_perldir}/bam" "$srcdir/bam/perl/bam/bam.pm"
  install -m644 -t "$pkgdir/${_perldir}/bam" "$srcdir/bam/perl/bam/bech32.pm"
  install -m644 -t "$pkgdir/${_perldir}/bam" "$srcdir/bam/libbacon/perl/bam/bacon.pm"
}
