# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=alpine
pkgver=2.24
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="A free software email client, a rewrite of Pine which was a continuation of the venerable ELM."
url="http://alpine.x10host.com/"
license=('APACHE')
depends=('gettext' 'krb5' 'libldap' 'pam')
optdepends=('aspell: for spell-checking support'
			'hunspell: for spell-checking support'
			'topal: glue program that links GnuPG and alpine')
provides=('pico' 'pine' 're-alpine')
conflicts=('pico' 'pine' 're-alpine' 'alpine-fancythreading')
replaces=('pico' 'pine' 're-alpine' 'alpine-fancythreading')
options=('!makeflags')
source=("http://alpine.x10host.com/alpine/release/src/alpine-2.24.tar.xz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.24/maildir.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.24/fancy.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.24/fillpara.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.24/compose.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.24/longurl.patch.gz")
sha256sums=('651a9ffa0a29e2b646a0a6e0d5a2c8c50f27a07a26a61640b7c783d06d0abcef'
			'bae1dbb4727b2049e50a42c9bbf3b7cd15fa7dee4e8f0a554bc344c85e9043b5'
			'8d8a180eb30b4b015d9704347b7bc24e19df72b0a887fe97b3a0716135f9deb7'
			'ed3f81e7871361d6ee31ba78ea2ebc3f8c23b72be48de94d62cfaba38a53fb84'
			'e29099207a21561feb2e9d25ce978aa73b184898701efe3ca29bb2f1b4451853'
			'072bee67499ecfd7237fba4ce354f88c1df1216cf23ba9699e0c3acf3198eca1')


build() {
	cd "${pkgname}-${pkgver}"

	# Apply select patches to Alpine
	# http://alpine.x10host.com/alpine/
	# Maildir patch
	patch -p1 -i "${srcdir}/fancy.patch"
	# Fancy Thread Interface
	patch -p1 -i "${srcdir}/maildir.patch"
	# Justify paragraphs that contain more than one level of quoting
	patch -p1 -i "${srcdir}/fillpara.patch"
	# Add new subcommands to the compose command
	patch -p1 -i "${srcdir}/compose.patch"
	# Recognize multiline URLs
	patch -p1 -i "${srcdir}/longurl.patch"

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
