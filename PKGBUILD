# Maintainer: oech3
# Contributor: kj_sh604
pkgname=coreutils-uutils
pkgver=0.2.2
pkgrel=3
pkgdesc='(Experimental) Use uutils as system core utilities'
arch=('any')
license=('MIT')
url=https://github.com/uutils/coreutils
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils b3sum)
depends=(uutils-coreutils) #=$pkgver is safer

package() {
  install -d "$pkgdir"/usr/{bin,lib/coreutils,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  ln -sf /usr/lib/${depends[0]}/libstdbuf.so -t lib/coreutils
  ln -sf uu-coreutils bin/\[ # completion err
  # support also -selinux
  # fail if uu-coreutils is renamed at Extra/uutils-coreutils
  for f in $(uu-coreutils --list|grep -v -E '^(kill|more|uptime|hostname|\[)$') chcon runcon ; do
    ln -sf uu-coreutils bin/"$f"
    ln -sf uu-"$f".1.gz share/man/man1/"$f".1.gz
    # bash completes symlinks
    echo -e "#compdef ${f}=uu-${f}\n_uu-${f}" > share/zsh/site-functions/_$f
    echo "complete -c ${f} -w uu-${f}" > share/fish/vendor_completions.d/${f}.fish
  done
}
