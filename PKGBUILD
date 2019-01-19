# Maintainer: Guillaume Raffin <theelectronwill@gmail.com>

pkgname=bloop
pkgver=1.2.3
pkgrel=2
pkgdesc="Scala build server and command-line tool for fast developer workflows"
arch=(any)
url="https://scalacenter.github.io/bloop/"
license=('Apache')
depends=('scala' 'python')

source=("https://github.com/scalacenter/bloop/releases/download/v$pkgver/install.py")
md5sums=('784a5b8cbfdb8df1cee1b7e7b3f28a41')

build() {
  # prepare bloop in local directory
  python ./install.py --dest "$srcdir/bloop"

  # fix paths
  sed -i "s|$srcdir/bloop|/usr/lib/bloop|g" "bloop/systemd/bloop.service"
  sed -i "s|$srcdir/bloop|/usr/lib/bloop|g" "bloop/xdg/bloop.desktop"
}

package() {
  # move bloop files to installation dir
  mkdir -p "$pkgdir"/usr/lib/bloop
  mv "$srcdir/bloop" "$pkgdir"/usr/lib/

  # link binaries
  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/bloop/blp-server   "$pkgdir"/usr/bin/blp-server
  ln -s /usr/lib/bloop/blp-coursier "$pkgdir"/usr/bin/blp-coursier
  ln -s /usr/lib/bloop/bloop        "$pkgdir"/usr/bin/bloop

  # link desktop file
  mkdir -p "$pkgdir"/usr/share/applications
  ln -s /usr/lib/bloop/xdg/bloop.desktop "$pkgdir"/usr/share/applications/bloop.desktop

  # install shell completion
  mkdir -p "$pkgdir"/usr/share/zsh/site-functions
  mv "$pkgdir"/usr/lib/bloop/zsh/_bloop "$pkgdir"/usr/share/zsh/site-functions/
  mkdir -p "$pkgdir"/usr/share/fish/vendor_completions.d/
  mv "$pkgdir"/usr/lib/bloop/fish/bloop.fish "$pkgdir"/usr/share/fish/vendor_completions.d/
  mkdir -p "$pkgdir"/etc/bash_completion.d
  mv "$pkgdir"/usr/lib/bloop/bash/bloop "$pkgdir"/etc/bash_completion.d/

  # install systemd service
  mkdir -p "$pkgdir"/usr/lib/systemd/user
  mv "$pkgdir"/usr/lib/bloop/systemd/bloop.service "$pkgdir"/usr/lib/systemd/user/

  # cleanup bloop directory
  rmdir "$pkgdir"/usr/lib/bloop/zsh "$pkgdir"/usr/lib/bloop/bash "$pkgdir"/usr/lib/bloop/fish "$pkgdir"/usr/lib/bloop/systemd
}
