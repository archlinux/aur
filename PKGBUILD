# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=needrestart-git
pkgver=3.6.r8.ga443266
pkgrel=1
pkgdesc='Restart daemons after library updates.'
arch=('any')
url="https://github.com/liske/needrestart"
license=('GPL')
depends=('perl-module-find' 'perl-term-readkey' 'perl-proc-processtable'
         'perl-sort-naturally' 'perl-module-scandeps' 'perl-libintl-perl')
makedepends=('git')
optdepends=('iucode-tool: for outdated Intel microcode detection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf"
        "etc/${pkgname%-git}/notify.conf")
source=('git+https://github.com/liske/needrestart.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  find . -type f -exec sed -i 's/sbin/bin/g' {} \;
}

build() {
  cd "$srcdir/${pkgname%-git}"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT
  make DESTDIR="$pkgdir/" install

  # remove empty dirs; '!emptydirs' doesn't remove them
  rm -rf "$pkgdir/usr/lib/perl5/"
}
