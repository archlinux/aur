# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgname=mondorescue-common
pkgver=3.3.0
pkgrel=1
pkgdesc="Common libraries and tools for MondoRescue (Mondo and Mindi)"
arch=('x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
depends=('perl')
source=("https://hub.darcs.net/stef204/mondorescue-aur/raw/MondoRescue-${pkgver}.tar.gz"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/ProjectBuilder-0.16.1.tar.gz"
        "https://hub.darcs.net/stef204/mondorescue-aur/raw/Kernel.pm-zst.patch")
sha512sums=('7c67f725eaee334826a6060149b6f41e5cc4a844d68d419eb89de03989821bd78f0110303c09cfb3b81ef4beebbbf8ad1b5dd9e9ddbed4c0d09f7ee96fc6a184'
            'f18f76507a8c59f3316fcfc1460e480730995fe7e08b57cf5479c22f440526700e3619906182d4f26a449020ff3cf5d8ef3e82bf45ee8b00852d6bc44fa92b2b'
            'b8cec0df957c040dee39df32770e790f13afe85f72fa3f0d946f7cd82b5e650f8a0d9ed0a5526a0272468e91a4b8359b6bffea56b530038de03f5033ece0a8ed')

prepare() {
  cd "${srcdir}"
  tar xzf ProjectBuilder-0.16.1.tar.gz ProjectBuilder-0.16.1/lib/ProjectBuilder
  cd "${srcdir}/MondoRescue-${pkgver}"
  patch -p1 -i "${srcdir}/Kernel.pm-zst.patch"
}

build() {
  cd "${srcdir}/MondoRescue-${pkgver}"
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/MondoRescue-${pkgver}"
  make install DESTDIR="${pkgdir}"
  
  mv "${pkgdir}/usr/bin/vendor_perl/"* "${pkgdir}/usr/bin/"
  rmdir "${pkgdir}/usr/bin/vendor_perl"
  
  if [ -d "${pkgdir}/usr/local/share/man" ]; then
    install -d "${pkgdir}/usr/share/man/man5"
    mv "${pkgdir}/usr/local/share/man/man5/"* "${pkgdir}/usr/share/man/man5/" 2>/dev/null || true
    rm -rf "${pkgdir}/usr/local"
  fi
  
  install -d "${pkgdir}/usr/share/perl5/vendor_perl/ProjectBuilder"
  cp -r "${srcdir}/ProjectBuilder-0.16.1/lib/ProjectBuilder/"* "${pkgdir}/usr/share/perl5/vendor_perl/ProjectBuilder/"
  
  find "${pkgdir}/usr/share/perl5" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/perl5" -type f -exec chmod 644 {} \;
}
