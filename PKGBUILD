pkgname=flexnet
pkgver=11.14.1.0
pkgrel=2
arch=('x86_64')
url='https://developer.arm.com/products/software-development-tools/license-management/downloads'
license=('custom')
options=('emptydirs')
pkgdesc="FlexNet Publisher: license manager"
# download file and uncomment
source=(#"BX002-PT-00007-r11p14-01rel0.tgz"
	"lmgrd.service")
sha256sums=('809c5917525d5eee7392eb9adb3a4ceaf1d0bbe36d7174a90d92df4fa1f53167'
            '95d263029a7d0d454cb58d395843dd1dc8415fb44d5bc3f5f5d0708223acaab7')

package() {
  mkdir -p ${pkgdir}/etc/flexnet
  mkdir -p ${pkgdir}/var/log/flexnet
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/doc/$pkgname
  mkdir -p ${pkgdir}/usr/lib/systemd/system

  cp -r ${srcdir}/{armlmd,armlmdiag,lmgrd,lmutil} ${pkgdir}/usr/bin/
  cp -r ${srcdir}/{fnp_LicAdmin.pdf,ReleaseNotes.pdf} ${pkgdir}/usr/share/doc/$pkgname

  for i in lmhostid lmver lmcksum lmdown lmremove lmreread \
    lmswitchr lmstat lmdiag lminstall lmpath lmborrow lmswitch; do
      ln -s lmutil ${pkgdir}/usr/bin/$i
  done

  install -Dm0644 ${srcdir}/lmgrd.service ${pkgdir}/usr/lib/systemd/system/lmgrd.service
  ln -s ld-linux-x86-64.so.2 $pkgdir/usr/lib/ld-lsb-x86-64.so.3
  chown -R nobody:nobody ${pkgdir}/var/log/flexnet
}
