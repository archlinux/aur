# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=gravit-git
pkgver=20150112
pkgrel=1
pkgdesc="Design tool made in the spirit of Freehand and Fireworks"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('git' 'nodejs-bower' 'nodejs-grunt-cli' 'npm' 'ruby-compass' 'ruby-sass')
url="https://github.com/Gravit-io/gravit"
license=('custom')
source=(git+https://github.com/Gravit-io/gravit
        gravit.service)
sha256sums=('SKIP'
            '4f4ed48f5ebf5f9dac947d199e5065ac99061b482aa9e64684499532222c4792')
provides=('gravit')
conflicts=('gravit')
options=('!strip')
install=gravit.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Removing unneeded Mac OS/X NPM modules...'
  sed -i '/.*appdmg.*/d' package.json
  sed -i 's@"time-grunt": "~0.1.1",@"time-grunt": "~0.1.1"@' package.json
}

build() {
  cd ${pkgname%-git}

  msg 'Fetching NPM dependencies...'
  npm install --python=python2

  msg 'Fetching Web assets...'
  bower install --allow-root --config.interactive=false
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/gravit/LICENSE"

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/gravit/README.md"

  msg 'Installing appdirs...'
  install -dm 700 "$pkgdir/usr/share/gravit"
  find . -mindepth 1 -maxdepth 1 -type d -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/gravit" \;

  msg 'Installing appfiles...'
  find . -mindepth 1 -maxdepth 1 -type f -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/gravit" \;

  msg 'Installing gravit.service'
  install -Dm 644 "$srcdir/gravit.service" "$pkgdir/usr/lib/systemd/system/gravit.service"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
