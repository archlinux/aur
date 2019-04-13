# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=netactview
pkgver=0.6.4
pkgrel=5
pkgdesc="A graphical network connections viewer similar in functionality to netstat"
arch=('x86_64')
url="http://netactview.sourceforge.net/index.html"
license=('GPL')
depends=('libglade' 'libgtop')
makedepends=('intltool' 'polkit')
optdepends=('polkit: restart the application as root')
source=("https://downloads.sourceforge.net/netactview/${pkgname}-${pkgver}.tar.bz2"
        'drop-libgnome.patch'
        'drop-gconf.patch'
        'netactview_polkit'
        'org.archlinux.pkexec.netactview.policy')
sha256sums=('0cfe68e90862b10a19ab2cc4977a079887eeda00e4069a819c13ece90843fb4a'
            'e5359685c785427c812fd285b1eda3465e27120c186eae35a926881be1985df9'
            '0f07529a186dbdb553dd37465ba4904969b3fb03df42fe4f7c90c3a32a4055e4'
            '8d5319635ce05be5e5f3a426e81db34e0c2613010575bb7b3682bb2ae34fdd36'
            '467aa93ad28849061bfd1ea07698cc0154bef0a5a98e4c384260fc53e03b877c')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Remove libgnome dependency
  patch -Np1 -i ../drop-libgnome.patch

  # Remove gconf dependency
  patch -Np1 -i ../drop-gconf.patch

  # Use pkexec instead of gksu
  sed -i 's/\[gksu\]/\[pkexec\]/' configure.ac
  sed -i 's|GKSU_PATH, EXECUTABLE_PATH|"/usr/bin/netactview_polkit"|
          s/install gksu/install polkit/' src/mainwindow.c

  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Polkit policy
  install -Dm644 "${srcdir}/org.archlinux.pkexec.netactview.policy" \
    "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.netactview.policy"

  # Launcher script
  install -Dm755 "${srcdir}/netactview_polkit" \
    "${pkgdir}/usr/bin/netactview_polkit"
}
