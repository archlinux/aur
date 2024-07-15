# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=zsh-git
pkgname=('zsh-git' 'zsh-doc-git')
pkgver=5.9.r450.g09c5b10dc
pkgrel=1
arch=('x86_64')
url='https://www.zsh.org/'
license=('custom')
makedepends=('gdbm' 'git' 'libcap' 'pcre2' 'texlive-plaingeneric' 'yodl')
source=('zsh::git://git.code.sf.net/p/zsh/code'
        'zprofile')
sha256sums=('SKIP'
            '230832038c3b8f67fdb1b284ac5f68d709cdb7f1bc752b0e60657b9b9d091045')

pkgver() {
  cd zsh
  git describe --tags | sed 's/zsh-//;s/-/.r/;s/-/./g'
}

prepare() {
  cd zsh

  # Set correct keymap path
  sed -i 's#/usr/share/keymaps#/usr/share/kbd/keymaps#g' Completion/Unix/Command/_loadkeys

  # Remove unneeded and conflicting completion scripts
  for _fpath in AIX BSD Cygwin Darwin Debian Mandriva openSUSE Redhat Solaris; do
    rm -rf Completion/$_fpath
    sed 's#\s*Completion/'$_fpath'/\*/\*##g' -i Src/Zle/complete.mdd
  done

  rm Completion/Linux/Command/_pkgtool

  # regenerate configure script
  ./Util/preconfig
}

build() {
  cd zsh

  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/zsh \
    --htmldir=/usr/share/doc/zsh/html \
    --enable-etcdir=/etc/zsh \
    --enable-zshenv=/etc/zsh/zshenv \
    --enable-zlogin=/etc/zsh/zlogin \
    --enable-zlogout=/etc/zsh/zlogout \
    --enable-zprofile=/etc/zsh/zprofile \
    --enable-zshrc=/etc/zsh/zshrc \
    --enable-maildir-support \
    --with-term-lib='ncursesw' \
    --enable-multibyte \
    --enable-function-subdirs \
    --enable-fndir=/usr/share/zsh/functions \
    --enable-scriptdir=/usr/share/zsh/scripts \
    --with-tcsetpgrp \
    --enable-pcre \
    --enable-gdbm \
    --enable-cap \
    --enable-zsh-secure-free
  make

  make -C Doc zsh.pdf
}

check() {
  cd zsh
  HOME="${srcdir}" make check
}

package_zsh-git() {
  pkgdesc='A very advanced and programmable command interpreter (shell) for UNIX'
  depends=('pcre2' 'libcap' 'gdbm')
  conflicts=('zsh')
  provides=('zsh')
  optdepends=(
    "grml-zsh-config: grml's zsh setup"
    'zsh-autosuggestions: Fish-like autosuggestions for zsh'
    'zsh-completions: Additional completion definitions for Zsh'
    'zsh-doc: Info, HTML and PDF format of the ZSH documentation'
    'zsh-history-substring-search: ZSH port of Fish history search (up arrow)'
    'zsh-lovers: A collection of tips, tricks and examples for the Z shell.'
    'zsh-syntax-highlighting: Fish shell like syntax highlighting for Zsh'
    'zshdb: A debugger for zsh scripts')
  backup=('etc/zsh/zprofile')
  install=zsh.install

  cd zsh
  make DESTDIR="${pkgdir}/" install
  install -D -m644 "${srcdir}/zprofile" "${pkgdir}/etc/zsh/zprofile"
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_zsh-doc-git() {
  pkgdesc='Info, HTML and PDF format of the ZSH documentation'
  conflicts=('zsh-doc')
  provides=('zsh-doc')

  cd zsh
  make DESTDIR="${pkgdir}/" install.info install.html
  install -D -m644 Doc/zsh.pdf "${pkgdir}/usr/share/doc/zsh/zsh.pdf"
  install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
