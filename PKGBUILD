# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=gpowned-git
_pkgname="${pkgname%-git}"
pkgver=r16.cf2dfcf
pkgrel=1
pkgdesc="GPOs manipulation tool."
arch=('any')
url="https://github.com/X-C3LL/gpowned"
license=(custom)
makedepends=('git')
depends=('impacket' 'python' 'python-ldap3')
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
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  install -Dm 644 requirements.txt "$pkgdir/usr/share/$_pkgname/requirements.txt"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" *.md
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  cp -a GPOwned.py "$pkgdir/usr/share/$_pkgname/"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec python /usr/share/$_pkgname/GPOwned.py "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$_pkgname"
}

