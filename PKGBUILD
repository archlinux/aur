# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
pkgname=freespeech-vr
pkgver=0.120
pkgrel=1
pkgdesc="Free streaming voice recognition with dynamic language learning"
arch=('any')
url="https://code.google.com/p/freespeech-vr/"
license=('GPL3')
depends=('python2' 'pygtk' 'python2-xlib' 'python2-simplejson'
        'gstreamer0.10-python' 'pocketsphinx' 'cmu-sml-toolkit')
options=(!emptydirs)
source=("https://freespeech-vr.googlecode.com/files/${pkgname}_r${pkgver#0.}.zip"
        'setup.py.in'
        'fix-paths.patch')
md5sums=('033aeddcaf3b21c693016f6017260480'
         '68061c33e5bff6d8b1aed4d433ce555c'
         '1a7a33b9a68c648f77fe66ee5e17bc25')

prepare() {
  cd "$srcdir/$pkgname"

  # Fix paths
  patch -p1 -i ../fix-paths.patch

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
