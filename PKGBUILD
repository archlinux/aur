# Current Maintainer: Abuzer Rafey <arafey@vyvygen.org>
# Original Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgbase=tboot
pkgname=tboot-hg
pkgver=r510+.59086d17f60d+
pkgrel=1
pkgdesc="A pre-kernel/VMM module that uses Intel(R) TXT to perform a measured and verified launch of an OS kernel/VMM."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tboot/"
license=(BSD)
depends=("trousers" "mercurial")
conflicts=('tboot')
provides=('tboot')
source=("hg+http://hg.code.sf.net/p/tboot/code"
        0001-Install-to-usr-bin-instead-of-usr-sbin.patch
        0002-20_linux_tboot-Remove-check-for-boot-config-which-do.patch)

sha512sums=('SKIP'
            'b3777a871c7ae09566dcdd4f14d5f8f3a097d2c321f5eb7c2e561594837718c3c31bc70a28a3cb342e0888724176eeccd2d73e204a6cddb245f4017b84433d30'
            'aaec2527587211a5ab07f98ff0c8bbe20c32df09752a7364215625b665337c8ee4c582a06639d36b64dfd78e87974d6bd722df140b268280a539d6492942e87c')

pkgver() {
  cd "code"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "code"

  patch -p1 -i ../0001-Install-to-usr-bin-instead-of-usr-sbin.patch
  patch -p1 -i ../0002-20_linux_tboot-Remove-check-for-boot-config-which-do.patch
}

build() {
  cd "code"

#  unset LDFLAGS

  CFLAGS+="-Wno-error=stack-protector --warn-stack-protector" make debug=y
}

package() {
  cd "code"

  make debug=y DISTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp README COPYING docs/*.txt lcptools/lcptools2.txt lcptools/Linux_LCP_Tools_User_Manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/man/man8/"
  install -m644 docs/man/*.8 "${pkgdir}/usr/share/man/man8/"
}
