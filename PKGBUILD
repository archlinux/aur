# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>

_name=git
pkgname=$_name-git
pkgver=2.19.0.rc2.r0.gc05048d439
pkgrel=1
pkgdesc='A fast distributed version control system'
arch=('i686' 'x86_64')
url='http://git-scm.com/'
license=('GPL2')
depends=('curl' 'expat>=2.0' 'perl-error' 'perl>=5.14.0' 'openssl'
         'perl-mailtools' 'pcre2' 'grep' 'shadow')
makedepends=('python2' 'xmlto' 'asciidoc' 'libgnome-keyring' 'git')
optdepends=('tk: gitk and git gui'
            'perl-libwww: git svn'
            'perl-term-readkey: git svn'
            'perl-mime-tools: git send-email'
            'perl-net-smtp-ssl: git send-email TLS support'
            'perl-authen-sasl: git send-email TLS support'
            'perl-mediawiki-api: git mediawiki support'
            'perl-datetime-format-iso8601: git mediawiki support'
            'perl-lwp-protocol-https: git mediawiki https support'
            'perl-cgi: gitweb (web interface) support'
            'python2: various helper scripts'
            'subversion: git svn'
            'cvsps2: git cvsimport'
            'gnome-keyring: GNOME keyring credential helper'
            'libsecret: libsecret credential helper')
conflicts=('git')
provides=('git')
install=git-git.install
source=('git+https://github.com/git/git.git'
        'git-daemon@.service'
        'git-daemon.socket'
        'git.sysusers')
sha512sums=('SKIP'
            '1cfed9796391a5339db75e6a2ca4c83760da3445d52cc5b3dcf0ccf1fe33bddf7ab7e74f49011b9543bce330517200513bd442c59767e5de65d37bc9d4a686d0'
            'bd4aff421e547044a2a91b8a77c86ce14f05321008aa2e28aab35154b297803ca716ccba3e0fca3805033d4adb455adb41086ceeca98200b8006582c13f2c7d3'
            '17c6a884904d7336ea9975d28a15298fdc6d3ba8d00c3fc8a0f739b8e2e31e9fe4c558228f5a8509ec3c4481211e83575cf4b0d57dfc8f648c7c1b0729ee4bee')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


_make_paths=(
  prefix='/usr'
  gitexecdir='/usr/lib/git-core'
  perllibdir="$(/usr/bin/perl -MConfig -wle 'print $Config{installvendorlib}')"
)

_make_options=(
  CFLAGS="$CFLAGS"
  LDFLAGS="$LDFLAGS"
  USE_LIBPCRE2=1
  NO_CROSS_DIRECTORY_HARDLINKS=1
  NO_PERL_CPAN_FALLBACKS=1
  MAN_BOLD_LITERAL=1
)

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"


  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    all doc

  make -C contrib/credential/gnome-keyring
  make -C contrib/credential/libsecret
  make -C contrib/subtree "${_make_paths[@]}" all doc
  make -C contrib/mw-to-git "${_make_paths[@]}" all
  make -C contrib/diff-highlight "${_make_paths[@]}"
}

check() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"

  jobs="$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*')" || true
  mkdir -p /dev/shm/git-test

  # explicitly specify SHELL to avoid a test failure in t/t9903-bash-prompt.sh
  # which is caused by 'git rebase' trying to use builduser's SHELL inside the
  # build chroot (i.e.: /usr/bin/nologin)
  SHELL=/bin/sh \
  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    NO_SVN_TESTS=y \
    DEFAULT_TEST_TARGET=prove \
    GIT_PROVE_OPTS="$jobs -Q" \
    GIT_TEST_OPTS="--root=/dev/shm/git-test" \
    test
}

package() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"
  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    DESTDIR="$pkgdir" \
    install install-doc

  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m644 ./contrib/completion/git-completion.bash "$pkgdir"/usr/share/bash-completion/completions/git

  # fancy git prompt
  mkdir -p "$pkgdir"/usr/share/git/
  install -m644 ./contrib/completion/git-prompt.sh "$pkgdir"/usr/share/git/git-prompt.sh

  # gnome credentials helper
  install -m755 contrib/credential/gnome-keyring/git-credential-gnome-keyring \
      "$pkgdir"/usr/lib/git-core/git-credential-gnome-keyring
  make -C contrib/credential/gnome-keyring clean

  # libsecret credentials helper
  install -m755 contrib/credential/libsecret/git-credential-libsecret \
      "$pkgdir"/usr/lib/git-core/git-credential-libsecret
  make -C contrib/credential/libsecret clean

  # subtree installation
  make -C contrib/subtree "${_make_paths[@]}" DESTDIR="$pkgdir" install install-doc

  # mediawiki installation
  make -C contrib/mw-to-git "${_make_paths[@]}" DESTDIR="$pkgdir" install

  # the rest of the contrib stuff
  find contrib/ -name '.gitignore' -delete
  cp -a ./contrib/* "$pkgdir"/usr/share/git/

  # scripts are for python 2.x
  sed -i 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find "$pkgdir" -name '*.py') \
    "$pkgdir"/usr/share/git/remote-helpers/git-remote-bzr \
    "$pkgdir"/usr/share/git/remote-helpers/git-remote-hg
  sed -i 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
    "$pkgdir"/usr/share/git/svn-fe/svnrdump_sim.py

  # git-daemon via systemd socket activation
  install -D -m 644 "$srcdir"/git-daemon@.service "$pkgdir"/usr/lib/systemd/system/git-daemon@.service
  install -D -m 644 "$srcdir"/git-daemon.socket "$pkgdir"/usr/lib/systemd/system/git-daemon.socket

  # Add git-daemon sysuser
  install -D -m 644 "$srcdir"/git.sysusers "$pkgdir"/usr/lib/sysusers.d/git.conf
}
