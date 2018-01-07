# $Id: PKGBUILD 276332 2017-12-28 05:13:56Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pyicqt
pkgver=0.8.1.5
pkgrel=8
pkgdesc="jabber icq transport"
arch=(any)
url="https://code.google.com/archive/p/pyicqt/"
license=('GPL')
backup=(etc/ejabberd/pyicq.xml)
depends=('python2' 'python2-twisted')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pyicqt/pyicqt-$pkgver.tar.gz
	config.xml
	pyicqt.service
	pyicqt.tmpfiles)
sha256sums=('15ffa7b7d8f2d749492eec3b87bf64f8a429452282ca14e36ba5aee45b5322df'
            'c0738542542097fe4548164b2561a51276e45a2af19780fef80905c0e8e13f58'
            'b01423f54bc14c57da040c24825e67c996f7d0622f539c5261299ad35282d21f'
            '21b979d6ca95c48ce9c053ebc4bf764beaacf565abe6efaeb0e1d8ad52c1ddad')

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
  install -d -m0755 "$pkgdir"/var/spool/pyicqt
  install -D -m0644 ./config.xml "$pkgdir"/etc/ejabberd/pyicq.xml
  mv "$pkgdir"/usr/lib/$pkgname/config_example.xml "$pkgdir"/etc/ejabberd/pyicq_example.xml
  ln -s ../../../etc/ejabberd/pyicq.xml "$pkgdir"/usr/lib/$pkgname/config.xml

  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
