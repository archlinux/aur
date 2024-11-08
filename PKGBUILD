# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=aced-git
_pkgname="${pkgname%-git}"
pkgver=r60.b5d1ad1
pkgrel=2
pkgdesc="Tool to parse and resolve a single targeted Active Directory principal's DACL."
arch=('any')
url="https://github.com/garrettfoster13/aced"
license=(custom)
depends=('python'
         'impacket'
         'python-ldap3'
         'python-pyasn1')
makedepends=('dos2unix' 'git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url"
        "aced.py"
        "setup.py")
sha512sums=('SKIP'
            '4604a222691732b704c31c78f89770fcc1a14aa6bbe37ed14e695eea512424666a9a40fdcb94c1e86974fee868b8559087c625eef8aee1a1bf35a8829671624e'
            '2a159be912b26a77026474c6d04875e6f503de6f1d0880a127a54cf723040647eda9f0c01bb106aa24d2f5c64f3afd44f75520ce346e10ee518d9163b07c285c')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  dos2unix aced.py
  mv aced.py $_pkgname/
  cd "$_pkgname"
  dos2unix lib/*
}

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cp setup.py $_pkgname/
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE
}

