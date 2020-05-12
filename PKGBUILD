# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgbase=rainloop-webmail
pkgname=(
  'rainloop-webmail-community'
  'rainloop-webmail-standard'
)
pkgver=1.14.0
pkgrel=1
pkgdesc="modern PHP webmail client"
arch=('any')
url="https://www.rainloop.net"
depends=('php-fpm')
makedepends=('nodejs' 'yarn' 'gulp')
optdepends=('mariadb: storage backend for contacts'
            'php-pgsql: storage backend for contacts'
            'php-sqlite: storage backend for contacts')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/RainLoop/rainloop-webmail/archive/v$pkgver.tar.gz"
        "$pkgbase.sysusers"
        "$pkgbase.tmpfiles"
        "LICENSE")
sha512sums=('9fd953ac018ac57eeebb8c9a7a2d57013e988d1608edb5bbc2a3059ccff4f0cd4762687d0eacaefa67c9e9083995239817080f6f573cbcc63fda622f58e3a484'
            '291c1026ce0538e96938167f1f295205a06c94d0d8b8c359d456d56fd24bb3b2c71b01204fb8bf0c2386e8db31634b205128c6cf6294e6b4cb96944f842cb34f'
            '6c2bda521911642d0e9c45a951789fc4d4d7f1ffee30b8097e49f9d4c0d8454e91de245a0db59ebaa536e9c39a236a8b6aadc0d918a1d08161894a02878940d7'
            '380e99754654aa08cca5038c2b4e62b9391fd83b4ece2d988fb3a19f3028efb8155565844d153b62d82451aa1cfa6cf924d4e620867b9e1abf871b7ec9aab5bf')

prepare() {
  # note: obtained from upstream's debian script (makedeb.sh)
  # this ensures that configuration is stored in /var/lib/rainloop
  # rather than /usr/share/rainloop
  sed -i "s/\$sCustomDataPath = '';/\$sCustomDataPath = '\/var\/lib\/rainloop';/" "$pkgbase-$pkgver/rainloop/v/0.0.0/include.php"

  # create folders for building
  mkdir -p build/{standard,community}
}

build() {
  cd "$pkgbase-$pkgver"
  yarn install

  # build community
  gulp rainloop
  bsdtar -x \
    -C "$srcdir/build/community" \
    -f "build/dist/releases/webmail/$pkgver/rainloop-community-$pkgver.zip"

  # build standard
  gulp rainloop --pro
  bsdtar -x \
    -C "$srcdir/build/standard" \
    -f "build/dist/releases/webmail/$pkgver/rainloop-$pkgver.zip"
}

package_rainloop-webmail-community() {
  pkgdesc+=" (community)"
  license=('AGPL3')
  provides=('rainloop-webmail')
  conflicts=('rainloop-webmail-standard')

  # directories
  install -dm755 "$pkgdir/usr/share/rainloop" \
    "$pkgdir/var/lib/rainloop"

  # application files
  cp -r "$srcdir/build/community/rainloop" "$pkgdir/usr/share/rainloop"
  install -Dm644 -t "$pkgdir/usr/share/rainloop" "$srcdir/build/community/index.php"

  # data files
  cp -r "$srcdir/build/community/data" "$pkgdir/var/lib/rainloop"

  # sysusers
  install -Dm644 "$srcdir/$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/rainloop.conf"
  install -Dm644 "$srcdir/$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/rainloop.conf"
}

package_rainloop-webmail-standard() {
  pkgdesc+=" (standard)"
  license=('custom:rainloop')
  provides=('rainloop-webmail')
  conflicts=('rainloop-webmail-community')

  # custom license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"

  # directories
  install -dm755 "$pkgdir/usr/share/rainloop" \
    "$pkgdir/var/lib/rainloop"

  # application files
  cp -r "$srcdir/build/standard/rainloop" "$pkgdir/usr/share/rainloop"
  install -Dm644 -t "$pkgdir/usr/share/rainloop" "$srcdir/build/standard/index.php"

  # data files
  cp -r "$srcdir/build/standard/data" "$pkgdir/var/lib/rainloop"

  # sysusers
  install -Dm644 "$srcdir/$pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/rainloop.conf"
  install -Dm644 "$srcdir/$pkgbase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/rainloop.conf"
}

