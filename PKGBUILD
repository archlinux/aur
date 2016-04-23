# Maintainer: Moritz Kiefer <moritz.kiefer at purelyfunctional dot org>
# Contributor: Jiri Prochazka <ojirio at gmail dot com>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=linuxsampler-svn
_pkgname="${pkgname%-svn}"
pkgver=r2887
pkgrel=1
pkgdesc="Sampler backend, including sampler engine, audio and MIDI drivers, network layer (LSCP) API and native C++ API"
arch=("i686" "x86_64")
url="http://www.linuxsampler.org/"
license=("GPL" "custom")
depends=("libgig-svn" "jack" "sqlite" "perl-xml-parser")
makedepends=("subversion" "ladspa" "dssi" "bison" "flex")
optdepends=()
provides=('linuxsampler')
conflicts=('linuxsampler')
options=("libtool")
source=("$pkgname"::"svn+https://svn.linuxsampler.org/svn/$_pkgname/trunk"
        "http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip"
        "license.txt")
sha256sums=('SKIP'
            '74e41da563a1c91e86677530936cb46a15f1af76b29d4c1877134cf29eafb718'
            'fe9613dc00d4dafdbe9132ba00e82b0c6f333c53dffe02e29a8dfe1753c7b622')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.svn
  ./configure --prefix=/usr --enable-vstsdk-dir="$srcdir/VST3 SDK"
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
