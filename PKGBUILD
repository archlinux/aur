# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Matthew T Hoare <matthew dot t dot hoare at gmail dot com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Daniel Hommel <dhommel@gmail.com>

pkgname='mksh-git'
pkgver=59.c.r4059.af3021fe
pkgrel=1
pkgdesc='The MirBSD Korn Shell - an enhanced version of the public domain ksh'
arch=('i686' 'x86_64')
url='https://www.mirbsd.org/mksh.htm'
license=('MirOS')
depends=('glibc') # Make namcap happy.
makedepends=('git')
provides=("mksh=${pkgver%%.r*}")
conflicts=('mksh' 'mksh-static' 'mksh-static-git')
install='mksh.install'
_srcdir=mksh
source=('mksh::git+http://github.com/MirBSD/mksh#branch=master'
        'http://www.mirbsd.org/TaC-mksh.txt')
md5sums=('SKIP'
         '979d7a8996302276c2f68eac95fbc56a')
sha256sums=('SKIP'
            '71952bd3572dd9f0df3bc29e72b601178871756c18908e67e856fa5c7e30d58f')

pkgver() {
  cd "${_srcdir}"
  local _v
  _v="$(git show-ref --tags | grep -Eoe 'mksh-R.*$' | tail -1)"
  _v="${_v#mksh-R}"
  if [[ "${_v}" =~ ^([0-9]+)([a-z])$ ]]; then
    _v="${BASH_REMATCH[1]}.${BASH_REMATCH[2]}" # Dotted so that 59.a > 59 https://aur.archlinux.org/packages/mksh#comment-987460
  fi
  printf '%s.r%s.%s' "${_v}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_srcdir}"
  sh 'Build.sh' -r
}

check() {
  cd "${_srcdir}"
  ./test.sh
}

package() {
  cd "${_srcdir}"
  install -D -m755 'mksh' "${pkgdir}/usr/bin/mksh"
  install -D -m644 'mksh.1' "${pkgdir}/usr/share/man/man1/mksh.1"
  install -D -m644 'dot.mkshrc' "${pkgdir}/etc/skel/.mkshrc"
  install -D -m644 "${srcdir}/TaC-mksh.txt" "${pkgdir}/usr/share/licenses/mksh-git/TaC-mksh.txt"
}

# vim:set ts=2 sw=2 et:
