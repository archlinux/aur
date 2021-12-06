# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=alpine
pkgver=2.25
pkgrel=3
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
source=("http://alpine.x10host.com/alpine/release/src/alpine-${pkgver}.tar.xz"
		"maildir-${pkgver}.patch.gz::http://alpine.x10host.com/alpine/patches/alpine-${pkgver}/maildir.patch.gz"
		"fancy-${pkgver}.patch.gz::http://alpine.x10host.com/alpine/patches/alpine-${pkgver}/fancy.patch.gz"
		"fillpara-${pkgver}.patch.gz::http://alpine.x10host.com/alpine/patches/alpine-${pkgver}/fillpara.patch.gz"
		"compose-${pkgver}.patch.gz::http://alpine.x10host.com/alpine/patches/alpine-${pkgver}/compose.patch.gz"
		"longurl-${pkgver}.patch.gz::http://alpine.x10host.com/alpine/patches/alpine-${pkgver}/longurl.patch.gz")
sha256sums=('658a150982f6740bb4128e6dd81188eaa1212ca0bf689b83c2093bb518ecf776'
			'c4c6c121d9e42d529496899b52b0b84fed849796581f0a02ac224a48f5ca6169'
			'3bd6bfa719fd55f0b6c7e8a576e7f895f2fe5bc433baec4dca18fa9340d560ff'
			'96c68ca772aae921b6d291a400fe7763b069ece7625c517baba05ff84d4fee72'
			'c42669db277b651e52b6dfeff546df747aba34dda39ba7ff5cfe26e07a6f1520'
			'51467e516b763f25f133df6686cdd883afccbb17754c7839079917a0e4ea6ab9')


build() {
	cd "${pkgname}-${pkgver}"

	# Apply select patches to Alpine
	# http://alpine.x10host.com/alpine/
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
