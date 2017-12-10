# Maintainer: Björn Wiedenmann <archlinux@xorxor.de>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Anders Bergh <anders1@gmail.com>
# Contributer: Chris <alostengineer at narmos dot org>

# Note: The bulk of this PKGBUILD is based off:
# https://aur.archlinux.org/packages/pam_ssh_agent_auth/

# IMPORTANT SECURITY NOTE:
# This PKGBUILD is packaging code whose status is rather unknown !
#
# Since I do NOT maintain this code in any way, but merely
# package it for Arch Linux, there is absolutely no warranty for
# this code. It is totally possible that I got the wrong code repo
# altogether and that it still contains open security bugs which
# have already been fixed elsewhere.
#
# A bit of background on why this PKGBUILD exists anyway:
#
# As of 2017-01-27, the latest pam_ssh_agent_auth in AUR
# (0.10.2-1 at https://aur.archlinux.org/packages/pam_ssh_agent_auth/)
# as well as the latest upstream release (0.10.3, at
# https://sourceforge.net/projects/pamsshagentauth/) both DO NOT support
# any ECC ssh user keys (neither ECDSA nor ED25519 keys).
# The issue is known on the official bugtracker
# (https://sourceforge.net/p/pamsshagentauth/feature-requests/10/)
# and quite a few people seem to look for this feature but the original
# maintainer does not seem to get around to implementing it because
# doing it cleanly requires a rebase to the current OpenSSH code base.
# And that costs the volunteers' scarcest resource :)
#
# However, digging a little deeper revealed this very promising discussion
# between the original maintainer and a helper who claims to have ECC
# support implemented:
# https://sourceforge.net/p/pamsshagentauth/discussion/903801/thread/784a4a5c/
# The link also mentions a Github repository which seems to be the
# maintainer's replacement for SoureForge. Inspection of the repo
# showed that some work did in fact go into ECC support as well as
# the incorporation of a pull request by the aforementioned helper.
# Unfortunately, it is also using another Github project as a submodule
# which introduces an additional dependency (one the original maintainer
# does not seem to be too fond of, judging by the commit message)
#
# Depending on your security sensitivity and awareness, those are a
# lot of "seems" for a PAM module :)
#
# To summerize, on the downside you have
#
# 1. A git repo which seems to be the next official development repo
#    but wasn't officially announced as such anywhere
# 2. Code in the master branch with an unknown status regarding
#    stability or feature completeness
# 3. No statement by the maintainer as to the future of the repo (or
#    what looks like the "replacement repo's replacement" on Github
#    "pam_ssh_agent_auth-2.0"
# 4. A hard dependency on another Git repo
#
# On the upside, the only thing this code has going for it is
#
# 1. ED22519 key support seems to work just fine (and ECDSA should be
#    there but I didn't test it)
#
# That last point is honestly the ONLY reason why you might want to
# prefer this PKGBUILD over the non-Git one in AUR or the officially
# released versions. If you are hard pressed to support ECC user keys
# in your SSH setup, give this a shot, but keep in mind, this PKGBUILD
# is even more experimental than usual for the background given above.
# I am providing all of this information here hoping to give you a
# better chance at taking an educated decision whether this PKGBUILD
# is right for you or not.
#
# Feel free to verify or add to this information (via the comment section),
# I will gladly incorporate it. I am planning to keep an eye on both the
# other AUR pam_ssh_agent_auth PKGBUILD as well as the upstream development.
# Maybe this PKGBUILD will be obsolete soon, there was some development
# activity in recent months.
#
# USE THIS PKGBUILD AT YOUR OWN RISK AND ONLY IF YOU FULLY
# UNDERSTAND THE SECURITY IMPLICATIONS OF NOT USING THE OFFICIALLY
# ANNOUNCED pam_ssh_agent_auth CODE BASE !
#
# Consider yourself warned.
#
# If security is paramount for you or in case of any doubt,
# please use the official pam_ssh_agent_auth code base instead.

pkgname=pam_ssh_agent_auth-git
pkgver=r22.f4b3932
pkgrel=3
pkgdesc="PAM module which permits authentication for arbitrary services via ssh-agent. (Git version including experimental ECC support)"
arch=('i686' 'x86_64' 'armv7h')
url="http://github.com/jbeverly/pam_ssh_agent_auth/"
license=('custom:OpenSSL')
depends=('openssl-1.0')
optdepends=('openssh: standard ssh-agent'
            'gnupg: gpg ssh-agent')
provides=('pam_ssh_agent_auth')
conflicts=('pam_ssh_agent_auth')
source=('git+https://github.com/jbeverly/pam_ssh_agent_auth')
md5sums=('SKIP')

install=$pkgname.install

pkgver() {
  cd "pam_ssh_agent_auth/"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  if ! [ -e openssl-1.0 ] ; then
    mkdir openssl-1.0
  fi

  if ! [ -e openssl-1.0/include ] ; then
    ln -s /usr/include/openssl-1.0 openssl-1.0/include
  fi

  if ! [ -e openssl-1.0/lib ] ; then
    ln -s /usr/lib/openssl-1.0 openssl-1.0/lib
  fi

  cd "pam_ssh_agent_auth/"
  git submodule init
  git submodule update
}
           
build() {
  cd "pam_ssh_agent_auth/"
  ./configure --prefix=/usr --with-mantype=man --libexecdir=/usr/lib/security --with-ssl-dir=../openssl-1.0
  make
}

package() {
  cd "pam_ssh_agent_auth/"
  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE.OpenSSL "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
