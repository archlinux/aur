# Maintainer: Guillaume Raffin <theelectronwill@gmail.com>
# Generator: Bloop release utilities <https://github.com/scalacenter/bloop>
pkgname=bloop
pkgver=1.4.8
pkgrel=1
pkgdesc="Bloop gives you fast edit/compile/test workflows for Scala."
arch=(any)
url="https://scalacenter.github.io/bloop/"
license=('Apache')
depends=('java-environment>=8' 'coursier>=2.0.0_RC6_13')
source=('bloop-coursier-channel-1.4.8::https://github.com/scalacenter/bloop/releases/download/v1.4.8/bloop-coursier.json' 'bloop-bash-1.4.8::https://github.com/scalacenter/bloop/releases/download/v1.4.8/bash-completions' 'bloop-zsh-1.4.8::https://github.com/scalacenter/bloop/releases/download/v1.4.8/zsh-completions' 'bloop-fish-1.4.8::https://github.com/scalacenter/bloop/releases/download/v1.4.8/fish-completions')
sha256sums=('e0f43c1296b50261d03723149d2c0818043869156acb822ab9e42e94d82bcdc1'
            'da6b7ecd4109bd0ff98b1c452d9dd9d26eee0d28ff604f6c83fb8d3236a6bdd1'
            '58d32c3f005f7791237916d1b5cd3a942115236155a0b7eba8bf36391d06eff7'
            'a012a5cc76b57dbce17fad237f3b97bea6946ffc6ea0b61ac2281141038248dd')

build() {
  mkdir -p channel
  mv "bloop-coursier-channel-1.4.8" "channel/bloop.json"
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
  install -Dm644 bloop-bash-1.4.8 "$pkgdir"/etc/bash_completion.d/bloop
  install -Dm644 bloop-zsh-1.4.8 "$pkgdir"/usr/share/zsh/site-functions/_bloop
  install -Dm644 bloop-fish-1.4.8 "$pkgdir"/usr/share/fish/vendor_completions.d/bloop.fish
}
