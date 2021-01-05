# Maintainer: 3ED_0 <krzysztof1987 /at/ gmail.com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Hubert Czobodziński <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgbase=ddccontrol
pkgname=(ddccontrol gddccontrol)
pkgver=0.4.4
pkgrel=8
pkgdesc="Control your monitor by software using the DDC/CI protocol"
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('pciutils' 'ddccontrol-db-git' 'perl-xml-parser' 'libxml2' 'icu')
makedepends=('gtk2' 'autoconf' 'intltool')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ddccontrol/ddccontrol/archive/${pkgver}.tar.gz"
        'org.ddccontrol.pkexec.gddccontrol.policy'
        'fix-gcc10-compilation.patch')
options=('!libtool')
sha256sums=('aafbb16ac4f4edfe3fcc5feec1eb5729aaf86e3b0f31f9d707ba1406bb404817'
            'ef84637e512496a37fe3b50f64020f11aafaa7bc8ab821e90e81256439c2069a'
            '86b560a674ddfca7d8d7a30eb5ebf57d135e81eb8eea3808a0492010a9059995')

prepare() {
	cd "${srcdir}"/${pkgbase}-${pkgver}
	patch -Np1 -i ../fix-gcc10-compilation.patch
	test -f configure || INTLTOOLIZE='intltoolize --force' autoreconf --install
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

  for i in src/lib src/ddcpci src/ddccontrol po man; do
    make DESTDIR="${pkgdir}" install -C $i
  done

  # cleanups
  rm "$pkgdir/usr/share/man/man1/gddccontrol.1"
}

package_gddccontrol() {
  depends=('gtk2' 'ddccontrol')
  pkgdesc="Control your monitor by software using the DDC/CI protocol (GUI)"
  conflicts=("ddccontrol-git")

  cd "${srcdir}"/${pkgbase}-${pkgver}

  for i in src/gddccontrol man; do
    make DESTDIR="${pkgdir}" install -C $i
  done

  # cleanups
  rm "$pkgdir/usr/share/man/man1/ddccontrol.1"

  # policykit
  install -Dm644 \
    "$srcdir/org.ddccontrol.pkexec.gddccontrol.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/org.ddccontrol.pkexec.gddccontrol.policy"

  sed -e 's/Exec=gddccontrol/Exec=pkexec gddccontrol/' \
    -i "${pkgdir}/usr/share/applications/gddccontrol.desktop"
}
