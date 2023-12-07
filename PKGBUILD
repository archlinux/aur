# Maintainer: Guillaume Raffin <theelectronwill@gmail.com>
# Maintainer: David Barri <japgolly@gmail.com>
pkgname=bloop
pkgver=1.5.13
pkgrel=1
pkgdesc="Bloop gives you fast edit/compile/test workflows for Scala."
arch=(any)
url="https://scalacenter.github.io/bloop/"
license=('Apache')
depends=('java-environment>=8' 'coursier>=2.0.16')
source=("bloop-coursier-channel-$pkgver::https://github.com/scalacenter/bloop/releases/download/v$pkgver/bloop-coursier.json"
        "bloop-bash-$pkgver::https://github.com/scalacenter/bloop/releases/download/v$pkgver/bash-completions"
        "bloop-zsh-$pkgver::https://github.com/scalacenter/bloop/releases/download/v$pkgver/zsh-completions"
        "bloop-fish-$pkgver::https://github.com/scalacenter/bloop/releases/download/v$pkgver/fish-completions")
sha256sums=('d4b9282aeb7a4b770486250cf4dd0c0e30d17a06b908554c81a5bd4a70a78506'
            'da6b7ecd4109bd0ff98b1c452d9dd9d26eee0d28ff604f6c83fb8d3236a6bdd1'
            '58d32c3f005f7791237916d1b5cd3a942115236155a0b7eba8bf36391d06eff7'
            '78511247a88f1d10d5886bfe164dec0af3e0540864d8bd60086e0b9df5cefefe')

build() {
  mkdir -p channel
  mv "bloop-coursier-channel-$pkgver" "channel/bloop.json"
  coursier install --install-dir "$srcdir" --default-channels=false --channel channel --only-prebuilt=true bloop
}

package() {
  cd "$srcdir"

  # patch the bloop launcher so that it works when symlinked from /usr/bin
  sed 's|$(dirname "$0")|/usr/lib/bloop|' -i bloop

  # install to /usr/lib/bloop
  # NOTE: bloop is just a launcher, the actual program is .bloop.aux
  install -Dm755 bloop "$pkgdir"/usr/lib/bloop/bloop
  install -Dm755 .bloop.aux "$pkgdir"/usr/lib/bloop/.bloop.aux

  # add link to /usr/bin
  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/bloop/bloop "$pkgdir"/usr/bin/bloop

  # shell completion
  install -Dm644 bloop-bash-$pkgver "$pkgdir"/etc/bash_completion.d/bloop
  install -Dm644 bloop-zsh-$pkgver "$pkgdir"/usr/share/zsh/site-functions/_bloop
  install -Dm644 bloop-fish-$pkgver "$pkgdir"/usr/share/fish/vendor_completions.d/bloop.fish
}
