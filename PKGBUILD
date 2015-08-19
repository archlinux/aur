# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
_pkgbase=freespeech-vr
pkgname=${_pkgbase}-devel
pkgver=r148
pkgrel=1
pkgdesc="Free streaming voice recognition with dynamic language learning (development version)"
arch=('any')
url="https://thenerdshow.com/freespeech.html"
license=('GPL3')
depends=('python2' 'pygtk' 'python2-xlib' 'python2-simplejson'
         'gstreamer0.10-python' 'pocketsphinx' 'cmuclmtk'
         'python2-appdirs')
makedepends=('svn')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
options=(!emptydirs)
source=("${_pkgbase}::svn+http://freespeech-vr.googlecode.com/svn/trunk/"
        'setup.py.in'
        'confdir.patch'
        'text2idngram.patch')
md5sums=('SKIP'
         'b9b63900c73b4c03d88c2946fd17668a'
         '0c93a752d9983695e7801212b4ccd458'
         '447f88266c75e83d91c200ebcc05a6c0')

pkgver() {
  cd "$srcdir/$_pkgbase"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$_pkgbase"

  # Fix location of configuration directory
  patch -p1 -i ../confdir.patch
  # Fix text2idngram invocation
  patch -p1 -i ../text2idngram.patch

  # Use python2
  sed -i -e '1s/python$/python2/' *.py

  # Add setup.py
  sed -e "s/@PKGVER@/$pkgver/" < "$srcdir/setup.py.in" > setup.py
}

package() {
  cd "$srcdir/$_pkgbase"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # Add wrapper script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/freespeech" << EOF
#!/bin/sh
exec /usr/lib/python2.7/site-packages/freespeech-vr/freespeech.py
EOF
  chmod +x "$pkgdir/usr/bin/freespeech"
  chmod +x "$pkgdir/usr/lib/python2.7/site-packages/freespeech-vr/freespeech.py"

  # Add documentation
  install -D -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
