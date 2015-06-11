# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libpassphrase
pkgver=1428445396
pkgrel=1
pkgdesc="Personalisable library for TTY passphrase reading"
url="https://github.com/GNU-Pony/libpassphrase"
arch=(i686 x86_64 armv6h)
license=(GPL3)
depends=(glibc)
makedepends=(make coreutils gcc texinfo gzip)
install=libpassphrase.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(6c721c89aeac150a990591193f73e6625a54fbd5e79d709c0adddc3b5ba4c5ca)


build() {
	cd "${srcdir}/libpassphrase-${pkgver}"
	
	options=()
	#options+=( PASSPHRASE_ECHO )      # Do not hide the passphrase
	#options+=( PASSPHRASE_STAR )      # Use '*' for each character instead of no echo
	options+=( PASSPHRASE_TEXT )      # Use '(empty)' and not '(not empty)' instead of no echo
	#options+=( PASSPHRASE_REALLOC )   # Soften security by using `realloc`
	options+=( PASSPHRASE_MOVE )      # Enable move of point
	options+=( PASSPHRASE_INSERT )    # Enable insert mode
	options+=( PASSPHRASE_OVERRIDE )  # Enable override mode
	options+=( PASSPHRASE_DELETE )    # Enable reversed erase command
	options+=( PASSPHRASE_CONTROL )   # Enable use of control key combinations
	options+=( PASSPHRASE_DEDICATED ) # Enable use of dedicated keys
	options+=( DEFAULT_INSERT )       # Use insert mode as default
	options+=( PASSPHRASE_INVALID )   # Prevent duplication of non-initialised memory
	## see `info libpassphrase configuring` for details
	
	star_char="*"
	text_empty="(empty)"
	text_not_empty="(not empty)"
	
	make PKGNAME="${pkgname}" OPTIONS="${options[*]}"   \
	     PASSPHRASE_STAR_CHAR="${star_char}"            \
	     PASSPHRASE_TEXT_EMPTY="${text_empty}"          \
	     PASSPHRASE_TEXT_NOT_EMPTY="${text_not_empty}"
}

package() {
	cd "${srcdir}/libpassphrase-${pkgver}"
	
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

