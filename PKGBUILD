# Creator: piernov <piernov@piernov.org>
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=git-gl
_pkgname=git
pkgver=2.56.1.r591.ge1ec09b23c
pkgrel=1
pkgdesc="GitLab's version of Git"
arch=('x86_64')
url='https://gitlab.com/gitlab-org/git'
license=('GPL-2.0-only')
depends=('curl' 'expat' 'perl' 'perl-error' 'perl-mailtools'
         'openssl' 'pcre2' 'grep' 'shadow' 'zlib')
makedepends=('python' 'xmlto' 'asciidoc')
checkdepends=('openssh')
optdepends=('tk: gitk and git gui'
            'openssh: ssh transport and crypto'
            'perl-libwww: git svn'
            'perl-term-readkey: git svn and interactive.singlekey setting'
            'perl-io-socket-ssl: git send-email TLS support'
            'perl-authen-sasl: git send-email TLS support'
            'perl-mediawiki-api: git mediawiki support'
            'perl-datetime-format-iso8601: git mediawiki support'
            'perl-lwp-protocol-https: git mediawiki https support'
            'perl-cgi: gitweb (web interface) support'
            'python: git svn & git p4'
            'subversion: git svn'
            'org.freedesktop.secrets: keyring credential helper'
            'libsecret: libsecret credential helper')
provides=(git)
conflicts=(git)
install=git.install
source=("git+https://gitlab.com/gitlab-org/${_pkgname}.git"
        'git-daemon@.service'
        'git-daemon.socket'
        'git-sysusers.conf')
b2sums=('SKIP'
  '7630e8245526ad80f703fac9900a1328588c503ce32b37b9f8811674fcda4a45')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  # arch-meson -Dperl_cpan_fallback=false -Ddefault_pager=bat -Ddefault_editor=nvim -Dperl=enabled -Dpcre2=enabled -Dpython=enabled -Dgettext=disabled -Dbreaking_changes=true -Dgitk=disabled -Dgit_gui=disabled -Diconv=disabled -Ddocs_backend=asciidoctor -Ddocs=man build // this is my config, feel free to use it if you want!
  arch-meson build
  meson compile -C "build"
}

check() {
  cd "$_pkgname"
  SHELL=/bin/sh meson test -C "build"
}

package() {
  cd "$_pkgname"

  meson install -C "build" --destdir "$pkgdir"
  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m 0644 ./contrib/completion/git-completion.bash "$pkgdir"/usr/share/bash-completion/completions/git
  # fancy git prompt
  mkdir -p "$pkgdir"/usr/share/git/
  install -m 0644 ./contrib/completion/git-prompt.sh "$pkgdir"/usr/share/git/git-prompt.sh
  # the rest of the contrib stuff
  find contrib/ -name '.gitignore' -delete
  cp -a ./contrib/* "$pkgdir"/usr/share/git/

  install -Dm644 "$srcdir"/git-daemon@.service "$pkgdir"/usr/lib/systemd/system/git-daemon@.service
  install -Dm644 "$srcdir"/git-daemon.socket "$pkgdir"/usr/lib/systemd/system/git-daemon.socket
  install -Dm644 "$srcdir"/git-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/git.conf
}
