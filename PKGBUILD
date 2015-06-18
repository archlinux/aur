# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Travis Willard <travisw@wmpub.ca>
# Contributor: Gergely Tamas <dice@mfa.kfki.hu>

pkgname=arj
pkgver=3.10.22
pkgrel=10
pkgdesc='Free and portable clone of the ARJ archiver'
url='http://arj.sourceforge.net/'
arch=('x86_64' 'i686')
license=('GPL')
depends=('glibc')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        arches_align.patch
        no_remove_static_const.patch
        64_bit_clean.patch
        custom-printf.patch
        security_format.patch
        use_safe_strcpy.patch
        CVE-2015-0556-symlink-traversal.patch
        CVE-2015-0557-dir-traversal.patch
        CVE-2015-2782-buffer-overflow.patch)
sha512sums=('4730dfdbab4f8095396c337578ed69bdaae52955ad468db50b52af8ad2846ecd6cfc05eb3ac0d03838c1c32ea60126f14a22b93e8181c06b9546456f3937ff76'
            '166b027adc6b0ffab02d96cd6ede70dc7d2f1f33ef21177c97dd43fdf1ca235a0a8f70e963d749dfb04c5c55ffe42a8601d8df97d84824118b408d00ca6eeb7c'
            '580e9bd4b37f9bf76784331f4e55abc30349cdd1735fd05897226137e78f0e420c6dcb287fcb111ac667b9f41c16e53b70cde50bce913eb85567afa05957c29a'
            'c6600b74af7e3ba982fa8471a19c9ca7d4652d5de871809edb4124e405a33b623eb10abc4fff00e578dc0144e955b9aaaaecac06c66f9923b005635cf00f9a06'
            'b1739a5cf75bb4036e41dd071fd4452e8d58805c539147d61594c14f959370a523939bd73de29473ea79f023ef759cec2feff497d5ded777919dd289dae8f769'
            '82611c25aadb4dc73284a6ad5c47fdfc708ebb4f92271bfcc8a6ca5855bc3582ac77b32ac0e94294f1158e41a7292637feabee043dfb2c0000193136fb288e56'
            'f72101f5fb9828afcf1851980ec1fa71d91942b2617b9182bbb92ca3d82069bee898436be9105b4a0445a6a0707c311b569f59397bc9ea29c9a98b7c088dd50c'
            'c74003d2a4631adcd4b9bdb38830ed373e63da021c29f682e3e6faf032100f8963c544e0aeaa277220c02f24f72ceecc4b0ef96b03de2f113ccf7ff4471a4ca4'
            'd7c23ebacf19df5b49a18ec259aa12cf7671105c609098fe344400639cb851fe5df769c3cf64922d86998d717b7ab9b42f831aeedd1dc0763080cf8d34c523c5'
            '1acabf5fdbdc48c88ef4ecfdacd116f0d64315fb51fa08f36ba8a02c0e05bb79f82b82ac09039e8027d651d115275ff4f0d72302657730fa91eb0cbaecf15e08')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -p1 < "${srcdir}/arches_align.patch"
  patch -p1 < "${srcdir}/no_remove_static_const.patch"
  patch -p1 < "${srcdir}/64_bit_clean.patch"
  patch -p1 < "${srcdir}/custom-printf.patch"
  patch -p1 < "${srcdir}/CVE-2015-0556-symlink-traversal.patch"
  patch -p1 < "${srcdir}/CVE-2015-0557-dir-traversal.patch"
  patch -p1 < "${srcdir}/CVE-2015-2782-buffer-overflow.patch"
  patch -p1 < "${srcdir}/security_format.patch"
  patch -p1 < "${srcdir}/use_safe_strcpy.patch"

  cd gnu
  aclocal
  autoconf
  rm -f config.{guess,sub}
  cp /usr/share/automake-"$(automake --version|head -n1|sed -r 's/.*\) (.*)/\1/')"/config.{guess,sub} .
}

build() {
  cd ${pkgname}-${pkgver}/gnu
  ./configure --prefix=/usr

  cd ..
  make prepare
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
