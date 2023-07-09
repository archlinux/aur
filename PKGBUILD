# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=alpine
pkgver=2.26
pkgrel=2
arch=('x86_64' 'i686' 'armv6h' 'armv6l' 'armv7h' 'armv7l' 'aarch64')
pkgdesc="A free software email client, a rewrite of Pine which was a continuation of the venerable ELM."
url="https://alpineapp.email/"
license=('APACHE')
depends=('gettext' 'krb5' 'libldap' 'pam')
optdepends=('aspell: for spell-checking support'
	'hunspell: for spell-checking support'
	'topal: glue program that links GnuPG and alpine')
provides=('pico' 'pine' 're-alpine')
conflicts=('pico' 'pine' 're-alpine' 'alpine-fancythreading')
replaces=('pico' 'pine' 're-alpine' 'alpine-fancythreading')
options=('!makeflags')
source=("https://alpineapp.email/alpine/release/src/alpine-${pkgver}.tar.xz"
	"maildir-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/maildir.patch.gz"
	"fancy-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/fancy.patch.gz"
	"fillpara-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/fillpara.patch.gz"
	"compose-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/compose.patch.gz"
	"longurl-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/longurl.patch.gz")
sha256sums=('c0779c2be6c47d30554854a3e14ef5e36539502b331068851329275898a9baba'
	'01020ca0cec24793a39d5ab72c0beefc0cfbb92d11348b5bd5bf7bfbcb203f63'
	'c178459dd885e4caa32640e5ce63c689ec4752a1e039ddb149e034b935fe5181'
	'960bb9656353529964e86f0f782bf032f9aae36af9493ed7f2c8ccfd5695330f'
	'013d31d95dbf6e31c1ebfdcb745481cf31fd0df466b81e077a7538dcfe75a9f4'
	'b29b4b6f8986c4c07ce2db21b6ff27341b4f7c0844c3dee8c1c63b0536fc88b2')


build() {
	cd "${pkgname}-${pkgver}"

	# Apply select patches to Alpine
	# https://alpineapp.email/alpine/
	# Maildir patch
	patch -p1 -i "${srcdir}/fancy-${pkgver}.patch"
	# Fancy Thread Interface
	patch -p1 -i "${srcdir}/maildir-${pkgver}.patch"
	# Justify paragraphs that contain more than one level of quoting
	patch -p1 -i "${srcdir}/fillpara-${pkgver}.patch"
	# Add new subcommands to the compose command
	patch -p1 -i "${srcdir}/compose-${pkgver}.patch"
	# Recognize multiline URLs
	patch -p1 -i "${srcdir}/longurl-${pkgver}.patch"

	# Configure Alpine
	LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
	--with-passfile=.alpine.passfile --without-tcl --disable-shared \
	--with-system-pinerc=/etc/${pkgname}.d/pine.conf \
	--with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed

	# Build Alpine
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	# Install Alpine
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
	install -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
	install -m644 README.maildir "${pkgdir}/usr/share/doc/${pkgname}/README.maildir"
}
