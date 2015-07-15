# Maintainer: Yakir Sitbon <kingyes1[at]gmail[dot]com>
# Contributor: Eduard Kracmar <edke.kraken[at]gmail[dot]com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>
# Contributor: Patrik Votoček <patrik[at]votocek[dot]cz>
# 
# GitHub Repo: https://github.com/KingYes/phpstorm-eap

pkgname=phpstorm-eap
_pkgname=PhpStorm # Directory name in the tar file
pkgbuild=141.2017
pkgver=${pkgbuild}
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE. 30-day free trial."
arch=('i686' 'x86_64')
options=(!strip)
url="http://www.jetbrains.com/phpstorm/"
license=('custom')
depends=('java-environment>=6')
source=(http://download.jetbrains.com/webide/PhpStorm-EAP-$pkgbuild.tar.gz)
#source=(http://download-ln.jetbrains.com/webide/PhpStorm-7.1.3.tar.gz)
md5sums=('3aded937d9c5f86d0df5a27d5f86dfd7')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/${pkgname} || return 1
  cp -R ${srcdir}/${_pkgname}-${pkgbuild}/* ${pkgdir}/opt/${pkgname} || return 1
#  cp -R ${srcdir}/${_pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname} || return 1
  if [[ $CARCH = 'i686' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux64.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier64
  fi
  if [[ $CARCH = 'x86_64' ]]; then
     rm -f ${pkgdir}/opt/${pkgname}/bin/libyjpagent-linux.so
     rm -f ${pkgdir}/opt/${pkgname}/bin/fsnotifier
  fi

(
cat <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=PhpStorm-EAP
Exec="/opt/${pkgname}/bin/phpstorm.sh" %f
Icon=phpstorm-eap
Comment=Lightweight and Smart PHP IDE 30-day free trial
GenericName=Lightweight and Smart PHP IDE
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-phpstorm
EOF
) > ${startdir}/${pkgname}.desktop

  mkdir -p ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/ || return 1
  mkdir -p ${pkgdir}/usr/share/pixmaps/ || return 1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
  install -m 644 ${startdir}/phpstorm-eap.desktop ${pkgdir}/usr/share/applications/
  install -m 644 ${pkgdir}/opt/${pkgname}/bin/webide.png ${pkgdir}/usr/share/pixmaps/phpstorm-eap.png
  install -m 644 ${srcdir}/${_pkgname}-${pkgbuild}/license/${_pkgname}_license.txt ${pkgdir}/usr/share/licenses/${pkgname}/${_pkgname}_license.txt
  ln -s /opt/$pkgname/bin/phpstorm.sh "$pkgdir/usr/bin/phpstorm-eap"
}
