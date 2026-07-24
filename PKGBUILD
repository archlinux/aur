# Maintainer: theesfeld
# f00tils — pure assembly coreutils replacement (binary package)
pkgname=f00
pkgver=0.15.1
pkgrel=1
pkgdesc="f00tils — pure assembly coreutils replacement (multicall, freestanding)"
arch=('x86_64')
url="https://f00.sh"
license=('MIT')
depends=()
provides=('f00')
conflicts=('f00')
options=('!strip')
source=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-0.15.1-linux-x86_64.tar.gz")
sha256sums=('94f38b9467a83d925127e071fe618125c00e590a8df181dfc805425ae47f698e')

package() {
  local root
  root="${srcdir}/f00-${pkgver}-linux-x86_64"
  if [[ ! -d "${root}" ]]; then
    root="${srcdir}/f00-${pkgver}-x86_64-linux"
  fi
  if [[ ! -d "${root}" ]]; then
    # tarball may extract a single top dir — find the binary
    root="$(dirname "$(find "${srcdir}" -type f -name f00 | head -n1)")"
  fi
  install -Dm755 "${root}/f00" "${pkgdir}/usr/bin/f00"
  local u
  for u in ls cat true false yes nproc tty whoami basename dirname \
           head tail wc tee seq echo pwd sleep \
           env printenv realpath readlink pathchk mktemp link unlink sync truncate \
           mkdir rmdir chmod touch logname hostid \
           cut tr sort uniq rev tac nl fold expand unexpand paste join comm fmt od \
           split csplit shuf tsort pr ptx factor numfmt expr \
           cp mv rm ln chown chgrp stat df du install mkfifo mknod shred dd dir vdir \
           id groups uname arch date users who pinky uptime hostname \
           nice nohup timeout kill test printf \
           md5sum sha1sum sha256sum sha224sum sha384sum sha512sum b2sum cksum sum \
           base64 basenc base32 dircolors chroot stty stdbuf runcon chcon; do
    ln -s f00 "${pkgdir}/usr/bin/f00-${u}"
  done
  if [[ -f "${root}/LICENSE" ]]; then
    install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
  if [[ -d "${root}/man/man1" ]]; then
    install -Dm644 "${root}/man/man1/"*.1 -t "${pkgdir}/usr/share/man/man1/"
  fi
}
