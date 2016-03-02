# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=0.4.2
pkgrel=4
pkgdesc="Control your monitor by software using the DDC/CI protocol"
arch=('i686' 'x86_64')
url="http://ddccontrol.sourceforge.net/"
license=('GPL')
depends=('pciutils' 'ddccontrol-db-git' 'perl-xml-parser' 'libxml2')
source=("http://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2"
        "org.ddccontrol.pkexec.gddccontrol.policy")
options=('!libtool')
sha256sums=('986f3b4b27ec04e1da493de3aaab01cd5ea9566d7572c1a40b8d43cd7a491e84'
            '811bf1ecc85045e80757ea553591c00e32bb93d529a761b18bb501d0f2bf82c5')

build() {
  cd "${srcdir}"/${pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr	\
    --disable-gnome-applet
  make
}

package_ddccontrol() {
  install=ddccontrol.install
  cd "${srcdir}"/${pkgbase}-${pkgver}
  for i in src/lib src/ddcpci src/ddccontrol po man doc; do
    make DESTDIR="${pkgdir}" install -C $i
  done

  chmod 755 "${pkgdir}"/usr/bin/ddcpci
}

package_gddccontrol() {
  depends=('gtk2' 'ddccontrol')
  pkgdesc="Control your monitor by software using the DDC/CI protocol (GUI)"
  conflicts=("ddccontrol-git")

  cd "${srcdir}"/${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install -C src/gddccontrol

  # policykit
  install -Dm644 \
    "$srcdir/org.ddccontrol.pkexec.gddccontrol.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/org.ddccontrol.pkexec.gddccontrol.policy"
  sed -e 's/Exec=gddccontrol/Exec=pkexec gddccontrol/' \
    -i "${pkgdir}/usr/share/applications/gddccontrol.desktop"
}
