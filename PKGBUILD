# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
# Contributor: Chloe Colman <chloe.colman7@gmail.com>
# Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributors: https://github.com/SampsonCrowley/arch_packages/contributors.md

pkgname=heroku-cli
pkgver=11.14.0
pkgrel=1
pkgdesc="CLI to manage Heroku apps and services with forced auto-update removed"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('ISC')
depends=('nodejs>=22.23.2')
makedepends=('git' 'npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli-bin' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("git+https://github.com/heroku/cli.git#commit=v${pkgver}")
sha256sums=('1a3e93ac59b56d38cc2a9400e51401cc12bebcca43c051eae14cfb8b1ac15d98')
sha512sums=('ee6ee4bf6e02a5240530d95f45f46e9cffc64316585fcbcd12b35dec79fdd8d0a8d2ca13ce24d370151d032c27909d4dabbad34f8dbf8946f20471dbf7a578cc')
options=('!strip')
provides=('heroku' 'heroku-cli')

prepare() {
  pushd "$srcdir"

    pushd "cli"
      # remove forced auto-update plugin
      sed -i "/oclif\/plugin-update/d" ./package.json

      # install dependencies, must be done with npm again as of 11.0
      npm install

      # create base package
      npm run build
      npm prune --production
    popd
}

package() {
  local _installdir="$pkgdir/usr/lib/heroku"
  install -dm755 "$_installdir"
  install -dm755 "$pkgdir/usr/bin"

  pushd "$srcdir/cli"
    cp -r package.json oclif.manifest.json node_modules bin dist "$_installdir/"
  popd

  # completions
  local autocompletedir="$srcdir/cli/autocomplete-scripts"
  install -Dm644 "$autocompletedir/bash/heroku.bash" "$pkgdir/usr/share/bash-completion/completions/heroku"
  install -Dm644 "$autocompletedir/zsh/_heroku" "$pkgdir/usr/share/zsh/site-functions/_heroku"

  ln -sf "../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"

  # Remove empty directories
  find "${pkgdir}" -type d -empty -delete
}
