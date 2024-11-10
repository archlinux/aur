# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=gpowned-git
_pkgname="${pkgname%-git}"
pkgver=r13.b524eb7
pkgrel=1
pkgdesc="Buggy script to play with GPOs"
arch=('any')
url="https://github.com/X-C3LL/gpowned/"
license=(custom)
makedepends=('git')
depends=('python')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname"

  install -dm 755 "$pkgdir/usr/bin"
  install -Dm 644 requirements.txt "$pkgdir/usr/share/$_pkgname/requirements.txt"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" *.md

  cp -a * "$pkgdir/usr/share/$_pkgname/"
  mv "$pkgdir/usr/share/$_pkgname/GPOwned.py" "$pkgdir/usr/share/$_pkgname/$_pkgname.py"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec python /usr/share/$_pkgname/$_pkgname.py "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$_pkgname"
}

