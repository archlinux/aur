# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=franz
pkgver=5.11.0
pkgrel=2
epoch=1 # Due to the previous "_beta" naming
pkgdesc='Messaging app for WhatsApp, Slack, Telegram, Gmail, Hangouts and many many more.'
arch=('x86_64')
url='https://github.com/meetfranz/franz'
license=('Apache-2.0')
_electron='electron39'
depends=("$_electron")
makedepends=('git' 'nodejs' 'npm')
source=("git+$url.git#tag=v$pkgver"
        'franz.sh.in')
b2sums=('188b530974e5cc5c859d7d3dc06b42ab636c1fe8e4a9707b6a4938c59ebe6387b5417467f5d4742ebcf82076145cb919c82ee924ac3cf9253f4601e18224b466'
        '04f4015d858f38e847783bb8a7e1f774ae22a85ce7de174e5f24826934a4ffbeb978a52af7e20da39eb87a191b834d5b02ef19f121f2f8b4fcf175a2ac6bcb66')

prepare() {
  cd franz

  # Prevent Franz from being launched in development mode
  # This changes all the occurences where 'isDevMode' is set to a value.
  grep -lr 'isDevMode =' src | xargs sed -E 's|^(.*isDevMode =) .*$|\1 false|' -i

  # Just make a stored deb file
  sed -i "s|^\s*compression:.*|compression: store|" electron-builder.yml

  # Update electron-builder to work on latest system nodejs
  npm add -D electron-builder@latest

  # Use system electron binaries
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  
  npm install
}

build() {
  cd franz

  npx lerna run build
  npx gulp build
  # We prefer to build the deb format so we can have a ready made /usr/share/* much easily
  npx electron-builder --linux deb --publish=never -c.electronDist=/usr/lib/"$_electron"

  # Then extract the deb file
  bsdtar -xf ./out/franz*_amd64.deb --include='data.tar*' -O | bsdtar -xf - -C "$srcdir"
}

check() {
  cd franz
  npm run test
}

package() {
  # 1. COPY THE BINARIES
  sed -i "s|@ELECTRON@|$_electron|" franz.sh.in
  install -Dm755 franz.sh.in "$pkgdir/usr/bin/franz"
  mkdir -p "$pkgdir/usr/lib/franz/"
  cp -dr --no-preserve=ownership ./opt/Franz/resources/* "$pkgdir/usr/lib/franz/"
  rm -f "$pkgdir/usr/lib/franz/"{apparmor-profile,default_app.asar,package-type}

  # 2. COPY THE REST OF THE /usr/share/* from deb file
  sed -i 's|Exec=/opt/Franz/franz|Exec=/usr/bin/franz|' ./usr/share/applications/franz.desktop
  mkdir -p "$pkgdir/usr/share"
  cp -dr --no-preserve=ownership ./usr/share/* "$pkgdir/usr/share"

  # 3. COPY DOCS AND LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/franz/" ./franz/{CHANGELOG.md,CODE_OF_CONDUCT.md,CONTRIBUTING.md,README.md}
  install -Dm644 ./franz/LICENSE "$pkgdir/usr/share/licenses/franz/LICENSE"

  # 4. COPY APPARMOR PROFILE
  sed -i 's|/opt/Franz/franz|/usr/bin/franz|' ./opt/Franz/resources/apparmor-profile
  install -Dm644 ./opt/Franz/resources/apparmor-profile "$pkgdir/etc/apparmor.d/franz"
}
