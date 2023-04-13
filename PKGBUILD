# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: shad0w73 <shad0w73@vmail.me>
pkgname=helden-software
pkgver=5.5.4.beta
pkgrel=1
_debian_pkgver=5.5.2-1
pkgdesc='Die Heldenverwaltung für das Pen&Paper-Rollenspiel "Das Schwarze Auge" (DSA)'
arch=('any')
url="http://www.helden-software.de"
license=('custom')
depends=('java-runtime' 'hicolor-icon-theme' 'bash')
source=("http://online.helden-software.de/rep/pool/main/h/${pkgname}/${pkgname}_${_debian_pkgver}_all.deb"
        "https://www.helden-software.de/down/hs5/050504beta/helden.jar")
sha256sums=('15f129efc99f0ad97cc6d7956be625dc0e1aeb51a157323216f824dfda67c485'
            'cd6eec8b2202aed644a6620af16c1c2cad883eb94f818d6335fe1373aa97571d')
noextract=('helden.jar')

prepare() {
  cd "${srcdir}"
  tar -xzf data.tar.gz
}

package() {
  cd "${srcdir}"

  # Binary
  # use jar file from direct download because Debian Package is not updated yet
  #install -Dm644 usr/lib/heldensoftware/helden5.jar "${pkgdir}/usr/share/${pkgname}/helden5.jar"
  install -Dm644 helden.jar "${pkgdir}/usr/share/${pkgname}/helden5.jar"

  # Docs
  install -Dm644 usr/share/doc/${pkgname}/changelog.gz "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  install -Dm644 usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Config
  install -Dm644 etc/default/${pkgname} "${pkgdir}/etc/default/${pkgname}"

  # Icons
  #install -dm755 "${pkgdir}/usr/share/${pkgname}"
  #cp -r usr/share/icons "${pkgdir}/usr/share/"
  for _size in 16 32 48 64 72 96 128 192; do
    install -Dm644 usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png \
        "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Launcher
  install -dm755 "${pkgdir}/usr/share/applications"
  sed s/games/bin/ usr/share/applications/HeldenSoftware.desktop > "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Run-Script
  install -dm755 "${pkgdir}/usr/bin"
  sed "s/lib\/heldensoftware/share\/helden-software/" usr/games/${pkgname} > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
