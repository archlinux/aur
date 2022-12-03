# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=youku
pkgver=1.0.0
pkgrel=5
pkgdesc="YouKu Video client"
url="http://gitlab.alibaba-inc.com/youku-node/uos-youku-app/blob/master/README.md"
arch=('x86_64')
license=('custom')
depends=('electron9')
source=('youku.deb::https://mirrors.163.com/ubuntukylin/pool/partner/youku-app_1.0.0_amd64.deb'
        'youku.desktop'
	'electron.sh'
	'youku.sh'
)
sha256sums=('c28ade22d41fa6074fce7f2cb06f9db4dfba439698bbea37b0f5735d9ae30075'
            '6b984c5b95804defaaa8bba57563e7dbe0a6a841712240822a1764670cd805c2'
            '9e5af9a8e359e8b8cc3d0fb2eb4c0309fc7ace80174ca9cc93f8c5c3ef408773'
            'c2e1562b03b6d91932a71fa7e52c3263e8e4e53b961326c3fe71bf8ac4f6ac87')
noextract=('youku.deb')

build() {
  ar x youku.deb
  tar xf data.tar.xz #resources
}

package() {

  # App resources
  install -Dm644 opt/优酷/resources/app.asar ${pkgdir}/usr/lib/${pkgname}/resources/${pkgname}.asar
  cp -r opt/优酷/resources/assets ${pkgdir}/usr/lib/${pkgname}/
  install -Dm755 ${srcdir}/electron.sh ${pkgdir}/usr/lib/${pkgname}/electron

  # binary command
  install -Dm755 youku.sh ${pkgdir}/usr/bin/${pkgname}

  # Install desktop file
  install -Dm644 ${srcdir}/youku.desktop -t ${pkgdir}/usr/share/applications/

  # copy app.asar and other resource files
  cd $srcdir/usr/share/icons
  find . -type d -exec install -d {,"$pkgdir"/usr/share/icons/}{} \;
  for i in `find . -type f`;do
    install -Dm644 $i "$pkgdir"/usr/share/icons/`echo $i | tr 'A-Z' 'a-z'`
  done
}
