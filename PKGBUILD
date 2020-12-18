# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.47.6
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
sha256sums=('7892f3670771b86be2520b7cc2f4bc6ed3b027a3e05f770e0916d5a1497894ab')
sha512sums=('81661b10491bf1571c1c1b6be973e9fbc45d91b7956cfe7ceadc27ad9d7a55c7bdc05ec97f4ec5cab0d9841108bcef4fb36b00c84d5a372a38f5f0a910f563a9')
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

      # install packaging tools
      npm install

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
