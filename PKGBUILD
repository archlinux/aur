# Maintainer: Will Price <will.price94+aur@gmail.com>

pkgname=boot-vhdl-git
pkgver=4.5
pkgrel=1
pkgdesc="A VHDL simulator and synthesizer"
arch=('i686' 'x86_64')
license=('GPL')
url="https://code.google.com/p/boot-vhdl/"
depends=('python2' 'ghdl' 'pywebkitgtk' 'python2-mechanize'
'python2-pygments')
source=('boot-vhdl::git+https://code.google.com/p/boot-vhdl/')
md5sums=('SKIP')

prepare() {
  _fix_python_invocations
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,share/{applications,pixmaps,boot-vhdl}}
  cp -r "$srcdir"/boot-vhdl/boot_scr/*.py \
        "$pkgdir/usr/share/boot-vhdl/"
  cp -r "$srcdir/boot-vhdl/boot_scr/old" \
        "$pkgdir/usr/share/boot-vhdl/"
  cp -r "$srcdir/boot-vhdl/LICENSE" \
        "$pkgdir/usr/share/boot-vhdl/LICENSE"

  for _suffix in png svg; do
    cp "$srcdir/boot-vhdl/boot_scr/boot-icon.$_suffix" \
       "$pkgdir/usr/share/pixmaps"
  done

  cp "$srcdir/boot-vhdl/boot_scr/boot.desktop" \
     "$pkgdir/usr/share/applications"
 cat << EOF > "$pkgdir/usr/bin/boot"
#!/bin/sh
python2 /usr/share/boot-vhdl/boot.py
EOF
  chmod 755 "$pkgdir/usr/bin/boot"
}

_fix_python_invocations() {
  # | replaces / as it's easier to identify
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $srcdir -name '*.py')
}
