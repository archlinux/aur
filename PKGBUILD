# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>

# "...in the meantime, head is a better bet, both in stability,
#  performance and correctness."
# (source: http://lists.w3.org/Archives/Public/public-qa-dev/2012Nov/0011.html)
_cvsroot=":pserver:anonymous:anonymous@dev.w3.org:/sources/public"
_cvsmod="2002/css-validator"
_cvsyear="2015"
_cvsmonth="03"
_cvsday="01"

pkgname=w3c-css-validator
pkgver=2.1.$_cvsyear$_cvsmonth$_cvsday
pkgrel=1
pkgdesc="A tool for checking if CSS files conform with standards"
arch=('any')
url="http://jigsaw.w3.org/css-validator"
license=('custom')
depends=('java-environment' 'bash')
makedepends=('cvs' 'apache-ant')
source=('build.xml_clean_lib_dir.patch'
        'build.xml_download_dependencies.patch'
        'w3c-css-validator'
        'http://jigsaw.w3.org/Distrib/jigsaw_2.2.6.tar.gz'
        'http://apache.mesi.com.ar/velocity/engine/1.7/velocity-1.7.tar.gz')
md5sums=('5c72612571537a67e3dac6eec034cf84'
         '42912497b15e33d23af89b89dcbe84e4'
         '83492dcf81e490dd0588a3626023aadc'
         'c848e06d7851ca0d243fd8bdef4c7765'
         '6af13ea297dee7ddbabeaa8e3963c184')

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsroot CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$_cvsyear-$_cvsmonth-$_cvsday" "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  # https://www.w3.org/Bugs/Public/show_bug.cgi?id=24516
  patch -i "$srcdir/build.xml_download_dependencies.patch" build.xml
  patch -i "$srcdir/build.xml_clean_lib_dir.patch" build.xml

  # For some reason, ant downloads gibberish instead of jigsaw,
  # using the very same URL as this script.
  mkdir -p "$srcdir/$_cvsmod-build/tmp"
  cp "$srcdir/jigsaw_2.2.6.tar.gz" "$srcdir/$_cvsmod-build/tmp"

  # Official apache mirror is unstable as of 2015-04-02,
  # so switching to another one.
  cp "$srcdir/velocity-1.7.tar.gz" "$srcdir/$_cvsmod-build/tmp"

  ant
}

package() {
  cd "$srcdir/$_cvsmod-build"
  install -d "$pkgdir/usr/share/java/$pkgname" "$pkgdir/usr/bin"
  install "$srcdir/w3c-css-validator" "$pkgdir/usr/bin"
  install -m644 css-validator.jar "$pkgdir/usr/share/java/$pkgname"
  for name in lib/*.jar ; do
    install -m644 "$name" "$pkgdir/usr/share/java/$pkgname"
  done
  install -D -m644 COPYRIGHT.html "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}

# vim:set ts=2 sw=2 et:
