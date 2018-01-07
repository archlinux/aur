# $Id: PKGBUILD 241021 2017-06-26 15:45:58Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Moritz Rudert <helios@cyb0rg.org>

pkgname=pymsnt
pkgver=0.11.3
pkgrel=10
pkgdesc="jabber msn transport"
arch=(any)
url="http://delx.net.au/projects/pymsnt/"
license=('GPL')
backup=(etc/ejabberd/pymsn.xml)
depends=('python2' 'python2-twisted' 'python2-pyopenssl')
source=(https://delx.net.au/projects/pymsnt/tarballs/pymsnt-$pkgver.tar.gz
	pymsnt.service
	config.xml
	pymsnt-version.patch)
sha256sums=('777195feb6a70b683d691c54269099d319747fad7195cca36d86df366360ce2c'
            '6d82284eef36446895361f72e0f29987e8d45125261b6dc101b8f6474156cc64'
            'eafc890575973f58b7f9c1284dac35de76578606c14a4407f22b6201d04d5a90'
            '7636b3d126b3e4022029c74eac885b7d35b40e7fdf609a33733677e4db698d7a')

package() {
  cd "$srcdir"
  patch -p0 < "$srcdir"/pymsnt-version.patch

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  install -d -m0755 "$pkgdir"/usr/lib
  cp -r ${pkgname}-$pkgver "$pkgdir"/usr/lib
  mv "$pkgdir"/usr/lib/${pkgname}-$pkgver "$pkgdir"/usr/lib/$pkgname
  install -d -m0755 "$pkgdir"/var/spool/pymsnt
  install -D -m0644 ./config.xml "$pkgdir"/etc/ejabberd/pymsn.xml
  mv "$pkgdir"/usr/lib/$pkgname/config-example.xml "$pkgdir"/etc/ejabberd/pymsn_example.xml
  ln -s ../../../etc/ejabberd/pymsn.xml "$pkgdir"/usr/lib/$pkgname/config.xml

  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
