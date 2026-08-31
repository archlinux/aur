# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>
# Contributor: Chloe Colman <chloe.colman7@gmail.com>
# Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributors: https://github.com/SampsonCrowley/arch_packages/contributors.md

pkgname=heroku-cli
pkgver=11.10.0
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
sha256sums=('5cc9f0ad0e4c4d65b71dd8f89275a32dccd657c01ec752e959b1bec67c560394')
sha512sums=('dd8e6254d8e95b6507b7bd8190420ba0da79e92b47a2d456ab4e946ea61208e7e461ec6e4dc2b45ba742d5defa00db0e3ec02a21a21e10b57a038ead5bf8670e')
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
