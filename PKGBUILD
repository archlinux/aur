# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=0.4.3
pkgrel=2
pkgdesc="Control your monitor by software using the DDC/CI protocol"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('pciutils' 'ddccontrol-db-git' 'perl-xml-parser' 'libxml2' 'icu')
makedepends=('gtk2' 'autoconf' 'intltool')
source=("https://github.com/ddccontrol/ddccontrol/archive/${pkgver}.tar.gz"
        "org.ddccontrol.pkexec.gddccontrol.policy")
options=('!libtool')
sha256sums=('10e19c7201bb9e80d8d4293f8090d5ce97b0f49a13bd7e8e7af53b7e8ae4e5fb'
            '811bf1ecc85045e80757ea553591c00e32bb93d529a761b18bb501d0f2bf82c5')

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}
	test -f configure || ./autogen.sh
}

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
  for i in src/lib src/ddcpci src/ddccontrol po man; do # removed: doc (no objects to do in html/*)
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
