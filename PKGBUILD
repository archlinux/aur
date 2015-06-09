# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitrated-git
pkgver=20150104
pkgrel=1
pkgdesc="Bitcoin arbitration marketplace"
arch=('i686' 'x86_64')
depends=('mongodb' 'nodejs')
makedepends=('git' 'nodejs-browserify' 'nodejs-jade' 'nodejs-stylus' 'npm')
url="https://www.bitrated.com"
license=('AGPL3')
source=(git+https://github.com/shesek/bitrated
        bitrated.service)
sha256sums=('SKIP'
            'a8a988b0cb7ff08e606242ace4fc46b305309b74e0e096e4429c4d4dd195798b')
provides=('bitrated')
conflicts=('bitrated')
options=('!emptydirs' '!strip')
install=bitrated.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Setting node env to production...'
  sed -i 's!NODE_ENV=development!NODE_ENV=production!' example.env

  msg 'Setting mongodb URI...'
  sed -i 's!MONGO_URI=mongodb://localhost/!MONGO_URI=mongodb://localhost:27017!' example.env

  msg 'Setting build target...'
  sed -i 's!#export TARGET=./build/!export TARGET=./static!' example.env

  msg 'Activating mainnet...'
  sed -i 's!export TESTNET!#export TESTNET!' example.env

  msg 'Serving assets...'
  sed -i 's!#export SERVE_ASSETS!export SERVE_ASSETS!' example.env

  cp -dpr --no-preserve=ownership example.env .env
}

build() {
  cd ${pkgname%-git}

  msg 'Installing NPM dependencies...'
  npm install -d

  msg 'Building static pages...'
  TARGET=static npm run build-static
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/license/bitrated/LICENSE

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/bitrated/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/bitrated
  for _appdir in bin client lib node_modules pages public server static views; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/bitrated/$_appdir
  done

  msg 'Installing appfiles...'
  for _appfile in .env example.env Procfile package.json; do
    cp -dpr --no-preserve=ownership $_appfile $pkgdir/usr/share/bitrated/$_appfile
  done

  msg 'Installing bitrated.service...'
  install -Dm 644 $srcdir/bitrated.service $pkgdir/usr/lib/systemd/system/bitrated.service

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
