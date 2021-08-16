# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Loui Chang <louipc dot ist at gmail company>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=esmtp
pkgver=1.2
pkgrel=8
pkgdesc="An easy SMTP forwarder."
arch=('x86_64')
url='http://esmtp.sourceforge.net'
license=('GPL')
depends=('libesmtp' 'openssl')
optdepends=('liblockfile: for esmtp-wrapper script'
            'procmail: for local mail delivery')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	0001-Fix-configure.ac-since-libesmtp-config-was-removed.patch
        fix-segfault-on-empty-to-in-headers.patch)
sha256sums=('a0d26931bf731f97514da266d079d8bc7d73c65b3499ed080576ab606b21c0ce'
            '28ea9cfc2c17810be5fbf3847d041ec2112ed6b4f8ba66854d48529443d36009'
            '656e5223dc832f0f1fa02616f0d18e2df8a27838e593fc5c916f7e7606e632d7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../0001-Fix-configure.ac-since-libesmtp-config-was-removed.patch
  patch -p1 < ../fix-segfault-on-empty-to-in-headers.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm0644 README "${pkgdir}/usr/share/doc/esmtp/README"
  install -Dm0644 sample.esmtprc "${pkgdir}/usr/share/doc/esmtp/sample.esmtprc"
  install -Dm0755 esmtp-wrapper "${pkgdir}/usr/share/esmtp/esmtp-wrapper"
  install -Dm0755 ylwrap "${pkgdir}/usr/share/esmtp/ylwrap"
}
