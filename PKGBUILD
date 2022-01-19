# Maintainer: George Shammas <george@shamm.as>
# Modified from offical upstream git packaged
# https://github.com/archlinux/svntogit-packages/tree/packages/git/trunk

pkgname=git-vfs
_pkgname=git
pkgver=2.34.1.vfs.0.0
_pkgver=${pkgver} # Sometimes needed when the tarball has a different name
pkgrel=2
pkgdesc='Microsoft fork of git including gvfs and scalar'
arch=('x86_64')
provides=('git')
conflicts=('git')
url='https://git-scm.com/'
license=('GPL2')
depends=('curl' 'expat' 'perl' 'perl-error' 'perl-mailtools'
         'openssl' 'pcre2' 'grep' 'shadow' 'zlib')
makedepends=('python' 'libgnome-keyring' 'xmlto' 'asciidoc')
optdepends=('tk: gitk and git gui'
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
install=git.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/git/archive/refs/tags/v${pkgver}.tar.gz"
        'git-daemon@.service'
        'git-daemon.socket'
        'git-sysusers.conf')
sha256sums=('0eda7f4ad8060381135f5237dab5e713b9e61590989f247618177634f03e6517'
            '14c0b67cfe116b430645c19d8c4759419657e6809dfa28f438c33a005245ad91'
            'ac4c90d62c44926e6d30d18d97767efc901076d4e0283ed812a349aece72f203'
            '7630e8245526ad80f703fac9900a1328588c503ce32b37b9f8811674fcda4a45')

_make_paths=(
  prefix='/usr'
  gitexecdir='/usr/lib/git-core'
  perllibdir="$(/usr/bin/perl -MConfig -wle 'print $Config{installvendorlib}')"
)

_make_options=(
  CFLAGS="$CFLAGS"
  LDFLAGS="$LDFLAGS"
  INSTALL_SYMLINKS=1
  MAN_BOLD_LITERAL=1
  NO_PERL_CPAN_FALLBACKS=1
  USE_LIBPCRE2=1
)

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    all man

  make -C contrib/scalar
  make -C contrib/credential/gnome-keyring
  make -C contrib/credential/libsecret
  make -C contrib/subtree "${_make_paths[@]}" all man
  make -C contrib/mw-to-git "${_make_paths[@]}" all
  make -C contrib/diff-highlight "${_make_paths[@]}"
}

check() {
  cd "$srcdir/$_pkgname-$_pkgver"

  local jobs
  jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
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
  cd "$srcdir/$_pkgname-$_pkgver"
  
  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    DESTDIR="$pkgdir" \
    install install-man

  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m 0644 ./contrib/completion/git-completion.bash "$pkgdir"/usr/share/bash-completion/completions/git
  # fancy git prompt
  mkdir -p "$pkgdir"/usr/share/git/
  install -m 0644 ./contrib/completion/git-prompt.sh "$pkgdir"/usr/share/git/git-prompt.sh

  install -m 0755 contrib/scalar/scalar "$pkgdir"/usr/bin/scalar
  make -C contrib/scalar clean
  # gnome credentials helper (deprecated, but we will keep it as long there is no extra cost)
  # https://gitlab.gnome.org/GNOME/libgnome-keyring/commit/6a5adea4aec93
  install -m 0755 contrib/credential/gnome-keyring/git-credential-gnome-keyring \
      "$pkgdir"/usr/lib/git-core/git-credential-gnome-keyring
  make -C contrib/credential/gnome-keyring clean
  # libsecret credentials helper
  install -m 0755 contrib/credential/libsecret/git-credential-libsecret \
      "$pkgdir"/usr/lib/git-core/git-credential-libsecret
  make -C contrib/credential/libsecret clean
  # subtree installation
  make -C contrib/subtree "${_make_paths[@]}" DESTDIR="$pkgdir" install install-man
  # mediawiki installation
  make -C contrib/mw-to-git "${_make_paths[@]}" DESTDIR="$pkgdir" install
  # the rest of the contrib stuff
  find contrib/ -name '.gitignore' -delete
  cp -a ./contrib/* "$pkgdir"/usr/share/git/

  # git-daemon via systemd socket activation
  install -D -m 0644 "$srcdir"/git-daemon@.service "$pkgdir"/usr/lib/systemd/system/git-daemon@.service
  install -D -m 0644 "$srcdir"/git-daemon.socket "$pkgdir"/usr/lib/systemd/system/git-daemon.socket

  # sysusers file
  install -D -m 0644 "$srcdir"/git-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/git.conf
}
