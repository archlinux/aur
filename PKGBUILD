# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
pkgname=shout-irc
_upstreamname=shout
pkgver=0.51.2
pkgrel=1
pkgdesc="Web-based IRC client"
url='http://shout-irc.com/'
arch=('any')
license=('MIT')
depends=('nodejs')
install=install
source=("https://github.com/erming/${_upstreamname}/archive/${pkgver}.tar.gz"
        "system.service"
        "user.service")
sha256sums=('63ac098ed1a6d2a731369b2b9e08fe9e372aa0e1d64cf23f734cca5605b11ba2'
            'beac3a8a25700997f0f2a154ee85e8c89d64082856d194434b01116a0f4edb91'
            '322d152da59c066617dbab9604099bf25ca2b175ae6bd508643b38344be043d8'
)

prepare() {
  cd ${srcdir}/${_upstreamname}-${pkgver}
  npm install
}

package() {
  _share=$pkgdir/usr/share/$pkgname
  _etc=$pkgdir/etc/$pkgname

  cd ${srcdir}/${_upstreamname}-${pkgver}

  install -dm755 $pkgdir/usr/bin
  install -dm755 $_share
  install -dm700 $_etc $_etc/users
  install -Dm600 defaults/config.js $_etc/config-dist.js
  cp -RT . $_share
  ln -s /usr/share/$pkgname/index.js $pkgdir/usr/bin/$pkgname

  install -Dm644 $srcdir/system.service $pkgdir/usr/lib/systemd/system/${pkgname}.service
  install -Dm644 $srcdir/user.service $pkgdir/usr/lib/systemd/user/${pkgname}.service
}
