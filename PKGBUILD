# Maintainer: sfs <sfslinux@gmail.com>
# mc6-git: development build of the mc6 fork, from git master.

pkgname=(mc6-git mc6-plugins-git)
pkgbase=mc6-git
pkgver=6.0.3.56.g06c750c79
pkgrel=1
pkgdesc='Midnight Commander with Plugins (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/ilia-maslakov/mcdev/wiki'
license=('GPL-3.0-or-later')
makedepends=('git' 'autoconf' 'automake' 'libtool' 'make' 'pkgconf' 'gettext'
             'glib2' 'slang' 'gpm' 'e2fsprogs' 'libssh2' 'curl' 
             #'samba'
             'libarchive' 'file' 
             #'mongo-c-driver'
             )
options=('!emptydirs')
source=('git+https://github.com/ilia-maslakov/mcdev.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mcdev"
  git describe --long --always --tags | sed 's/^v//; s/-/./g'
}

build() {
  cd "${srcdir}/mcdev"
  ./autogen.sh
  # Everything is installed under mc6-named directories so that mc6-git can
  # coexist with the stock `mc` package: binaries (mc6-bin, mce6/mcv6/mcd6),
  # /etc/mc6/mc, /usr/share/mc6/mc, /usr/lib/mc6/mc and the plugins.
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/mc6 \
    --libexecdir=/usr/lib/mc6 \
    --libdir=/usr/lib \
    --datadir=/usr/share/mc6 \
    --mandir=/usr/share/mc6/man \
    --localedir=/usr/share/mc6/locale \
    --disable-static \
    --with-screen=slang \
    --with-panel-plugins-dir=/usr/lib/mc6/panel-plugins \
    --with-editor-plugins-dir=/usr/lib/mc6/editor-plugins \
    --enable-mcterm=yes \
    --enable-mctree-magic=yes \
--enable-panel-plugin-samba=no \
    --enable-panel-plugin-ftp=yes \
    --enable-panel-plugin-arcmc=yes \
    --enable-panel-plugin-s3=yes \
--enable-panel-plugin-mongo=no \
    --enable-vfs-sftp=yes \
    --enable-panel-plugin-shell-link=yes \
    --enable-shell-ssh2=yes
  make
}

package_mc6-git() {
  pkgdesc='Midnight Commander with Plugins (development version)'
  install=mc6-git.install
  # libe2p comes in through --enable-ext2fs-attr, which defaults to auto and
  # always finds the library here; libmagic through --enable-mctree-magic.
  depends=('glib2' 'slang' 'gpm' 'e2fsprogs' 'file')
  optdepends=('mc6-plugins-git: panel plugins for FTP, SFTP, S3, Samba, Docker, k8s, MongoDB'
              'aspell: spell checking in the editor'
              'hunspell: spell checking in the editor')
  conflicts=('mc6')
  backup=('etc/mc6/mc/ctags.keymap' 'etc/mc6/mc/edit.indent.rc'
          'etc/mc6/mc/filehighlight.ini' 'etc/mc6/mc/mc.default.keymap'
          'etc/mc6/mc/mc.emacs.keymap' 'etc/mc6/mc/mc.ext.ini'
          'etc/mc6/mc/mc.keymap' 'etc/mc6/mc/mc.menu' 'etc/mc6/mc/mc.vim.keymap'
          'etc/mc6/mc/mcedit.menu' 'etc/mc6/mc/panels.ftp.ini'
          'etc/mc6/mc/panels.git.ini' 'etc/mc6/mc/sfs.ini'
          'etc/mc6/mc/spell.keymap')

  cd "${srcdir}/mcdev"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/lib/mc6/panel-plugins"
  find "${pkgdir}" -name '*.la' -delete

  # Install under names that do not clash with the stock `mc` package.
  mv "${pkgdir}/usr/bin/mc" "${pkgdir}/usr/bin/mc6-bin"
  rm "${pkgdir}/usr/bin/mcedit" "${pkgdir}/usr/bin/mcview" "${pkgdir}/usr/bin/mcdiff"
  ln -s mc6-bin "${pkgdir}/usr/bin/mce6"
  ln -s mc6-bin "${pkgdir}/usr/bin/mcv6"
  ln -s mc6-bin "${pkgdir}/usr/bin/mcd6"

  # mc6-git keeps all of its state under $HOME/.mc6 so that it never touches
  # the ~/.config/mc profile of the stock mc. (MC_PROFILE_ROOT, lib/util.c)
  printf '%s\n' '#!/bin/sh' \
    'export MC_PROFILE_ROOT="${MC_PROFILE_ROOT:-$HOME/.mc6}"' \
    'exec /usr/bin/mc6-bin "$@"' | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mc6"

  # mc.keymap is installed as a symlink to mc.default.keymap, and pacman cannot
  # keep a symlink through the backup mechanism: the user's edits would be lost
  # on upgrade. Ship it as a file. (Arch FS#50889)
  rm "${pkgdir}/etc/mc6/mc/mc.keymap"
  cp "${pkgdir}"/etc/mc6/mc/mc{.default,}.keymap
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mc6-git/COPYING"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/mc6-git/CHANGELOG.md"
}

package_mc6-plugins-git() {
  pkgdesc='Panel plugins for mc6 (development version)'
  depends=("mc6-git=${pkgver}-${pkgrel}" 'glib2' 'libssh2' 'curl' 
	    #'samba'
           'libarchive' 'file' 
           #'mongo-c-driver'
           )

  cd "${srcdir}/mcdev"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/etc" "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  # Keep the plugin modules and nothing else: naming what to drop instead left
  # cons.saver and the shell wrappers in both packages, and pacman refuses to
  # install two packages that own the same file.
  find "${pkgdir}/usr/lib/mc6" -mindepth 1 -maxdepth 1 ! -name panel-plugins \
    -exec rm -rf {} +
  find "${pkgdir}" -name '*.la' -delete
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mc6-plugins-git/COPYING"
}
