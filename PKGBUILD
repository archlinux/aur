# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=domainuserstoxlsx-git
_pkgname="${pkgname%-git}"
pkgver=1.2.r7.gf161de4
pkgrel=1
pkgdesc="Extract all users from an Active Directory domain to an Excel worksheet."
arch=('any')
url="https://github.com/p0dalirius/domainuserstoxlsx"
license=(custom)
depends=('impacket'
         'python'
         'python-xlsxwriter')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  cp -a DomainUsersToXLSX.py "$pkgdir/usr/share/$_pkgname/"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec python /usr/share/$_pkgname/DomainUsersToXLSX.py "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$_pkgname"
}
