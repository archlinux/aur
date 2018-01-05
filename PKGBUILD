# $Id: PKGBUILD 277866 2018-01-03 07:07:24Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer : Aaron Griffin <aaron@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=clearsilver
pkgver=0.10.5
pkgrel=26
pkgdesc="clearsilver is a fast, powerful, and language-neutral HTML template system"
arch=('x86_64')
url='http://www.clearsilver.net'
license=('custom')
depends=('python2' 'perl' 'ruby' 'java-runtime')
makedepends=('java-environment')
options=('!emptydirs' 'staticlibs')
source=("http://www.clearsilver.net/downloads/$pkgname-$pkgver.tar.gz"
        "clearsilver-ruby-1.9.patch"
        "c99.patch")
md5sums=('b8c0c7fbe0ef5e06e0c935f134304d44'
         'd9db4e5985254e1b0d63e9ff042773f4'
         '18b9bf6755786f202b25477b5e882792')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i "s@/usr/local/bin/python@/usr/bin/env python2@g" scripts/document.py
  sed -i "s@install.rb install@install.rb install --prefix="$pkgdir"@g" ruby/Makefile
  patch -p1 <"$srcdir"/clearsilver-ruby-1.9.patch
  patch -p1 <"$srcdir"/c99.patch
  patch -p0 ruby/install.rb <<EOF
71,73c71,73
<     siteruby   = subprefix.call(c['sitedir'])
<     versite    = subprefix.call(c['sitelibdir'])
<     sodir      = subprefix.call(c['sitearchdir'])
---
>     siteruby   = subprefix.call(c['vendordir'])
>     versite    = subprefix.call(c['vendorlibdir'])
>     sodir      = subprefix.call(c['vendorarchdir'])
EOF
  sed -i 's|LIBRARIES = inserted + LIBRARIES|LIBRARIES = LIBRARIES + inserted|' python/setup.py

  # fix for ruby 2.2
  sed -i 's|::Config::|RbConfig::|g' ruby/install.rb
  if [ $CARCH == "x86_64" ]; then
    sed -i 's|-2128917020|2166050276|' cs/test_crc.cs.gold
  fi
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export PERL_MM_OPT='INSTALLDIRS=vendor'
  ./configure --disable-csharp --prefix=/usr --with-python=/usr/bin/python2
  make
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  (cd ruby && make testrb)
  (cd perl && make test)
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make PREFIX="$pkgdir" DESTDIR="$pkgdir" install

  install -Dm644 CS_LICENSE "$pkgdir"/usr/share/licenses/clearsilver/license.txt
  mv "$pkgdir"/usr/man/man3/* "$pkgdir"/usr/share/man/man3/
  rm -rf "$pkgdir"/usr/man

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete

# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}
