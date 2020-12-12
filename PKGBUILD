# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Down <chris@chrisdown.name>
# Contributor: Dave Reisner <d@falconindy.com>

set -u
pkgname='pkgbuild-introspection'
pkgver='10'
pkgrel='1'
pkgdesc='generate .SRCINFO files (mksrcinfo)'
arch=('any')
#url='https://github.com/falconindy/pkgbuild-introspection'
url='https://www.archlinux.org/pacman/'
license=('GPL')
depends=('bash' 'pacman>=5.0.0')
options=('!strip')

# Note that we do not put the mksrcinfo header on, and we won't either!

package() {
  set -u
  install -Dm755 <(cat << EOF
#!/usr/bin/bash

set -e
set -u
umask 022

_help='pacman-mksrcinfo

mksrcinfo reads the target PKGBUILD and writes an equivalent .SRCINFO.
Without passing any arguments, mksrcinfo will read from \$PWD/PKGBUILD
and write to \$PWD/.SRCINFO.

Usage: mksrcinfo [/path/to/pkgbuild]
    -h                display this help message and exit
    -o <file>         write output to <file>
'

_opt_PKGBUILD='PKGBUILD'
_opt_o='.SRCINFO'

while getopts 'ho:' opt; do
  case "\${opt}" in
  'h') printf '%s' "\${_help}" ;;
  '?') printf '%s' "\${_help}" ;;
  'o') _opt_o="\${OPTARG}";;
  esac
done
unset opt OPTARG
shift "\$((OPTIND -1))"

if [ "\${#@}" -gt 1 ]; then
  printf '%s' "\${_help}"
  exit 1
elif [ "\${#@}" -eq 1 ]; then
  _opt_PKGBUILD="\$1"
fi

if [ ! -s "\${_opt_PKGBUILD}" ]; then
  printf '%s: Unable to find %s' "\${0##*/}" "\${_opt_PKGBUILD}"
elif [ ! -w . ]; then
  printf '%s: No write access to current folder' "\${0##*/}"
elif [ "\${EUID}" -eq 0 ]; then
  printf '%s: Cannot run as root' "\${0##*/}"
else
  (cd "\$(dirname "\${_opt_PKGBUILD}")"; makepkg -p "\${_opt_PKGBUILD##*/}" --printsrcinfo ) > "\${_opt_o}"
fi
EOF
  ) "${pkgdir}/usr/bin/mksrcinfo"
  set +u
}
set +u
