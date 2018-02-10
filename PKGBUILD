# $Id$
# Maintainer: mwberry <null@example.org>
pkgname=cryptsetup-keyscript
cryptsetupver=2.0.1
pkgver=${cryptsetupver}.keyscript
pkgrel=1
pkgdesc="Patched cryptsetup that supports invoking a script to obtain passphrase"
arch=(i686 x86_64)
license=('GPL')
url="https://gitlab.com/cryptsetup/cryptsetup/"
groups=('base')
depends=('device-mapper' 'libgcrypt' 'popt' 'libutil-linux')
makedepends=('util-linux')
provides=(cryptsetup)
conflicts=(cryptsetup)
options=('!emptydirs')
source=(https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/cryptsetup-${cryptsetupver}.tar.xz
        https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/cryptsetup-${cryptsetupver}.tar.sign
        encrypt_hook
        encrypt_install
        sd-encrypt
	keyscript.patch
	header_support.patch
	)
validpgpkeys=('2A2918243FDE46648D0686F9D9B0577BD93E98FC') # Milan Broz <gmazyland@gmail.com>
sha256sums=('41d188092c52e23d576af41cf0cfe0555d8f7efa21598d4c57c56ea1b6d9c975'
            'SKIP'
            '4406f8dc83f4f1b408e49d557515f721d91b358355c71fbe51f74ab27e5c84ff'
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae'
            'd442304e6a78b3513ebc53be3fe2f1276a7df470c8da701b3ece971d59979bdd'
	    'ddcd30cd99f4731dbfab987812cd6e83c87e2c45666cfbaf3fd31c127640681a'
	    'b1b1367ea91a8aae922fd0b53b4c6153ac3154b2f426b488d985b0e1cc637520'
	    )

prepare() {
	patch --follow-symlinks encrypt_hook keyscript.patch
	patch --follow-symlinks encrypt_hook header_support.patch
	rm keyscript.patch
	rm header_support.patch
}

build() {
  cd "${srcdir}"/cryptsetup-${cryptsetupver}
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --enable-cryptsetup-reencrypt
  make
}

package() {
  cd "${srcdir}"/cryptsetup-${cryptsetupver}
  make DESTDIR="${pkgdir}" install
  # install hook
  install -D -m644 "${srcdir}"/encrypt_hook "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m644 "${srcdir}"/encrypt_install "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m644 "${srcdir}"/sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}
