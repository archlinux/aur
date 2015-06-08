# Maintainer: Moritz Kiefer <moritz.kiefer at gmail dot com>
# Contributor: Jiri Prochazka <ojirio at gmail dot com>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=linuxsampler-svn
_pkgname="${pkgname%-svn}"
pkgver=r2729
pkgrel=1
pkgdesc="Sampler backend, including sampler engine, audio and MIDI drivers, network layer (LSCP) API and native C++ API"
arch=("i686" "x86_64")
url="http://www.linuxsampler.org/"
license=("GPL" "custom")
depends=("libgig-svn" "jack" "sqlite" "util-linux" "perl-xml-parser")
makedepends=("subversion" "ladspa" "dssi")
optdepends=()
provides=('linuxsampler')
conflicts=('linuxsampler')
options=("libtool")
source=("$pkgname"::"svn+https://svn.linuxsampler.org/svn/$_pkgname/trunk"
        "license.txt")
sha256sums=('SKIP'
            'fe9613dc00d4dafdbe9132ba00e82b0c6f333c53dffe02e29a8dfe1753c7b622')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.cvs
  ./configure --prefix=/usr --enable-vst-sdk=../vstsdk2.4
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install

  # rename lscp to lscpsh
  mv "$pkgdir/usr/bin/lscp" "$pkgdir/usr/bin/lscpsh"
  mv "$pkgdir/usr/share/man/man1/lscp.1" "$pkgdir/usr/share/man/man1/lscpsh.1"

  # install GPL exception statement
  install -Dm0644 ../license.txt "${pkgdir}/usr/share/licenses/$pkgname/GPL-EXCEPTION"

  # add linuxsampler library path to ld.so.conf.d
  install -m0755 -d "$pkgdir/etc/ld.so.conf.d"
  echo "/usr/lib/$_pkgname" > "$pkgdir/etc/ld.so.conf.d/$_pkgname.conf"
}
