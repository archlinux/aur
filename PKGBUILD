# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapmonitor-git
_pkgname="${pkgname%-git}"
pkgver=1.4.r12.g498e048
pkgrel=2
pkgdesc="Monitor creation, deletion and changes to LDAP objects live during your pentest or system administration!"
arch=('any')
url="https://github.com/p0dalirius/ldapmonitor"
license=(custom)
depends=('python'
         'python-ldap3'
         'python-pycryptodome'
         'python-sectools>=1.4.3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm0644 $srcdir/$_pkgname/LICENCE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/$_pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" python/README.md

  cp -aT "python/pyLDAPmonitor.py" "$pkgdir/usr/share/$_pkgname/$_pkgname.py"

  cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/sh
exec python /usr/share/$_pkgname/$_pkgname.py "\$@"
EOF

  chmod a+x "$pkgdir/usr/bin/$_pkgname"
}

