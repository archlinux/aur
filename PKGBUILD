pkgdesc="(Dangerous) Swap system coreutils with uutils (more than PATH)"
pkgname=coreutils-uutils-symlink
pkgver=0.1.0
pkgrel=16
arch=('any')
url='https://uutils.github.io/'
license=('MIT')
depends=(uutils-coreutils{,-stty}=$pkgver) # protect user by renaming of uu-coreutils
makedepends=(grep)
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils{,-uutils} b3sum)
package() {
  # fail if uu-coreutils was renamed at uutils-coreutils
  /usr/bin/uu-coreutils install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  ln -sf /usr/bin/uu-stty bin/stty # override if not missing
  cp -sf /usr/bin/uu-coreutils bin/\[ # avoid completion bug
  # Symlink runcon and chcon for selinux build
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname|\[)$') runcon chcon;do
    ln -sf /usr/bin/uu-coreutils bin/"$f"
    ln -sf /usr/share/man/man1/uu-"$f".1.gz share/man/man1/"$f".1.gz
    echo -e "#compdef ${f}=uu-${f}\n_uu-${f}" > share/zsh/site-functions/_$f
    echo "complete -c ${f} -w uu-${f}" > share/fish/vendor_completions.d/${f}.fish
  done

}
