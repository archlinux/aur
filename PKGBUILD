# Maintainer: theesfeld
# f00tils — freestanding ASM multicall (coreutils+grep+findutils+diffutils)
#
# If upgrade fails with "exists in filesystem" on f00-grep / /usr/lib/f00/bin/*:
#   sudo scripts/arch-clean-unowned-f00.sh
#   # or: pacman -S f00 --overwrite '/*'
# Those orphans come from pre-0.16.10 packages (coreutils-only links) mixed with
# a root install.sh into /usr. Never mix install.sh → /usr with the AUR package.
pkgname=f00
pkgver=0.16.10
pkgrel=1
pkgdesc="f00tils — freestanding ASM multicall (coreutils+grep+findutils+diffutils)"
arch=('x86_64')
url="https://f00.sh"
license=('MIT')
depends=()
options=('!strip')
source=("https://github.com/theesfeld/f00/releases/download/v${pkgver}/f00-0.16.10-linux-x86_64.tar.gz")
sha256sums=('c34866ac7dd1de7e79e661fb9dc038ef31dbbbaec210ccea8e15e6263109b8b9')

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
  # shell integration: bare names in /usr/lib/f00/bin, PATH via profile.d (default ON)
  mkdir -p "${pkgdir}/usr/lib/f00/bin"
  # profile snippets ship from release packaging tree when present; embed fallbacks
  if [[ -f "${root}/share/f00/f00.sh" ]]; then
    install -Dm644 "${root}/share/f00/f00.sh" "${pkgdir}/etc/profile.d/f00.sh"
  else
    install -Dm644 /dev/stdin "${pkgdir}/etc/profile.d/f00.sh" <<'EOS'
# f00tils — default coreutils replacement via PATH (see f00-config replace)
_f00_libbin="/usr/lib/f00/bin"
_f00_replace_enabled() {
  local cfg="${XDG_CONFIG_HOME:-${HOME}/.config}/f00/config"
  [ -n "${HOME:-}" ] || return 0
  [ -f "$cfg" ] || return 0
  if grep -Eiq '^[[:space:]]*replace[[:space:]]*=[[:space:]]*(false|no|0|none)([[:space:]]|#|$)' "$cfg" 2>/dev/null; then
    return 1
  fi
  return 0
}
if [ -d "$_f00_libbin" ] && _f00_replace_enabled; then
  case ":${PATH:-}:" in
    *":${_f00_libbin}:"*) ;;
    *) PATH="${_f00_libbin}${PATH:+:}${PATH:-}"; export PATH ;;
  esac
fi
unset _f00_libbin
unset -f _f00_replace_enabled 2>/dev/null || true
EOS
  fi
  # Full multicall surface: coreutils + grep + findutils + diffutils (+ hub)
  # Keep in sync with scripts/tools-all.txt and asm/Makefile UTILS.
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
           base64 basenc base32 dircolors chroot stty stdbuf runcon chcon config \
           grep egrep fgrep find xargs diff cmp diff3 sdiff; do
    ln -s f00 "${pkgdir}/usr/bin/f00-${u}"
    ln -s ../../../bin/f00 "${pkgdir}/usr/lib/f00/bin/${u}"
  done
  ln -s f00 "${pkgdir}/usr/bin/f00-["
  ln -s ../../../bin/f00 "${pkgdir}/usr/lib/f00/bin/["
  if [[ -f "${root}/LICENSE" ]]; then
    install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
  if [[ -d "${root}/man/man1" ]]; then
    install -Dm644 "${root}/man/man1/"*.1 -t "${pkgdir}/usr/share/man/man1/"
  fi
}
