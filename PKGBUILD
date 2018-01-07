# $Id: PKGBUILD 276332 2017-12-28 05:13:56Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pyaimt
pkgver=0.8.0.1
pkgrel=8
pkgdesc="jabber aim transport"
arch=('any')
url="https://code.google.com/archive/p/pyaimt/"
license=('GPL')
backup=(etc/ejabberd/pyaimt.xml)
provides=(pyaim)
replaces=(pyaim)
depends=('python2' 'python2-twisted')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pyaimt/pyaimt-$pkgver.tar.gz
	pyaimt.service
	config.xml)
md5sums=('121b59a5a3dd3b7c1e30475b0cb7730c'
         'fc0f33f7f32fb9500fbee3b22fbd9a10'
         'bf89b68fe527764cc9e6a059dc36ef2b')

package() {
  cd "$srcdir"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  install -d -m0755 "$pkgdir"/usr/lib
  cp -r $pkgname-$pkgver "$pkgdir"/usr/lib
  mv "$pkgdir"/usr/lib/$pkgname-$pkgver "$pkgdir"/usr/lib/$pkgname
  install -d -m0755 "$pkgdir"/var/spool/pyaimt
  install -D -m0644 ./config.xml "$pkgdir"/etc/ejabberd/pyaimt.xml
  mv "$pkgdir"/usr/lib/$pkgname/config_example.xml "$pkgdir"/etc/ejabberd/pyaim_example.xml
  ln -s ../../../etc/ejabberd/pyaimt.xml "$pkgdir"/usr/lib/$pkgname/config.xml
  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
