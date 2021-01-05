# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.47.7
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="CLI to manage Heroku apps and services with forced auto-update removed"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
# the heroku-cli upstream maintainers live in their own little bubble, so this
# package now requires both npm and yarn to actually complete the build process.
#
# If you need to stick to `npm` the `heroku-cli-bin` works with either/both
# `npm` and `yarn`, and the package is built through the exact same process,
# with the exception that it's pre-compiled using my machine before I release
# it (hence the `-bin` suffix)
#
# I have tried every option I can think of to get it to build correctly with
# pure `npm`; if you have a suggestion I'm all ears
makedepends=('npm' 'yarn' 'perl')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli-bin' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/heroku/cli/archive/v$pkgver.tar.gz")
sha256sums=('1d6dfe8c86d7c264b7eab607d77d62c3f29bed24c6b7b08808debed2d77d4bf1')
sha512sums=('7953df70a2327c675823de3605f8e95e9eb9fc4c7bdb4f01b295e402ea5f7ed5a4f816f1d0e5305f756159637bcba520a28899e3310b208d9283896bb0fb1eec')
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
      yarn

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
