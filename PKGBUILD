# Maintainer: Kyohei Kadota <lufia (at) lufia.org>
# Contributor: DeedleFake <deedlefake at users dot noreply dot github dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Calvin McAnarney <csm@gmx.us>
# Contributor: Julien Pecqueur <jpec@julienpecqueur.com>
# Contributor: Sergiusz Urbaniak <sergiusz.urbaniak@gmail.com>

pkgname=plan9port-wayland-git
pkgver=r3950.0c6d0f74
pkgrel=2
pkgdesc="A port of many Plan 9 libraries and programs to Unix with devdraw Wayland patches."
arch=('i686' 'x86_64')
url="https://github.com/9fans/plan9port"
url="http://swtch.com/plan9port/"
license=('custom')
depends=('wayland' 'fuse')
makedepends=('git' 'gendesk')
provides=('plan9port')
install='plan9.install'
conflicts=('9base' 'plan9port')
options=('!zipman' 'staticlibs')
source=("$pkgname::git+https://github.com/droyo/plan9port.git#branch=wayland-im"
        plan9.sh acme.sh acme.png acme.desktop)
md5sums=('SKIP'
         'c884c3c90a107f1a178718c304c67d30'
         '0a3d8aaabd7cac1b8189a5551515d63f'
         '266d160d71a2b4f1ec9859b5232c36da'
         '2293e6d45944427d24a7b03e4d87da1c')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/"
  # Generate a desktop shortcut for the Acme editor
  gendesk -f \
          --pkgname acme \
          --name Acme \
          --genericname Editor \
          --comment 'Editor from Plan9' \
          --categories 'Application;Development;TextEditor'
}

package() {
  cd "$srcdir/$pkgname"

  # Try the gentoo way for fixing hardcoded paths
  PLAN9=/usr/lib/plan9
  grep --null -l -r '/usr/local/plan9' | xargs --null sed -i "s!/usr/local/plan9!/usr/lib/plan9!g"

  ./INSTALL -b
  install -Dm755 ../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"

  mkdir -p $pkgdir/usr/{lib,share/doc/$pkgname}

  cp -r "$srcdir/$pkgname" "$pkgdir/usr/lib/plan9"
  cd "$pkgdir/usr/lib/plan9"
  ./INSTALL -c -r "$pkgdir/usr/lib/plan9"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Package text files
  for i in CHANGES CONTRIBUTORS README.md; do
    install -m644 $i "$pkgdir/usr/share/doc/$pkgname"
    rm -f $i
  done

  # Decompress the plan9 man pages
  for i in $(find $pkgdir/usr/lib/plan9/man -type f); do
    if [ ${i##*.} = "gz" ]; then
      gunzip "$i"
    fi
  done

  grep --null -l -r "$pkgdir/usr/lib/plan9" | xargs --null sed -i "s@$pkgdir/usr/lib/plan9@/usr/lib/plan9@g" || true
  grep --null -l -r "/build/plan9port/pkg/$pkgname/usr/lib/plan9" | xargs --null \
    sed -i "s!/build/plan9port/pkg/$pkgname/usr/lib/plan9!/usr/lib/plan9!g" || true

  cd "$srcdir/"
  install -Dm755 acme.sh $pkgdir/usr/bin/acme
  install -Dm644 acme.png $pkgdir/usr/share/pixmaps/acme.png
  install -Dm644 acme.desktop $pkgdir/usr/share/applications/acme.desktop

  # Clean up
  cd "$pkgdir/usr/lib/plan9"
  rm -rf .git .gitignore config install.log install.sum configure Makefile INSTALL LICENSE
  find . -name '.cvsignore' -print0 | xargs -0 rm -f
}
