# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=libpassphrase
pkgver=1449331105
pkgrel=1
pkgdesc="Personalisable library for TTY passphrase reading"
url="https://github.com/GNU-Pony/libpassphrase"
arch=(i686 x86_64 armv6h)
license=(GPL3)
depends=(glibc)
makedepends=(make coreutils gcc texinfo)
optdepends=('passcheck: for strength meter')
install=libpassphrase.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(76044a7af93dd6a956c6fb9a13af711a2c90b260420a2bf1b272d624deefafb7)


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
	options+=( PASSPHRASE_METER )     # Enable strength meter for new passphrases
	## see `info '(libpassphrase)' configuring` for details
	
	star_char="*"
	text_empty="(empty)"
	text_not_empty="(not empty)"
	text_strength="Strength:"
	
	make PKGNAME="${pkgname}" OPTIONS="${options[*]}"   \
	     PASSPHRASE_STAR_CHAR="${star_char}"            \
	     PASSPHRASE_TEXT_EMPTY="${text_empty}"          \
	     PASSPHRASE_TEXT_NOT_EMPTY="${text_not_empty}"  \
	     PASSPHRASE_TEXT_STRENGTH="${text_strength}"
	## it is also possible to add PASSPHRASE_STRENGTH_LIMITS_HEADER
}

package() {
	cd "${srcdir}/libpassphrase-${pkgver}"
	
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

