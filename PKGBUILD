# Maintainer:
# Contributor: Alexander Görtz <aur@nyloc.de>

## options
: ${_nodeversion:=20}

# basic info
_pkgname="quassel-webserver"
pkgname="$_pkgname-git"
pkgver=2.2.8.r37.g019bfdc
pkgrel=1
pkgdesc="A web client for Quassel (requires a running quasselcore)"
url="https://github.com/magne4000/quassel-webserver"
license=('MIT')
arch=('any')

makedepends=(
  'git'
  'nvm' # AUR
)

options=('!strip')
install="$_pkgname.install"
backup=("usr/share/webapps/$_pkgname/settings-user.cjs")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/magne4000/quassel-webserver.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_nvm_env() {
  export HOME="$SRCDEST/node-home"
  export NVM_DIR="$SRCDEST/node-nvm"

  # set up nvm
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install $_nodeversion
  nvm use $_nodeversion
}

build() {
  _nvm_env

  cd "$_pkgsrc"
  npm install --no-audit --no-fund --prefer-offline --production --omit=dev
}

package() {
  depends=(
    'coffee'
    'nodejs'
  )

  cd "$_pkgsrc"

  install -Dm644 "scripts/quassel-webserver.service" -t "$pkgdir/usr/lib/systemd/system/"

  mkdir -p "$pkgdir/usr/share/webapps/$_pkgname"
  for _directory in lib node_modules public routes ssl views; do
    cp --reflink=auto -dpr --no-preserve=ownership $_directory "$pkgdir/usr/share/webapps/$_pkgname/$_directory"
  done

  install -Dm644 app.js settings.cjs package.json snapcraft.yaml -t "$pkgdir/usr/share/webapps/$_pkgname/"
  install -Dm644 settings.cjs "$pkgdir/usr/share/webapps/$_pkgname/settings-user.cjs"

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/LICENSE"

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
