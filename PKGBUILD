# Maintainer: zezadas <aur at sefod dot eu>
# Fork of [mutantmonkey](https://aur.archlinux.org/packages/trousers/)
# With [Fedora Patches](https://src.fedoraproject.org/fork/snits/rpms/trousers) branch *rebase*

pkgname=trousers-fedora-patches
pkgname_=trousers
pkgver=0.3.14
pkgrel=3
pkgdesc="Open-source TCG Software Stack implementation for use with a TPM"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trousers"
license=('CPL')
depends=('openssl')
options=('libtool')
provides=('trousers')
source=(http://downloads.sourceforge.net/project/${pkgname_}/${pkgname_}/${pkgver}/${pkgname_}-${pkgver}.tar.gz
        sysusers.conf
        tmpfiles.conf
        tcsd.service
        70-tpmd.rules
        01-tss-user.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-double-free.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-fix-indent-obj_policy.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-fix-indent-tspi_key.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-noinline.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-tcsd-header-fix.patch
        https://src.fedoraproject.org/fork/snits/rpms/trousers/raw/rebase/f/trousers-0.3.14-unlock-in-err-path.patch
)
noextract=(${pkgname_}-${pkgver}.tar.gz)
sha256sums=('ce50713a261d14b735ec9ccd97609f0ad5ce69540af560e8c3ce9eb5f2d28f47'
            '4c2684501e7a67132d4f53466b32fc06bd2a0275d4cf1fbd5479d0cdb2349bc7'
            '1afd455b6c17e730b2cc4ec71d5625f0b63fde54f9409ae4762dc6f084c194de'
            '653c3a94ec628e7a7fb150d0d289b0866c6b3bb9aa57af2c59724517d205d7bd'
            'c50ea41a4809699dd50f2e621acc6baafb2dffa43cd5a0df8a0679f1d1b1b884'
            '169cc2cbc3a8bce7fd76e0c96e5b04b5249a0db9e857b274a0c5da461bb604f7'
            'b6bddb10499e6e5fdb02a2dec2a971b1bc2ace5e4e618b084357373f5b1d43fe'
            '31954f6493b5278e7e10f35e54ad92186768848d015ed9cd46b4515a29edba35'
            'e87efabc108dea1d7fd2c610239c4ce116c467c2473eab0749795f371a0692f4'
            'd2b59a13eaa094e93ce111bf8e58a0adb2f25e8542cf572eb7665c59cb1f954c'
            '6bce1b5e942eb7ab295907766c88ca0c33fdf03da0bf05a010ef12d86481f60e'
            'c79a8f48806909eddf72bd99396458cc03aedf8c5cef094a33ca1354b3279a91'            
)

prepare() {
  mkdir -p ${pkgname_}-${pkgver}
  bsdtar -x -f ${pkgname_}-${pkgver}.tar.gz -C ${pkgname_}-${pkgver}
  cd ${pkgname_}-${pkgver}
  patch -p1 -i ${srcdir}/01-tss-user.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-double-free.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-fix-indent-obj_policy.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-fix-indent-tspi_key.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-noinline.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-tcsd-header-fix.patch
  patch -p1 -i ${srcdir}/trousers-0.3.14-unlock-in-err-path.patch
}

build() {
  cd ${pkgname_}-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --sbindir=/usr/bin \
              --with-openssl=/usr \
              --with-gui=openssl
  make
}

package() {
  cd ${pkgname_}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/tcsd.service ${pkgdir}/usr/lib/systemd/system/tcsd.service
  install -Dm644 ${srcdir}/70-tpmd.rules ${pkgdir}/usr/lib/udev/rules.d/70-tpmd.rules
  install -Dm644 ${srcdir}/sysusers.conf ${pkgdir}/usr/lib/sysusers.d/trousers.conf
  install -Dm644 ${srcdir}/tmpfiles.conf ${pkgdir}/usr/lib/tmpfiles.d/trousers.conf
}

# vim:set ts=2 sw=2 et:

