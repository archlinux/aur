# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.47.11
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="CLI to manage Heroku apps and services with forced auto-update removed"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
makedepends=('npm' 'perl')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli-bin' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/heroku/cli/archive/v$pkgver.tar.gz")
sha256sums=('68f5e836226eea35d1ead357da761955679793e666bd600511ca8027b05de95e')
sha512sums=('8867f931046f7a0fdc2d62feea2b368bb578ad9860cc28a876e27ea17d3410a7bc55e657b1c9ba14309f60a0c5fda46b2b49524f04dac3907e0144f6f253f0a4')
options=('!strip')
provides=('heroku' 'heroku-cli')

append_path() {
  case ":$PATH:" in
      *:"$1":*)
          ;;
      *)
          PATH="${PATH:+$PATH:}$1"
  esac
}

prepare() {
  # Set path to perl scriptdirs if they exist
  # https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_scripts
  # Added /usr/bin/*_perl dirs for scripts
  [ -d /usr/bin/site_perl ] && append_path '/usr/bin/site_perl'
  [ -d /usr/bin/vendor_perl ] && append_path '/usr/bin/vendor_perl'
  [ -d /usr/bin/core_perl ] && append_path '/usr/bin/core_perl'

  export PATH

  pushd "$srcdir"

    pushd "cli-$pkgver"

      # install packaging tools; install fails now unless installed with yarn >:(
      hasYarn="$(which yarn 2> /dev/null)"

      if [ -z "$hasYarn" ]; then
        npm install -g yarn
      fi

      yarn install

      pushd packages/cli

        # remove forced auto-update plugin
        sed -i "/oclif\/plugin-update/d" ./package.json

        # install dependencies
        npm install

        # remove dist folder if necessary
        if [[ -d "./dist" ]]; then
          rm -r ./dist
        fi

        npx oclif-dev pack --targets="linux-x64"

        pushd dist/heroku-v$pkgver/

          # move package source to src root
          mv -f ./heroku-v$pkgver-linux-x64.tar.xz $srcdir/

        popd

      popd

    popd

    # extract oclif package
    tar -xvf "heroku-v$pkgver-linux-x64.tar.xz" -C "$srcdir/"

    # unneeded compilation files
    for file in *; do
      if [[ "$file" = "heroku" ]]; then
        continue
      else
        rm -rf "$file"
      fi
    done

    # remove packaged node binary and fall back to whatever node is on the PATH
    rm -f ./heroku/bin/heroku
    rm -f ./heroku/bin/heroku.cmd
    rm -f ./heroku/bin/node

  popd
}


package() {
  install -dm755 "$pkgdir/usr/lib/heroku"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  herokulibdir="$pkgdir/usr/lib"
  for foundherokudir in $(find "$srcdir/heroku" -mindepth 1 -type d) ; do
    herokuinstalldir="${foundherokudir/$srcdir/$herokulibdir}"
    install -dm755 "$herokuinstalldir"
  done

  for foundherokufile in $(find "$srcdir/heroku" -mindepth 1 -type f) ; do
    herokuinstallperm=$(stat -c "%a" "$foundherokufile")
    herokuinstallfile="${foundherokufile/$srcdir/$herokulibdir}"
    install -Dm$herokuinstallperm "$foundherokufile" "$herokuinstallfile"
  done

  ln -sf "../../../lib/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "../../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"
}
