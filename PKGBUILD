# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>
# Github Contributor: ahmubashir <https://github.com/amubashir>
# Github Contributor: Joey Dumont <https://github.com/joeydumont>

pkgname=heroku-cli
pkgver=7.60.1
pkgrel=2
_commit_id="4e998800e9bde9b30d97e465f1e2c066c5734ff5"
pkgdesc="CLI to manage Heroku apps and services with forced auto-update removed"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
makedepends=('yarn' 'perl' 'git' 'npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli-bin' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("git+https://github.com/heroku/cli.git#commit=${_commit_id}")
sha256sums=('SKIP')
sha512sums=('SKIP')
options=('!strip')
provides=('heroku' 'heroku-cli')

_append_path() {
  case ":$PATH:" in
    *:"$1":*) ;;

    *)
      PATH="${PATH:+$PATH:}$1"
      ;;
  esac
}

prepare() {
  # Set path to perl scriptdirs if they exist
  # https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_scripts
  # Added /usr/bin/*_perl dirs for scripts
  [ -d /usr/bin/site_perl ] && _append_path '/usr/bin/site_perl'
  [ -d /usr/bin/vendor_perl ] && _append_path '/usr/bin/vendor_perl'
  [ -d /usr/bin/core_perl ] && _append_path '/usr/bin/core_perl'

  export PATH

  pushd "$srcdir"

    pushd "cli"

      # install packaging tools, must be done with yarn
      yarn install

      pushd packages/cli

        # remove forced auto-update plugin
        sed -i "/oclif\/plugin-update/d" ./package.json

        # install dependencies, must be done with yarn as of 7.60
        yarn install

        # remove dist folder if necessary
        if [[ -d "./dist" ]]; then
          rm -r ./dist
        fi

        npx oclif-dev pack --targets="linux-x64"

        pushd dist/heroku-v$pkgver/

          # move package source to src root
          mv -f ./heroku-v$pkgver-linux-x64.tar.xz "$srcdir"/

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

  cp -a "$srcdir/heroku" "$pkgdir/usr/lib"

  # completions
  local autocompletedir="$srcdir/heroku/node_modules/@heroku-cli/plugin-autocomplete/autocomplete"
  install -Dm644 "$autocompletedir/bash/heroku.bash" "$pkgdir/usr/share/bash-completion/completions/heroku"
  install -Dm644 "$autocompletedir/zsh/_heroku" "$pkgdir/usr/share/zsh/site-functions/_heroku"

  ln -sf "../../../lib/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"

  # Remove empty directories
  find "${pkgdir}" -type d -empty -delete
}
