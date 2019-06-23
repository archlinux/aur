# Maintainer: Daniel Manila <daniel.develop@manilas.net>
pkgname=weresync
pkgver=1.1.5
pkgrel=1
_name=WereSync
pkgdesc='Incrementally clone linux drives'
arch=(any)
url='https://github.com/DonyorM/weresync'
license=('Apache')
groups=('any')
depends=('python' 'python-parse' 'python-yapsy' 'python-dbus' 'rsync' 'gptfdisk' 'parted')
optdepends=('polkit')
makedepends=('python' 'python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'setup.patch' 'net.manilas.weresync.service.policy' 'weresync-daemon-gui.sh'
        'weresync.1' 'service.patch')
#WereSync v1.1.5 md5sum
md5sums=('dd6bb35d298f51d4f8e06a0bf2aab925' '46119cd590cfe73d630a22061444278b' 
         '331aabe242015106d7d153d60a26f472' 'a9d5b2748b5cfb26398ea27e42a49bfc'
         '0703a7fcc6b42abdc880960005d995a8' '21ae7729f0df95cec8e37ae70d8fe59d')

prepare() {
  cd "$srcdir/${_name}-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/setup.patch"
  patch --forward --strip=1 --input="${srcdir}/service.patch"
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir/usr/bin/weresync-gui" "$pkgdir/usr/bin/weresync-gui-only"
  mkdir -p "$pkgdir/usr/share/polkit-1/actions" "$pkgdir/usr/share/man"
  cp "$srcdir/net.manilas.weresync.service.policy" "$pkgdir/usr/share/polkit-1/actions/"
  cp "$srcdir/weresync.1" "$pkgdir/usr/share/man/"
  cp "$srcdir/weresync-daemon-gui.sh" "$pkgdir/usr/bin/weresync-gui"
}

# vim:set ts=2 sw=2 et
