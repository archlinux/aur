pkgdesc="(Dangerous) Swap system coreutils with uutils (more than PATH)"
pkgname=coreutils-uutils-symlink
pkgver=0.1.0
pkgrel=12
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils{,-stty}=$pkgver)
makedepends=(grep)
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils{,-uutils} b3sum)
package() {
  # Build fails by cp -s if uu-coreutils was renamed or removed
  uu-install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$');do
    uu-cp -s /usr/bin/uu-coreutils "$pkgdir"/usr/bin/"$f"
    uu-ln -s /usr/share/man/man1/uu-"$f".1.gz "$pkgdir"/usr/share/man/man1/"$f".1.gz
    uu-echo -e "#compdef ${f}=uu-${f}\n_${f}" > "$pkgdir"/usr/share/zsh/site-functions/_$f
    # This feature will be removed
    uu-coreutils completion $f fish > "$pkgdir"/usr/share/fish/vendor_completions.d/${f}.fish
  done
  uu-ln -s /usr/bin/uu-stty "$pkgdir"/usr/bin/stty
}
