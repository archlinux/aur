# Maintainer: Marek Samec
_pkgname=qt-msg-reader
pkgname=qt-msg-reader-bin
pkgver=1.0.0
pkgrel=1
# GitHub release tag to pull the prebuilt package from. This is deliberately
# a separate variable rather than "v$pkgver": the release workflow tags from
# its own version input while the .pkg.tar.zst asset is named from the
# CMakeLists.txt project version, so the two do not currently match (tag
# v1.0.1 ships a qt-msg-reader-1.0.0-1 package). Bump both by hand.
_tag=v1.0.1
# pkgrel baked into the upstream asset's filename, independent of this
# package's own pkgrel above.
_assetrel=1
pkgdesc="A Qt-based application for reading Microsoft Outlook MSG files (prebuilt binary)"
arch=('x86_64')
url="https://github.com/mareksamec/$_pkgname"
license=('MIT')
depends=('qt6-base' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# The upstream asset name is identical across releases (it carries the
# CMake version, not the tag), so it gets renamed locally to keep a shared
# SRCDEST cache from serving a stale download for a different tag.
_srcfile="$pkgname-$pkgver-$_tag.pkg.tar.zst"
source=("$_srcfile::$url/releases/download/$_tag/$_pkgname-$pkgver-$_assetrel-$CARCH.pkg.tar.zst")
sha256sums=('0df9fb9bdb5725e255155844adedd79b78ee371564a4814e643512534a074b81')
# The source *is* a built pacman package - unpacking it into $srcdir would
# just scatter its metadata there, so package() extracts what it needs.
noextract=("$_srcfile")
# Nothing to strip or split out: the binary was already stripped by makepkg
# when the upstream package was built.
options=('!strip' '!debug')

package() {
    bsdtar -xf "$srcdir/$_srcfile" -C "$pkgdir" usr

    # The upstream package files its license under the source package's
    # name; move it so it lands under this package's name instead.
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
