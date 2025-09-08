# Maintainer: sga013
pkgname=uutils-coreutils-symlinks
pkgver=1
pkgrel=1
pkgdesc="WARNING - CONFLICTS WITH COREUTILS ; USE AT YOUR OWN RISK. Symlinks uutils to appropriate binaries, alongside with man pages, and shell completions"
url='https://uutils.github.io/'
depends=(uutils-coreutils)
makedepends=(grep)
license=('MIT')
arch=('any')
conflicts=(coreutils b3sum sha3sum)
provides=(coreutils{,-uutils} b3sum)
package() {
  # fail if uu-coreutils was renamed at uutils-coreutils
  /usr/bin/uu-coreutils install -d "$pkgdir"/usr/{bin,share/{man/man1,zsh/site-functions,fish/vendor_completions.d}}
  cd "$pkgdir"/usr
  # uutils does provide kill, more and uptime, where as i see, more and uptime are functionally same, where as kill lacks some flags, but we still can not link, because more is also provided by util-linux (alongside kill), and uptime is provided by procps-ng, so if i symlink them, pacman would error out with file conflict
  # apparently, runcon and chcon are things which are not provide d by uu-coreutils, and are required in selinux environments. gnu coreutils provides these, but they do not work in non selinux environments. as i see, if we do not link them, there would be errors, but even if i link them, they would still error out i suppose, so might as well not give and make it tad bit more simpler
  for i in $(uu-coreutils --list | grep -v -E '^(kill|more|uptime)$') ; do
    ln -sf /usr/bin/uu-coreutils bin/"$i"
    ln -sf /usr/share/man/man1/uu-"$i".1.gz share/man/man1/"$i".1.gz
    echo -e "#compdef ${i}=uu-${i}\n_uu-${i}" > share/zsh/site-functions/_$i
    echo "complete -c ${i} -w uu-${i}" > share/fish/vendor_completions.d/${i}.fish
  done
}
