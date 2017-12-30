# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=tuna
pkgver=0.13.1
pkgrel=3
epoch=1
pkgdesc="Thread and IRQ affinity setting GUI and cmd line tool"
url="https://rt.wiki.kernel.org/index.php/Tuna"
arch=('any')
license=('GPL')
depends=('python2-ethtool' 'python2-linux-procfs' 'python2-schedutils'
'python2-numpy' 'python2-matplotlib' 'pygtk' 'libglade' 'gksu')
optdepends=('python2-inet_diag: Show network sockets in use by threads')
source=("https://git.kernel.org/pub/scm/utils/${pkgname}/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png")
sha512sums=('cb182f45ac0f55bc392d00df69178e7c19721156a7a88e5ed5a3061192aad7520ffe3f200d3bb95ad2d283615e004af30c380b7aee826079491b3744a73fb314'
            '1432c39a1345ff47c893146a4884ccb2317fa623c3340bd4870fce2e4fec3b050db73fad19155d6d6ead51eb29069e11da46fc1bda4a44ac057b2980ee8ad3c1')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '1s/python/python2/' {tuna-cmd,oscilloscope-cmd}.py
  sed -i -e 's/gtk-preferences/tuna/g' "${pkgname}.desktop"
  sed -i -e 's/Exec=tuna --gui/Exec=gksu tuna/g' "${pkgname}.desktop"
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  install -Dm 775 "${pkgname}-cmd.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 775 oscilloscope-cmd.py "${pkgdir}/usr/bin/oscilloscope"
  install -Dm 644 "etc/${pkgname}/example.conf" "${pkgdir}/etc/${pkgname}/example.conf"
  install -Dm 644 "etc/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm 644 "docs/oscilloscope+${pkgname}.pdf" "${pkgdir}/usr/share/${pkgname}/docs/oscilloscope+${pkgname}.pdf"
  install -t "${pkgdir}/usr/share/${pkgname}/help/kthreads" -Dm 644 help/kthreads/*
  install -Dm 644 "${pkgname}/${pkgname}_gui.glade" "${pkgdir}/usr/share/${pkgname}/${pkgname}_gui.glade"
  install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm 644 "org.${pkgname}.policy" "${pkgdir}/usr/share/polkit-1/actions/org.${pkgname}.policy"
  install -Dm 644 "docs/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"
}
# vim:set ts=2 sw=2 et:
