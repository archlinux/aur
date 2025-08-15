# Maintainer : Julian Maingot <julianmaingot@gmail.com>
# Contributor: Nicolas Perrin <booloki@lokizone.net>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Chris Allison <daemon@cca.me.uk>

pkgname=ccextractor-git
pkgver=v0.94.r138.6300bb7
pkgrel=1
pkgdesc="A closed captions and teletext subtitles extractor for video streams."
arch=('x86_64')
url="https://www.ccextractor.org"
license=('GPL')
depends=('gcc-libs' 'tesseract' 'ffmpeg4.4' 'leptonica' 'gpac')
makedepends=('rust' 'clang' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
_commit=6300bb7bca9e21b141db603c9af1e613d80a38aa
source=($pkgname::git+https://github.com/CCExtractor/ccextractor.git#commit=$_commit)
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/$pkgname/linux"
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
  ./autogen.sh
  ./configure --enable-hardsubx
  make ENABLE_HARDSUBX=yes
}

package() {
  cd "$srcdir/$pkgname/linux"
  install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}

# vim:set ts=2 sw=2 et:
