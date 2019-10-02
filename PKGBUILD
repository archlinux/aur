# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Alexander Görtz <aur@nyloc.de>
# Contributor : Dan Beste <dan.ray.beste@gmail.com>
# Contributor : Julien Nicoulaud <julien dot nicoulaud at gmail dot com>
# Contributor : stef204 <https://aur.archlinux.org/account/stef204>


pkgname=borgmatic

pkgver=1.3.23
pkgrel=1

pkgdesc='Simple, configuration-driven backup software for servers and workstations'
arch=('any')
url=https://torsion.org/borgmatic/
license=('GPL3')

depends=('borg' 'python-colorama' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools')

install="$pkgname.install"
changelog=NEWS
source=("https://projects.torsion.org/witten/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('12e9c91504efd39e7af8b7be6b5f18cef583b8d2f8be8873ecb7d8bf615d6251')

prepare() {
  cd "$pkgname"
  sed -i 's|/root/.local/bin|/usr/bin|' sample/systemd/borgmatic.service
}

package() {
  cd "$pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir"/usr/{lib/systemd/system,share/{doc/$pkgname/cron,pixmaps}}
  install -m644  sample/systemd/*           "$pkgdir/usr/lib/systemd/system/"
  install -m644  sample/cron/borgmatic      "$pkgdir/usr/share/doc/$pkgname/cron/$pkgname"
  install -m644  AUTHORS NEWS README.md     "$pkgdir/usr/share/doc/$pkgname/"
  cp      -a     docs/{reference,how-to}    "$pkgdir/usr/share/doc/$pkgname/"
  install -m644  static/borgmatic.{png,svg} "$pkgdir/usr/share/pixmaps/"
}

# vim: ts=2 sw=2 et:
