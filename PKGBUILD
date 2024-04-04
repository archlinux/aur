# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>

pkgbase=nix-git
pkgname=(nix-git nix-docs-git)
_pkgname=${pkgbase%-git}
pkgver=2.2.r10010.g50cb14f
pkgrel=1
pkgdesc='A purely functional package manager'
arch=(x86_64 i686)
url="https://nixos.org/$_pkgname"
license=(LGPL2)
makedepends=(autoconf-archive
             aws-crt-cpp
             aws-sdk-cpp
             boost
             brotli
             bzip2
             curl
             editline
             gc
             git
             graphviz
             gtest
             jq
             libcpuid
             libgit2
             libseccomp
             libsodium
             lowdown
             mdbook
             mdbook-linkcheck
             nix-busybox
             nlohmann-json
             openssl
             rapidcheck
             sqlite)
source=("$_pkgname::git+https://github.com/NixOS/nix.git"
        nix.conf
        sysusers.conf
        tmpfiles.conf
        user.environment.conf
        user.tmpfiles.conf)
sha256sums=('SKIP'
            'cf3c7a3a24ac0f553b6fd8ba6adb8f1375d8675911af12c4db94918a799f688e'
            'cf6caa02e0b5224332c5945ba6fa08b1517802898290e6c2eb96046cad9598d8'
            'f078cb60bdd549e9cb3b9af3dfacd33e1b7f16a7e7c02904f50f08bfc8c0d952'
            'e45e45394a119a4ef2046a4a39403dda2df2af820c2d116763031c4689fc5717'
            'c353524861487ef7f7e862bdaaa70e2a3a29e08d2ee31947ebf9e01237c5c50d')

prepare() {
	cd "$_pkgname"
	sed -i "s:\$(bindir):src/nix:g" doc/manual/local.mk
	autoreconf -vfi
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' \
	./configure \
		--prefix=/usr \
		--libexecdir="/usr/lib/$_pkgname" \
		--sysconfdir=/etc \
		--localstatedir=/nix/var \
		--with-sandbox-shell=/usr/lib/nix/busybox \
		--enable-static=rapidcheck \
		--enable-gc \
		--enable-lto
	make
}

package_nix-git() {
	depends=(aws-crt-cpp
	         aws-sdk-cpp
	         boost-libs
	         brotli
	         curl
	         editline
	         gc
	         gcc-libs
	         glibc
	         libarchive
	         libcpuid
	         libseccomp
	         libsodium
	         lowdown
	         nix-busybox
	         openssl
	         sqlite)
	provides=("$_pkgname=$pkgver")
	conflicts=("$_pkgname")
	backup=("etc/$_pkgname/$_pkgname.conf")
	install="$_pkgname.install"
	install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname-daemon.conf"
	install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname-daemon.conf"
	install -vDm644 user.tmpfiles.conf "$pkgdir/usr/share/user-tmpfiles.d/$_pkgname-daemon.conf"
	install -vDm644 user.environment.conf "$pkgdir/usr/lib/environment.d/$_pkgname-daemon.conf"
	install -vDm644 nix.conf -t "$pkgdir/etc/$_pkgname"
	cd "$_pkgname"
	make DESTDIR="$pkgdir" install
	rm -rf \
		"$pkgdir/etc/init" \
		"$pkgdir/etc/profile.d/nix.sh" \
		"$pkgdir/etc/profile.d/nix.fish"
	mv "$pkgdir/usr/share/doc" nix-docs
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}

package_nix-docs-git() {
	pkgdesc+=" (documentation)"
	cd "$_pkgname"
	install -vd "$pkgdir/usr/share/doc"
	mv nix-docs/nix "$pkgdir/usr/share/doc"
}
