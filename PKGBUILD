# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>

_name=git
pkgname=$_name-git
pkgver=2.15.0.r0.gcb5918aa0d
pkgrel=1
pkgdesc='A fast distributed version control system'
arch=(i686 x86_64)
url='http://git-scm.com/'
license=(GPL2)
depends=(curl 'expat>=2.0' perl-error 'perl>=5.14.0' openssl pcre2)
makedepends=(python2 emacs libgnome-keyring xmlto asciidoc)
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
            'gnome-keyring: GNOME keyring credential helper')
conflicts=(git-core)
provides=(git-core git)
install=git-git.install
source=('git+https://github.com/git/git.git'
        git-daemon@.service
        git-daemon.socket)
sha512sums=('SKIP'
            'ad7f81859d5a3b9b93b48ab1fe317919940d666439e583984bf5287b6c62f570c192b990f4a004a5d0a2d983ed5e63aba2ccc95a42e05e1b93242fdbce2d07f5'
            'bd4aff421e547044a2a91b8a77c86ce14f05321008aa2e28aab35154b297803ca716ccba3e0fca3805033d4adb455adb41086ceeca98200b8006582c13f2c7d3')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE2=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    MAN_BOLD_LITERAL=1 \
    all doc

  make -C contrib/emacs prefix=/usr
  make -C contrib/credential/gnome-keyring
  make -C contrib/credential/libsecret
  make -C contrib/subtree prefix=/usr gitexecdir=/usr/lib/git-core all doc
  make -C contrib/mw-to-git prefix=/usr all
  make -C contrib/diff-highlight prefix=/usr
}

check() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"
  local jobs
  jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
  mkdir -p /dev/shm/git-test

  # explicitly specify SHELL to avoid a test failure in t/t9903-bash-prompt.sh
  # which is caused by 'git rebase' trying to use builduser's SHELL inside the
  # build chroot (i.e.: /usr/bin/nologin)
  SHELL=/bin/sh \
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE2=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    MAN_BOLD_LITERAL=1 \
    NO_SVN_TESTS=y \
    DEFAULT_TEST_TARGET=prove \
    GIT_PROVE_OPTS="$jobs -Q" \
    GIT_TEST_OPTS="--root=/dev/shm/git-test" \
    test
}

package() {
  export PYTHON_PATH='/usr/bin/python2'
  cd "$srcdir/$_name"
  make prefix=/usr gitexecdir=/usr/lib/git-core \
    CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
    USE_LIBPCRE2=1 \
    NO_CROSS_DIRECTORY_HARDLINKS=1 \
    MAN_BOLD_LITERAL=1 \
    INSTALLDIRS=vendor DESTDIR="$pkgdir" install install-doc

  # bash completion
  mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
  install -m644 ./contrib/completion/git-completion.bash "$pkgdir/usr/share/bash-completion/completions/git"

  # fancy git prompt
  mkdir -p "$pkgdir/usr/share/git/"
  install -m644 ./contrib/completion/git-prompt.sh "$pkgdir/usr/share/git/git-prompt.sh"

  # emacs
  make -C contrib/emacs prefix=/usr DESTDIR="$pkgdir" install

  # gnome credentials helper
  install -m755 contrib/credential/gnome-keyring/git-credential-gnome-keyring \
      "$pkgdir/usr/lib/git-core/git-credential-gnome-keyring"
  make -C contrib/credential/gnome-keyring clean

  # libsecret credentials helper
  install -m755 contrib/credential/libsecret/git-credential-libsecret \
      "$pkgdir/usr/lib/git-core/git-credential-libsecret"
  make -C contrib/credential/libsecret clean

  # subtree installation
  make -C contrib/subtree prefix=/usr gitexecdir=/usr/lib/git-core DESTDIR="$pkgdir" install install-doc

  # mediawiki installation
  make -C contrib/mw-to-git prefix=/usr gitexecdir=/usr/lib/git-core DESTDIR="$pkgdir" install

  # the rest of the contrib stuff
  find contrib/ -name '.gitignore' -delete
  cp -a ./contrib/* "$pkgdir/usr/share/git/"

  # scripts are for python 2.x
  sed -i 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find "$pkgdir" -name '*.py') \
    "$pkgdir/usr/share/git/remote-helpers/git-remote-bzr" \
    "$pkgdir/usr/share/git/remote-helpers/git-remote-hg"
  sed -i 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
    "$pkgdir/usr/share/git/svn-fe/svnrdump_sim.py"

  # perl modules from contrib/ install to site dir... move to vendor
  mv "$pkgdir"/usr/share/perl5/site_perl/Git/* "$pkgdir/usr/share/perl5/vendor_perl/Git/"
  rm -rf "$pkgdir/usr/share/perl5/site_perl"

  # remove perllocal.pod, .packlist, and empty directories.
  rm -rf "$pkgdir/usr/lib/perl5"

  # git-daemon via systemd socket activation
  install -D -m 644 "$srcdir/git-daemon@.service" "$pkgdir/usr/lib/systemd/system/git-daemon@.service"
  install -D -m 644 "$srcdir/git-daemon.socket" "$pkgdir/usr/lib/systemd/system/git-daemon.socket"
}
