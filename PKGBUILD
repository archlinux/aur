# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: éclairevoyant
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgbase=nix-git
pkgname=(nix-git perl-nix-git)
_pkgname=${pkgbase%-git}
pkgver=2.2.r15648.gccba158
pkgrel=1
pkgdesc='A purely functional package manager'
arch=(x86_64 i686)
url="https://nixos.org/$_pkgname"
license=(LGPL-2.1-only)
makedepends=(aws-sdk-cpp-core aws-sdk-cpp-iam aws-sdk-cpp-s3
             boost libboost_context.so
             brotli libbrotlienc.so libbrotlidec.so
             bzip2
             curl libcurl.so
             cmake
             editline libeditline.so
             gc
             git
             graphviz
             gtest
             jq
             jsonschema
             kaitai-struct-cpp-stl-runtime
             ksc
             libarchive libarchive.so
             libblake3
             libcpuid libcpuid.so
             libgit2 libgit2.so
             libseccomp libseccomp.so
             libsodium libsodium.so
             lowdown liblowdown.so
             meson
             nix-busybox
             nlohmann-json
             openssl libcrypto.so
             perl
             perl-dbd-sqlite
             rapidcheck
             sqlite libsqlite3.so
             toml11)
source=("$_pkgname::git+https://github.com/NixOS/nix.git"
        sysusers.conf
        nix.conf
        skip-functional-tests.patch
        perl-vendor-path.patch
        remove-unused-sh-files.patch)
sha256sums=('SKIP'
            '973b9c69941b2ca985d94cc67e49711ed5c41778e468e52a412dbdff166450ee'
            '78373deff2519a3acf288a9438b42277e7bc9b2ae5fcaa8ff1070bc08a2dbded'
            '82db97c796becc885187f8f4349d29d7a3e931d5ba11286e3283a9921fe340a0'
            '3ddc550bddf3aecbbda2ab1524c992a01318cc43b219af1d3a2eb0c92200c8f0'
            '326feb3f0d05571e7f830cd009a5853417c6ef6f8833961df2750a1f94ff9712')

prepare() {
	cd "$_pkgname"
	patch -p1 -i ../skip-functional-tests.patch
	patch -p1 -i ../perl-vendor-path.patch
	patch -p1 -i ../remove-unused-sh-files.patch
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	local meson_opts=(
		libstore:sandbox-shell=/usr/lib/nix/busybox
		nix:profile-dir=/etc/profile.d
		bindings=true
		doc-gen=false
		unit-tests=false
	)
	arch-meson "$_pkgname" build ${meson_opts[@]/#/-D }
	meson compile -C build
}

package_nix-git() {
	depends=(aws-sdk-cpp-core aws-sdk-cpp-iam aws-sdk-cpp-s3
	         boost-libs libboost_context.so
	         brotli libbrotlienc.so libbrotlidec.so
	         curl libcurl.so
	         editline libeditline.so
	         gc
	         gcc-libs
	         glibc
	         libarchive libarchive.so
	         libblake3
	         libcpuid libcpuid.so
	         libgit2 libgit2.so
	         libseccomp libseccomp.so
	         libsodium libsodium.so
	         lowdown liblowdown.so
	         nix-busybox
	         nlohmann-json
	         openssl libcrypto.so
	         sqlite libsqlite3.so)
	optdepends=('perl-nix: Perl bindings for Nix')
	provides=("$_pkgname=$pkgver")
	replaces=(nix-docs-git)
	conflicts=("$_pkgname")
	backup=("etc/$_pkgname/$_pkgname.conf")
	DESTDIR="$pkgdir" meson install -C build
	mv "$pkgdir/usr/lib/perl5" perl-nix
	install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname-daemon.conf"
	install -vDm644 nix.conf -t "$pkgdir/etc/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_pkgname/COPYING"
}

package_perl-nix-git() {
	pkgdesc+=' (Perl bindings)'
	depends=(glibc
	         gcc-libs
	         libsodium
	         nix-git
	         perl)
	replaces=(nix-perl)
	install -d "$pkgdir/usr/lib/perl5"
	mv perl-nix/* "$pkgdir/usr/lib/perl5"
}

