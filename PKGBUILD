# Maintainer: Everette Rong <e@v01d.co>

pkgname=wine-tim
pkgver=1.1.5
deepintimver=1.0.4deepin4
pkgrel=0
pkgdesc="Latest Tencent TIM (com.qq.office) on Deepin Wine"
arch=("x86_64")
url="http://tim.qq.com/"
license=('custom')
depends=('p7zip' 'wine' 'xorg-xwininfo' 'xdotool')
_mirror="https://mirrors.tuna.tsinghua.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_${deepintimver}_i386.deb"
  "http://dldir1.qq.com/qqfile/qq/TIM${pkgver}/21175/TIM${pkgver}.exe"
  "run.sh")
md5sums=('24de53e74f6917dad0693b57e1e6ba4b'
  '4d63de9d589c2d60bb36107849fc87e2'
  '781d9e39b467276d8e050b1b57c10c66')

build() {
  pushd ${srcdir}
  msg "Extracting DPKG package ..."
  mkdir dpkgdir
  tar -xvf data.tar.xz -C dpkgdir
  msg "Extracting Deepin Wine TIM archive ..."
  7z x dpkgdir/opt/deepinwine/apps/Deepin-TIM/files.7z -odeepintimdir
  msg "Removing original outdated TIM directory ..."
  rm -r deepintimdir/drive_c/Program\ Files/Tencent/TIM
  msg "Repackaging app archive ..."
  pushd deepintimdir
  7z a -t7z -r ../files.7z *
  popd
  popd
}

package() {
  pushd ${pkgdir}
  msg "Preparing icons ..."
  mkdir -p usr/share
  mv ${srcdir}/dpkgdir/usr/local/share/* usr/share/
  msg "Copying TIM to /opt/deepinwine/apps/Deepin-TIM ..."
  mkdir -p opt/deepinwine/apps/Deepin-TIM
  cp ${srcdir}/{files.7z,run.sh,TIM$pkgver.exe} -i opt/deepinwine/apps/Deepin-TIM/
  chmod +x opt/deepinwine/apps/Deepin-TIM/run.sh
  popd
}

# vim:set ts=2 sw=2 et:
