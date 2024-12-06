# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=pre2k-git
_pkgname="${pkgname%-git}"
pkgver=r22.be66190
pkgrel=2
pkgdesc='Query for existence of pre-windows 2000 computer objects which can be leveraged to gain a foothold in a target domain.'
arch=('any')
url="https://github.com/garrettfoster13/pre2k-TS"
license=(MIT)
depends=('python'
         'impacket'
         'python-ldap3'
         'python-pyasn1'
         'python-rich')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url.git")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname-TS"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$_pkgname-TS"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

  cp -a "$_pkgname.py" "$pkgdir/usr/share/$_pkgname/"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec python /usr/share/$_pkgname/$_pkgname.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/$_pkgname"
}
