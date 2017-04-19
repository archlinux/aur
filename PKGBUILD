# Maintainer: Aaron Miller <aaronm at cldtk dot com>

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=2.2.0
pkgrel=1
arch=("i686" "x86_64")
url="https://pivx.org/"
depends=("boost-libs")
makedepends=("boost" "qt5-tools" "miniupnpc" "openssl" "protobuf" "qrencode" "db4.8")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v2.2.0.tar.gz")
sha256sums=("a83365b013bc9415871a30dc3eee755070f2f2c7cf5f483851a2fbb93753ed89")

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5
  make
}

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/init/pivxd.service"		"${pkgdir}/usr/lib/systemd/system/pivxd.service"
  install -Dm755 "src/pivxd"				"${pkgdir}/usr/bin/pivxd"
  install -Dm644 "contrib/debian/examples/pivx.conf"	"${pkgdir}/usr/share/doc/${pkgname}/examples/pivx.conf"
  install -Dm644 "contrib/debian/manpages/pivxd.1"	"${pkgdir}/usr/share/man/man1/pivxd.1"
  install -Dm644 "contrib/debian/manpages/pivx.conf.5"	"${pkgdir}/usr/share/man/man5/pivx.conf.5"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-cli() {
  pkgdesc+="(CLI)"
  depends+=("openssl")

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm755 "src/pivx-cli"	"${pkgdir}/usr/bin/pivx-cli"
  install -Dm755 "src/pivx-tx"	"${pkgdir}/usr/bin/pivx-tx"
  install -Dm644 "COPYING"	"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-qt() {
  pkgdesc+="(Qt)"
  depends+=("qt5-base" "protobuf" "qrencode" "miniupnpc" "db4.8")

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm755 "src/qt/pivx-qt"			"${pkgdir}/usr/bin/pivx-qt"
  install -Dm644 "contrib/debian/pivx-qt.desktop"	"${pkgdir}/usr/share/applications/pivx.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"		"${pkgdir}/usr/share/pixmaps/pivx128.png"
  install -Dm644 "contrib/debian/manpages/pivx-qt.1"	"${pkgdir}/usr/share/man/man1/pivx-qt.1"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
