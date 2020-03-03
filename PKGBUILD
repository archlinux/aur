# Maintainer: Moritz Kiefer <moritz.kiefer at purelyfunctional dot org>
# Contributor: Jiri Prochazka <ojirio at gmail dot com>
# Contributor: orbisvicis <orbisvicis at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=linuxsampler-svn
_pkgname="${pkgname%-svn}"
pkgver=r3751
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
        "http://www.steinberg.net/sdk_downloads/vstsdk366_27_06_2016_build_61.zip"
        "license.txt")
sha256sums=('SKIP'
            '71c609fe74d4bfef9e76e9dd26ebc699105bb7a614ee4cc68550c4bb46c8fa15'
            'fe9613dc00d4dafdbe9132ba00e82b0c6f333c53dffe02e29a8dfe1753c7b622')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"
  make -f Makefile.svn
  ./configure --prefix=/usr --enable-vstsdk-dir="$srcdir/VST3 SDK" \
              --enable-default-instruments-db-location="$pkgdir/var/lib/linuxsampler/instruments.db"
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
