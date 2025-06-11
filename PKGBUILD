pkgdesc="(Dangerous) Swap system coreutils with uutils (more than PATH)"
pkgname=coreutils-uutils-symlink
pkgver=0.1.0
pkgrel=13
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils{,-stty}=$pkgver) # protect user by renaming of uu-coreutils
makedepends=(grep)
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils{,-uutils} b3sum)
package() {
  uu-install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  # Build fails by cp -s if uu-coreutils was renamed
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname)$');do
    uu-cp -s /usr/bin/uu-coreutils bin/"$f"
    uu-ln -s /usr/share/man/man1/uu-"$f".1.gz share/man/man1/"$f".1.gz
    uu-echo -e "#compdef ${f}=uu-${f}\n_${f}" > share/zsh/site-functions/_$f
    uu-echo "complete -c ${f} -w uu-${f}" > share/fish/vendor_completions.d/${f}.fish
  done
  uu-ln -s /usr/bin/uu-stty bin/stty
}
