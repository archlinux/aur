# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=arctime
pkgver=2.3
pkgrel=1
pkgdesc="A Simple, powerful and efficient cross-platform subtitle production software"
arch=("i686" "x86_64")
url="http://arctime.org"
license=('custom')
depends=('ffmpeg' 'java-runtime=8' 'vlc')
source=(
  "https://dlhz.arctime.cn/ARCTIME_PRO_${pkgver}_LINUX.7z"
  16x16.png
  24x24.png
  32x32.png
  48x48.png
  arctime.desktop
)

package() {
  for png in *.png; do
    install -D ./${png} "${pkgdir}/usr/share/icons/hicolor/${png%.*}/apps/${pkgname}.png"
  done
  
  install -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd ${srcdir}/ARCTIME_PRO_${pkgver}_LINUX
  
  install -D './tools/GPL LICENSE.txt' "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
  
  pkghome="${pkgdir}/usr/share/${pkgname}"
  install -Dm644 ./ArcTime.jar "${pkghome}/ArcTime.jar"
  cp -r ./ArcTime_lib "${pkghome}/ArcTime_lib"
  cp -r ./resources "${pkghome}/resources"
  chmod 644 "${pkghome}/resources/Roboto-Regular.ttf"
  install -d "${pkghome}/tools/config"
  echo '/usr/lib' > "${pkghome}/tools/config/vlcpath.txt"
  install -d "${pkghome}/tools/"{x86,x64}
  ln -sf /usr/bin/ffmpeg "${pkghome}/tools/x86/ffmpeg-linux32"
  ln -sf /usr/bin/ffprobe "${pkghome}/tools/x86/ffprobe-linux32"
  ln -sf /usr/bin/ffmpeg "${pkghome}/tools/x64/ffmpeg-linux64"
  ln -sf /usr/bin/ffprobe "${pkghome}/tools/x64/ffprobe-linux64"
  
  echo '#!/bin/bash
PATH=/usr/lib/jvm/java-8-openjdk/jre/bin:$PATH
cd /usr/share/arctime
exec java -Xms128m -Xmx512m -jar ./ArcTime.jar
' > "${pkghome}/$pkgname"
  chmod +x "${pkghome}/$pkgname"
  
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
sha256sums=('875e6e7da8dfa228ff4daf738433348ec4f90202c94947eb61bad69632343f48'
            '9f490a4fc4d4f15e31b15e84717e11ce794e908055484f22d02aa0a166093677'
            '406a3953b7b5d54814f6613f23badc0eff04909688d67295371aeeead862ae85'
            'fcd6ecf0a786658968d0c8747b860b5238c0df73c873642dd7ce5fca186d2122'
            'c9bc9ac2ffdc703b672c1f918ea4d48479693bdc69dfd346a077547de47ce7d1'
            '509cd21579a352540e2a5a7fc12d1efb927d2247184e75765787d3aa0f39f05e')

