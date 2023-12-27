# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=ysflight
pkgver=20181124
pkgrel=2
pkgdesc="A portable flight simulator"
arch=('x86_64')
url="http://wwwe.ysflight.com/"
license=('freeware')
depends=('glu')
makedepends=(python)
ysflight_dir="/opt/ysflight-$pkgver"

source=('YsflightForLinux.zip::https://ysflight.org/files/20181124YsflightForMacAndLinux.zip'
        'ysflight.sh')
md5sums=('26a8f7bcc79eb710895547f052a09fef'
         '540ca8dec29fec23c67f830c6cce5d5c')

prepare() {
  cd "${srcdir}"
  sed -i "s#YSFLIGHT_DIR#${ysflight_dir}#g" ysflight.sh
  cd "${srcdir}/Ysflight"
  sed -ri "
    s#^([[:blank:]]*)input\\(.*#\\1pass#

    s#join\\(\"~\",\"Desktop\"#join(\"${pkgdir}/usr/share/applications\"#
    s#Exec=\"\\+exe#Exec=/usr/bin/\"+os.path.basename(exe)#
    s#isfile\\(iconfile\\)#isfile(\"${pkgdir}\"+iconfile)#
    /Path=/d

    s#YSFLIGHTPATH=.*#YSFLIGHTPATH=\"${ysflight_dir}\"#
    s#to ~/YSFLIGHT.COM/ysflight#to ${ysflight_dir}#
    s#(isdir|rmtree)\\(YSFLIGHTPATH\\)#\\1(\"${pkgdir}\"+YSFLIGHTPATH)#
    s#(copytree\\(FindYsflight.*,)YSFLIGHTPATH#\1\"${pkgdir}\"+YSFLIGHTPATH#
    s#(FileCheck\\()YSFLIGHT#\1\"${pkgdir}\"+YSFLIGHT#
  " InstallInLinux.py
}

package() {
  echo '
[WARNING!]
[WARNING!] This installer does its best to enforce
[WARNING!] Linux’ standard file locations. Unfortunately,
[WARNING!]   “ $HOME/Documents/YSFLIGHT.COM ”
[WARNING!] is hard-coded into the binary programs…
[WARNING!]
'

  cd "${pkgdir}"
  mkdir -p usr/bin usr/share/applications opt

  cd "${srcdir}/Ysflight"
  python InstallInLinux.py

  cd "${pkgdir}"
  find "${ysflight_dir#/}" -type d -exec chmod 755 {} \;
  find "${ysflight_dir#/}" ! -type d -exec chmod 444 {} \;
  chmod 555 "${ysflight_dir#/}"/ysflight64_*
  install -Dm555 "${srcdir}/ysflight.sh" usr/bin/ysflight
  touch usr/bin/ysflight
  ln -s ysflight usr/bin/ysflight64_gl1
  ln -s ysflight usr/bin/ysflight64_gl2
  ln -s ysflight usr/bin/ysflight64_nownd
}
