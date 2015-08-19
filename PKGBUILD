# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
pkgname=freespeech-vr
pkgver=0.120
pkgrel=2
pkgdesc="Free streaming voice recognition with dynamic language learning"
arch=('any')
url="https://thenerdshow.com/freespeech.html"
license=('GPL3')
depends=('python2' 'pygtk' 'python2-xlib' 'python2-simplejson'
         'gstreamer0.10-python' 'pocketsphinx' 'cmuclmtk'
         'python2-appdirs')
options=(!emptydirs)
source=("https://freespeech-vr.googlecode.com/files/${pkgname}_r${pkgver#0.}.zip"
        'setup.py.in'
        'confdir.patch'
        'text2idngram.patch')
md5sums=('033aeddcaf3b21c693016f6017260480'
         'b9b63900c73b4c03d88c2946fd17668a'
         '4dbd98a88871f69742d82bf72ce86fbe'
         '4c56a2a3bc3b006e0ea36166045ce75c')

prepare() {
  cd "$srcdir/$pkgname"

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
  cd "$srcdir/$pkgname"
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
