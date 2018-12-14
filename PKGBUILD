# Maintainer: Isabell Cowan < izzi at izzette com >
# Contributer: Martin Trigaux <me@mart-e.be>

_pkgname='ardor'

pkgbase="$_pkgname-system"
pkgname=("$pkgbase")
pkgver=2.2.1
pkgrel=1
pkgdesc="The Ardor Reference Software Client -- Secure System Installation."
url="https://www.ardorplatform.org"
license=('MIT' 'GPL')
install="${pkgname[0]}.install"
source=("https://bitbucket.org/Jelurida/ardor/downloads/ardor-client-$pkgver.zip"
        'ardor.desktop'
        'ardor.default'
        'ardor.service')
sha256sums=('4e6a3075141847252724e13a49d3e8110694a49a08fc22dfd986b53a39f3770d'
            'a6787a24aad510f3b4f8b6c724221a9518c34298425c9b93f9ac4ded94ba4544'
            '1fd2eb63c2778279f9e17cafa650399ed67bc8ba2428745bd56a01d41e949ff5'
            '9e9540a65c661f6ece0113726549df11735ee75b122b4751412cae79f9c4b362')
arch=('any')
backup=('opt/ardor/conf/data/PUBLIC_KEY.json'
        'opt/ardor/conf/data/IGNIS-testnet.json'
        'opt/ardor/conf/data/AEUR.json'
        'opt/ardor/conf/data/ARDR-testnet.json'
        'opt/ardor/conf/data/ACCOUNT_CONTROL.json'
        'opt/ardor/conf/data/BITSWIFT.json'
        'opt/ardor/conf/data/PUBLIC_KEY-testnet.json'
        'opt/ardor/conf/data/ACCOUNT_PROPERTIES.json'
        'opt/ardor/conf/data/ASSETS-testnet.json'
        'opt/ardor/conf/data/IGNIS.json'
        'opt/ardor/conf/data/IGNIS_CURRENCIES-testnet.json'
        'opt/ardor/conf/data/ASSETS.json'
        'opt/ardor/conf/data/IGNIS_ALIASES.json'
        'opt/ardor/conf/data/ACCOUNT_INFO.json'
        'opt/ardor/conf/data/IGNIS_ALIASES-testnet.json'
        'opt/ardor/conf/data/BITSWIFT-testnet.json'
        'opt/ardor/conf/data/ACCOUNT_INFO-testnet.json'
        'opt/ardor/conf/data/ARDR.json'
        'opt/ardor/conf/data/AEUR-testnet.json'
        'opt/ardor/conf/data/IGNIS_CURRENCIES.json'
        'opt/ardor/conf/data/ACCOUNT_CONTROL-testnet.json'
        'opt/ardor/conf/data/ACCOUNT_PROPERTIES-testnet.json'
        'opt/ardor/conf/nxt-default.properties'
        'opt/ardor/conf/logging-default.properties'
        'etc/default/ardor')
depends=('jre8-openjdk')
conflicts=('ardor')
provides=('ardor')
# Takes forever, is pointless ...
options=('!strip' 'emptydirs')

package() {
  msg2 "Installing ardor client..."
  install -dm755 "$pkgdir/opt/ardor"
  cp -r "$_pkgname/." "$pkgdir/opt/ardor"
  rm -f "$pkgdir/opt/ardor/conf/.lock"
  rm -rf --preserve-root "$pkgdir/opt/ardor/logs"
  install -dm755 "$pkgdir/opt/ardor/.ardor"

  msg2 "Removing unneeded files for windows..."
  rm -f -- "$pkgdir/opt/ardor"/*.{bat,exe}

  msg2 "Correcting permissions..."
  find "$pkgdir/opt/ardor" -type d -exec chmod 0755 \{\} +
  find "$pkgdir/opt/ardor" -maxdepth 1 -type f -executable -name \*.sh -exec chmod 0755 \{\} +
  find "$pkgdir/opt/ardor" -type f \! \( -executable -a -name \*.sh \) -exec chmod 0644 \{\} +
  chmod 0750 "$pkgdir/opt/ardor/conf/data"
  chmod 0640 "$pkgdir/opt/ardor/conf/nxt-default.properties"

  msg2 "Installing ardor icon..."
  install -Dm644 \
    "$srcdir/$_pkgname/html/www/img/nxt-icon-32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/ardor.png"

  msg2 "Installing ardor.desktop..."
  install -Dm644 \
    "$srcdir/ardor.desktop" \
    "$pkgdir/usr/share/applications/ardor.desktop"

  msg2 "Installing ardor ${license[0]} license(s)..."
  install -dm755 "$pkgdir/usr/share/licenses/ardor"
  mv \
    "$pkgdir/opt/ardor/LICENSE.txt" \
    "$pkgdir/opt/ardor/3RD-PARTY-LICENSES.txt" \
    "$pkgdir/usr/share/licenses/ardor/"

  msg2 "Creating ardor database directory..."
  install -dm750 "$pkgdir/var/lib/ardor"
  ln -s \
    "/var/lib/ardor" \
    "$pkgdir/opt/ardor/nxt_db"

  msg2 "Creating ardor log directory..."
  install -dm755 "$pkgdir/var/log/ardor"
  ln -s \
    "/var/log/ardor" \
    "$pkgdir/opt/ardor/logs"

  msg2 "Installing ardor.default..."
  install -Dm644 \
    "$srcdir/ardor.default" \
    "$pkgdir/etc/default/ardor"

  msg2 "Installing ardor systemd service..."
  install -Dm644 \
    "$srcdir/ardor.service" \
    "$pkgdir/usr/lib/systemd/system/ardor.service"
}

# vim: set ts=2 sw=2 et syn=sh:
