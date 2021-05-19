# Maintainer: Please see AUR package page for current maintainer contact information.

pkgname=btrfs-compress
# compress is too generic a name!!! Also the script is unmaintained upstream but still works.
_pkgname=compress
pkgver=20190221.r11
pkgrel=2
pkgdesc="btrfs tool that makes it possible to change +c flags recursively on existing files"
arch=('i686' 'x86_64')
url="https://github.com/benapetr/compress"
license=('BSD') 
depends=('python')
source=("git+https://github.com/benapetr/$_pkgname.git#commit=5b5afb8cdfa0fbe94a1535dcd682816fc3672e1b"
        'subprocess.check_output.patch')
b2sums=('SKIP'
        '578ad8a209d7f80eacf006de338e5a9235f7b3d9f4dced084046bc8cd45feeaf39131fad86d93ed95310baa4500ae736411ce39916fb2ebe6222a4a384de2d45')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s" \
    "$(git log -1 --format="%cd" --date=short | sed 's/\-//g')" \
    "$(git rev-list --count HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch -p1 < ../subprocess.check_output.patch
}

build() {
  cd "$_pkgname"
  sed -i -e 's!\(/usr/bin/\)env !&!' src/$_pkgname
}

package() {
  cd "$_pkgname"
  install -D -m 755 src/$_pkgname "$pkgdir"/usr/bin/btrfs-compress
  install -D -m 644 README.md "$pkgdir"/usr/share/doc/btrfs-compress/README.md
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licences/btrfs-compress/LICENSE
}

# vim:set ts=2 sw=2 et:
