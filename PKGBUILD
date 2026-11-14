# Maintainer: ryoskzypu <ryoskzypu@proton.me>
# Contributor: monkfish
#
# Why does this package exist?
#   Arch's locale-gen script, which ships with the glibc package appears to not
#   compile the C.UTF-8 locale correctly when used together with other locales.
#
#   This was discovered using perl's POSIX module. Installing Gentoo's locale-gen
#   fixes the issue.
#
#   See:
#     https://gist.github.com/ryoskzypu/827a6a1e041133b074ebcf19516066c7 (context)
#     https://asciinema.org/a/3Uiq1UtbpepgCUVD (reproducing)
#
# NOTE:
#   locale-gen script is renamed to lc-gen.
#
#   Rationale:
#     locale-gen depends on glibc package for the locale stuff, therefore glibc
#     owns /usr/bin/locale-gen, causing pacman to complain about conflicting files.
#
#   Do not forget to uncomment the desired locales in /etc/locale.gen or lc-gen
#   will compile all supported locales. See locale.gen(5), locale-gen(8).

pkgname=locale-gen
pkgver=3.10
pkgrel=2
pkgdesc='Generate locales based upon the config file /etc/locale.gen'
arch=('any')
url=https://gitweb.gentoo.org/proj/locale-gen.git/
license=('GPL-2.0-only')
depends=(
    'glibc'
    'perl>=5.36'
)
makedepends=(
    'git'
    'perl-file-slurper'
)
install=locale-gen.install
source=(
    "$pkgname::git+https://gitweb.gentoo.org/proj/locale-gen.git#tag=$pkgname-$pkgver"
    '10-glibc-locale-gen.hook'
)
sha256sums=(
    '343b5395d0f4930b162a7cc9a8c19d7740a9829dec0fbacde25d2b2abb3c0a29'
    '8ebea66fab929d3dd8178fbdb2bc32918ac412fd20b7651032d8ee999719cedf'
)

# https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-apps/locale-gen/locale-gen-3.10.ebuild
package()
{
    cd "$pkgname"
    mv locale-gen lc-gen

    install -Dm755 lc-gen       -t "$pkgdir/usr/bin/"
    install -Dm755 locale-gen.8 -t "$pkgdir/usr/share/man/man8/"
    install -Dm755 locale.gen.5 -t "$pkgdir/usr/share/man/man5/"
    install -Dm644 COPYING      -t "$pkgdir/usr/share/licenses/$pkgname/"

    # Override the glibc hook to prevent it from generating wrong locales.
    # https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/blob/main/10-glibc-locale-gen.hook
    install -Dm644 ../10-glibc-locale-gen.hook -t "$pkgdir/etc/pacman.d/hooks/"

    # Install the simplified locale.gen config as reference.
    { cat <<-'END' && ./mkconfig; } > locale.gen
	# This file defines which locales to incorporate into the glibc locale archive.
	# See the locale.gen(5) and locale-gen(8) man pages for more details.
	
	END

    install -Dm644 locale.gen -t "$pkgdir/usr/share/doc/$pkgname/"
}
