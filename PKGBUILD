# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapper-git
_pkgname="${pkgname%-git}"
pkgver=r13.5c4bbe6
pkgrel=1
pkgdesc="LDAP Querying without the Suck"
arch=('any')
url="https://github.com/shellster/ldapper"
license=(MIT)
depends=('python'
         'impacket'
         'python-colorama'
         'python-ldap3'
         'python-pyaml'
         'python-pyopenssl')
makedepends=('dos2unix' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  dos2unix *.py
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" $_pkgname/LICENSE
  install -Dm644 -t "$pkgdir/opt/$_pkgname" $_pkgname/README.md
  install -Dm755 "$srcdir/$_pkgname/ldap_connector.py" "$pkgdir/opt/$_pkgname/ldap_connector.py"
  install -Dm755 "$srcdir/$_pkgname/ldapper.py" "$pkgdir/opt/$_pkgname/ldapper.py"
  install -Dm755 "$srcdir/$_pkgname/queries.py" "$pkgdir/opt/$_pkgname/queries.py"
  install -Dm755 "$srcdir/$_pkgname/utilities.py" "$pkgdir/opt/$_pkgname/utilities.py"
  echo "Now for the symlink"  
  install -d "$pkgdir/usr/bin"
  ln -s /opt/$_pkgname/ldapper.py "${pkgdir}/usr/bin"
}

