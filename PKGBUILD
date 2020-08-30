# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=alpine
pkgver=2.23
pkgrel=2
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
source=("http://alpine.x10host.com/alpine/release/src/alpine-2.23.tar.xz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.23/maildir.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.23/fancy.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.23/fillpara.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.23/compose.patch.gz"
		"http://alpine.x10host.com/alpine/patches/alpine-2.23/longurl.patch.gz")
sha256sums=('793a61215c005b5fcffb48f642f125915276b7ec7827508dd9e83d4c4da91f7b'
			'e91399e72a57a1f4aba1eb64796d56b7b8abff396ea8b7a491ac249483a0f60b'
			'354580049ab6fc13700eef2ccb99cf48d83a1dc84b00f1d9b62e5deee95aa311'
			'14e10307df9ca1fb49489fe8ea1b560dd561f96f7aa525ff839f5ebc94a69419'
			'7b7dbcd05ef72e2cee5a86d61a792a315214e41bbcfc1fd1c1846c038a031e59'
			'785195c2f1718b3d6b6b63f21c6dd437988858223896be6c83d62aba7e2f547b')


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
