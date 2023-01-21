# Maintainer: fansuregrin <fansuregrin@outlook.com>
# Contributor: qaz <fkxxyz@163.com>
# Contributor: fansuregrin <fansuregrin@outlook.com>
pkgname=arctimepro
pkgver=4.1
pkgrel=2
pkgdesc="A Simple, powerful and efficient cross-platform subtitle production software"
arch=("i686" "x86_64")
url="https://arctime.org"
license=('custom')
depends=('hicolor-icon-theme' 'jre8-openjdk' 'vlc' 'sed')
conflicts=('arctime')
sha256sums=('9990e860ced9cd5bc50bfe66f84f2828e7c2af2c2dbfda90c304a01686ed96cb'
            '9f490a4fc4d4f15e31b15e84717e11ce794e908055484f22d02aa0a166093677'
            '406a3953b7b5d54814f6613f23badc0eff04909688d67295371aeeead862ae85'
            'fcd6ecf0a786658968d0c8747b860b5238c0df73c873642dd7ce5fca186d2122'
            'c9bc9ac2ffdc703b672c1f918ea4d48479693bdc69dfd346a077547de47ce7d1'
            'ccfbc0b0387dc2cefd4cad0653aa825226165f5890ff469605bb55d39b5b4992')
source=(
  "ARCTIME_PRO_${pkgver}_LINUX.7z::https://t.arctime.cn/nap2x"
  16x16.png
  24x24.png
  32x32.png
  48x48.png
  ${pkgname}.desktop
)
package() {
  # install icons
  for icon in *.png; do
    install -Dm 644 ${icon} "${pkgdir}/usr/share/icons/hicolor/${icon%.*}/apps/${pkgname}.png"
  done
  
  # install .desktop file 
  install -Dm 644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  # install app resources and executable file
  cd "${srcdir}/ARCTIME_PRO_${pkgver}_LINUX"	
  install -dm 755 "${pkgdir}/opt/${pkgname}"
  cp -r "./ArcTime_lib" "${pkgdir}/opt/${pkgname}/"
  cp -r "./resources" "${pkgdir}/opt/${pkgname}/"
  cp -r "./tools" "${pkgdir}/opt/${pkgname}/"
  install -D "./run.sh" "${pkgdir}/opt/${pkgname}/run.sh"
  sed -i '2,6d' "${pkgdir}/opt/${pkgname}/run.sh"
  sed -i "3 icd /opt/${pkgname}/" "${pkgdir}/opt/${pkgname}/run.sh"
  sed -i 's/java-8-openjdk-amd64/java-8-openjdk/g' "${pkgdir}/opt/${pkgname}/run.sh"
  install -D "./bin.jar" "${pkgdir}/opt/${pkgname}/bin.jar"

  # change permissions
  chmod 755 "${pkgdir}/opt/${pkgname}/tools/x86/ffmpeg-linux32"
  chmod 755 "${pkgdir}/opt/${pkgname}/tools/x86/ffprobe-linux32"
  chmod 755 "${pkgdir}/opt/${pkgname}/tools/x64/ffmpeg-linux64"
  chmod 755 "${pkgdir}/opt/${pkgname}/tools/x64/ffprobe-linux64"
  for res in ${pkgdir}/opt/${pkgname}/resources/*; do
    chmod 644 ${res};
  done
  for lib in ${pkgdir}/opt/${pkgname}/ArcTime_lib/*;do
    chmod 644 ${lib};
  done

  # make softlink
  install -dm 755 "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
}
